defmodule Homework.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Homework.Companies.Company

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "users" do
    field(:dob, :string)
    field(:first_name, :string)
    field(:last_name, :string)

    belongs_to(:company, Company, type: :binary_id, foreign_key: :company_id)

    timestamps()
  end

  @spec changeset(
          {map, map} | %{:__struct__ => atom | %{__changeset__: map}, optional(atom) => any},
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :dob, :company_id])
    |> validate_required([:first_name, :last_name, :dob, :company_id])
  end
end
