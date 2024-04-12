defmodule Vaccinationcard.Models.Vaccination do
  use Ecto.Schema
  alias Vaccinationcard.Models.{Vaccination, User}
  alias Vaccinationcard.Repo
  import Ecto.Changeset
  import Ecto.Query

  @fields [:name, :dose, :type, :date, :lote, :user_id]
  @acceptable_names [
    "BCG", "HEPATITE B", "TETRA VALENTE", "TRIPLICE BACTERIANA", "HAEMOPHILUS INFLUENZAE",
    "TRIPLICE ACELULAR", "PNEUMO 10 VALENTE", "MENINGO C", "ROTAVIRUS",
  ]
  @acceptable_types ["Faltoso", "Indicação", "Resgate", "Aplicação"]

  schema "vaccinations" do
    field :name,  :string
    field :dose,  :integer
    field :type,  :string
    field :date,  :date
    field :lote,  :string

    belongs_to :user, User

    timestamps()
  end

  def changeset(%{} = params) do
    %Vaccination{}
    |> cast(params, @fields)
    |> validate_required([:name, :dose, :user_id])
    |> validate_inclusion(:name, @acceptable_names)
    |> validate_inclusion(:dose, [1, 2, 3, 4, 5])
    |> validate_inclusion(:type, @acceptable_types)
    |> validate_existence(params)
  end

  def translate_dose(1), do: "1ª Dose"
  def translate_dose(2), do: "2ª Dose"
  def translate_dose(3), do: "3ª Dose"
  def translate_dose(4), do: "1º Reforço"
  def translate_dose(5), do: "2º Reforço"

  defp validate_existence(changeset, %{"name" => "BCG", "dose" => 2}) do
    invalid_vaccine_changeset(changeset)
  end

  defp validate_existence(changeset, %{"name" => "BCG", "dose" => 3}) do
    invalid_vaccine_changeset(changeset)
  end

  defp validate_existence(changeset, %{"name" => "BCG", "dose" => 5}) do
    invalid_vaccine_changeset(changeset)
  end

  defp validate_existence(changeset, %{"name" => "HEPATITE B", "dose" => 5}) do
    invalid_vaccine_changeset(changeset)
  end

  defp validate_existence(changeset, %{"name" => "TETRA VALENTE", "dose" => 5}) do
    invalid_vaccine_changeset(changeset)
  end

  defp validate_existence(changeset, %{"name" => "HAEMOPHILUS INFLUENZAE", "dose" => 4}) do
    invalid_vaccine_changeset(changeset)
  end

  defp validate_existence(changeset, %{"name" => "HAEMOPHILUS INFLUENZAE", "dose" => 5}) do
    invalid_vaccine_changeset(changeset)
  end

  defp validate_existence(changeset, %{"name" => "PNEUMO 10 VALENTE", "dose" => 5}) do
    invalid_vaccine_changeset(changeset)
  end

  defp validate_existence(changeset, %{"name" => "MENINGO C", "dose" => 3}) do
    invalid_vaccine_changeset(changeset)
  end

  defp validate_existence(changeset, %{"name" => "MENINGO C", "dose" => 5}) do
    invalid_vaccine_changeset(changeset)
  end

  defp validate_existence(changeset, %{"name" => "ROTAVIRUS", "dose" => 2}) do
    invalid_vaccine_changeset(changeset)
  end

  defp validate_existence(changeset, %{"name" => "ROTAVIRUS", "dose" => 3}) do
    invalid_vaccine_changeset(changeset)
  end

  defp validate_existence(changeset, %{"name" => "ROTAVIRUS", "dose" => 5}) do
    invalid_vaccine_changeset(changeset)
  end

  defp validate_existence(changeset, _params), do: changeset

  defp invalid_vaccine_changeset(changeset) do
    %{errors: errors} = changeset
    %{
      changeset
      | errors: [dose: {"Vacina inválida - Dose não permitida", []}] ++ errors,
        valid?: false
    }
  end
end
