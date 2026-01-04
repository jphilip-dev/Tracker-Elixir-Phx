defmodule Tracker.Repo.Migrations.CreateExpenses do
  use Ecto.Migration

  def change do
    create table("expenses") do
      add :date, :date
      add :description, :string
      add :cost, :decimal
    end
  end
end
