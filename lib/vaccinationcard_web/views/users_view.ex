defmodule VaccinationcardWeb.UsersView do
  use VaccinationcardWeb, :view
  alias Vaccinationcard.Models.User


  def render("show.json", %{user: %User{} = user}), do: %{user: user}
end
