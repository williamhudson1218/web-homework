defmodule Homework.Repo.Migrations.AddUpdateAvailableCreditProcedure do
  use Ecto.Migration

  def change do
    execute "CREATE FUNCTION update_available_credit()
    RETURNS TRIGGER AS $BODY$
    BEGIN
      UPDATE companies
      SET available_credit = (available_credit - NEW.amount)
      WHERE id = NEW.company_id;
      RETURN NEW;
    END;
    $BODY$ LANGUAGE plpgsql;"
  end
end
