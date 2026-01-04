defmodule Tracker.Debts.Debt do
  use Ecto.Schema

  schema "debts" do
    field :date, :date
    field :lender, :string
    field :amount_owed, :decimal
  end
end
