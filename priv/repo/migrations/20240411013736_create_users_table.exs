defmodule Vaccinationcard.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table :users do
      add :name,              :string
      add :gender,            :string
      add :national_card,     :integer
      add :rg,                :string
      add :cpf,               :string
      add :date_of_birth,     :date
      add :mother_name,       :string
      add :father_name,       :string
      add :situation,         :string
      add :address,           :string
      add :address_number,    :integer
      add :city,              :string
      add :birthplace,        :string

      timestamps()
    end

    create unique_index(:users, [:name])
    create unique_index(:users, [:cpf])
    create unique_index(:users, [:rg])
  end
end
