defmodule Tracker.Expenses.Expense do
  use Ecto.Schema

  schema "expenses" do
    field :date, :date
    field :description, :string
    field :cost, :decimal
  end
end
