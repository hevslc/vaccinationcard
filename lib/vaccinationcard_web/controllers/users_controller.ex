defmodule VaccinationcardWeb.UsersController do
  use VaccinationcardWeb, :controller
  alias Vaccinationcard.Models.User

  plug :put_view, json: VaccinationcardWeb.UserJSON

  def search_user_by_document(conn, filter) do
    with {:ok, %User{} = user} <- User.get_user_by(filter) do
      conn
      |> put_status(:ok)
      |> render("show.json", user: user)
    end
  end
end
