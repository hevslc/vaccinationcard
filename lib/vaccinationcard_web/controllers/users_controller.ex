defmodule VaccinationcardWeb.UsersController do
  use VaccinationcardWeb, :controller
  alias Vaccinationcard.Models.User

  plug :put_view, json: VaccinationcardWeb.UserJSON

  def search_user_by_document(conn, filter) do
    with {:ok, %User{} = user} <- User.get_user_by(filter) do
      conn
      |> put_status(:ok)
      |> render("show.json", user: user)
    else
      {:error, :not_found} ->
        conn
        |> put_status(404)
        |> put_view(json: VaccinationcardWeb.ErrorJSON)
        |> render(:"404")
      {:error, :invalid_params} ->
        conn
        |> put_status(400)
        |> put_view(json: VaccinationcardWeb.ErrorJSON)
        |> render(:"400")
    end
  end
end
