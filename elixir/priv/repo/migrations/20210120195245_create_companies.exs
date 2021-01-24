defmodule Homework.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def up do
    create table(:companies, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:name, :string)
      add(:credit_line, :integer)
      #TODO: is there any need to for a database column
      #add(:available_credit, :integer)

      timestamps()
    end
  end
end
