defmodule VaccinationcardWeb.VaccinationsView do
  use VaccinationcardWeb, :view
  alias Vaccinationcard.Models.Vaccination

  def render("show_many.json", %{vaccination: %Vaccination{} = vaccination}) do
    %{vaccination: vaccination}
  end

  def render("create.json", %{vaccination: %Vaccination{} = vaccination}) do
    %{vaccination: vaccination}
  end

  def render("show.json", %{vaccination: %Vaccination{} = vaccination}) do
    %{vaccination: vaccination}
  end
end
