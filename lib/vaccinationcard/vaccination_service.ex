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
    params
    |> Vaccination.changeset()
    |> Repo.insert
  end

  defp get_vaccination_card(user_id) do
    query = from v in Vaccination, where: v.user_id == ^user_id
    vaccinations = Repo.all(query)
    {:ok, vaccinations}
  end


end
