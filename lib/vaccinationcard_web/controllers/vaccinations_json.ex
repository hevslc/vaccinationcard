defmodule VaccinationcardWeb.VaccinationsJSON do
  alias Vaccinationcard.Models.Vaccination

  @doc """
  Renders vaccination created
  """
  def create(%{vaccination: vaccination}) do
    %{data: data(vaccination)}
  end

  @doc """
  Renders a list of vaccinations.
  """
  def show_many(%{vaccinations: vaccinations}) do
    %{data: for(vaccination <- vaccinations, do: data(vaccination))}
  end

  @doc """
  Renders a single vaccination.
  """
  def show(%{vaccination: vaccination}) do
    %{data: data(vaccination)}
  end

  defp data(%Vaccination{} = vaccination) do
    %{
      id: vaccination.id,
      name: vaccination.name,
      dose: Vaccination.translate_dose(vaccination.dose),
      type: vaccination.type,
      date: vaccination.date,
      lote: vaccination.lote,
      user_id: vaccination.user_id,
    }
  end
end
