defmodule VaccinationcardWeb.UserJSON do
  alias Vaccinationcard.Models.User

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%User{} = user) do
    %{
      name: user.name,
      gender: user.gender,
      national_card: user.national_card,
      rg: user.rg,
      cpf: user.cpf,
      date_of_birth: user.date_of_birth,
      mother_name: user.mother_name,
      father_name: user.father_name,
      situation: user.situation,
      address: user.address,
      address_number: user.address_number,
      city: user.city,
      birthplace: user.birthplace,
    }
  end
end
