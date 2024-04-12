defmodule Vaccinationcard.VaccinationService do
  alias Vaccinationcard.Models.Vaccination
  alias Vaccinationcard.Repo
  import Ecto.Query

  def get_vaccination_card_by_user(%{"user_id" => user_id}) do
    user_id
    |> String.to_integer()
    |> get_vaccination_card()
  rescue
    _ -> {:error, :invalid_params}
  end

  def get_vaccination_card_by_user(_params), do: {:error, :invalid_params}

  def create_vaccination(%{"user_id" => user_id} = params) do
    %Vaccination{}
    |> Vaccination.changeset(params)
    |> Repo.insert
  end

  def create_vaccination(_params), do: {:error, :invalid_params}

  def update_vaccination(%{"id" => id} = params) do
    case Repo.get(Vaccination, String.to_integer(id)) do
      nil -> {:error, :not_found}
      vaccination ->
        vaccination
        |> Vaccination.changeset(params)
        |> Repo.update()
    end
  end

  def update_vaccination(_params), do: {:error, :invalid_params}

  defp get_vaccination_card(user_id) do
    query = from v in Vaccination, where: v.user_id == ^user_id
    vaccinations = Repo.all(query)
    {:ok, vaccinations}
  end


end
