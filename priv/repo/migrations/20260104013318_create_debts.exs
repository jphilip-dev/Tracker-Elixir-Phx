defmodule Tracker.Repo.Migrations.CreateDebts do
  use Ecto.Migration

  def change do
    create table("debts") do
      add :date, :date
      add :lender, :string
      add :amount_owed, :decimal
    end
  end
end
