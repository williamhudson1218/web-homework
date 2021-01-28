defmodule Homework.Repo.Migrations.AddAvailableCreditTrigger do
  use Ecto.Migration

  def change do
    execute "CREATE TRIGGER UpdateAvailableCredit
    AFTER INSERT OR UPDATE ON transactions
    FOR EACH ROW
    EXECUTE PROCEDURE update_available_credit();"
  end
end
