defmodule Vaccinationcard.Repo.Migrations.VaccinationsTable do
  use Ecto.Migration

  def change do
    create table :vaccinations do
      add :name,            :string
      add :dose,            :integer
      add :type,            :string
      add :date,            :date
      add :lote,            :string
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end
  end
end
