defmodule VaccinationcardWeb.VaccinationsController do
  use VaccinationcardWeb, :controller
  alias Vaccinationcard.Models.Vaccination
  alias Vaccinationcard.VaccinationService
  alias VaccinationcardWeb.ErrorView

  plug :put_view, json: VaccinationcardWeb.VaccinationsJSON

  def get_vaccination_card_by_user(conn, filter) do
    with {:ok, vaccinations} <- VaccinationService.get_vaccination_card_by_user(filter) do
      conn
      |> put_status(:ok)
      |> render("show_many.json", vaccinations: vaccinations)
    else
      {:error, :invalid_params} ->
        conn
        |> put_status(400)
        |> put_view(json: VaccinationcardWeb.ErrorJSON)
        |> render(:"400")
    end
  end

  def create(conn, params) do
    with {:ok, %Vaccination{} = vaccination} <- VaccinationService.create_vaccination(params) do
      conn
      |> put_status(:created)
      |> render("create.json", vaccination: vaccination)
    else
      {:error, changeset} ->
        conn
        |> put_status(:bad_request)
        |> put_view(ErrorView)
        |> render("400.json", result: changeset)
    end
  end
end
