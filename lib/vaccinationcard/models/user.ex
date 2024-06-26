defmodule Vaccinationcard.Models.User do
  use Ecto.Schema
  alias Vaccinationcard.Models.{User, Vaccination}
  alias Vaccinationcard.Repo
  import Ecto.Changeset
  import Ecto.Query

  @fields [
    :name,
    :gender,
    :national_card,
    :rg,
    :cpf,
    :date_of_birth,
    :mother_name,
    :father_name,
    :situation,
    :address,
    :address_number,
    :city,
    :birthplace,
  ]

  schema "users" do
    field :name,              :string
    field :gender,            :string
    field :national_card,     :integer
    field :rg,                :string
    field :cpf,               :string
    field :date_of_birth,     :date
    field :mother_name,       :string
    field :father_name,       :string
    field :situation,         :string
    field :address,           :string
    field :address_number,    :integer
    field :city,              :string
    field :birthplace,        :string

    has_many :vaccinations, Vaccination

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, %{} = params) do
    struct
    |> cast(params, @fields)
    |> validate_required([:name, :gender, :national_card, :cpf])
  end

  def create(params) do
    params
    |> changeset()
    |> Repo.insert()
  end

  def get_by(%{"national_card" => national_card}) do
    query = from u in User, where: u.national_card == ^national_card
    get_by_query(query)
  end

  def get_by(%{"rg" => rg}) do
    query = from u in User, where: u.rg == ^rg
    get_by_query(query)
  end

  def get_by(%{"cpf" => cpf}) do
    query = from u in User, where: u.cpf == ^cpf
    get_by_query(query)
  end

  def get_by(_params), do: {:error, :invalid_params}

  defp get_by_query(query) do
    case Repo.one(query) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
