defmodule Tracker.Expenses.Expense do
  use Ecto.Schema
  import Ecto.Changeset

  schema "expenses" do
    field :date, :date
    field :description, :string
    field :cost, :decimal
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, [:date, :description, :cost])
    |> validate_required([:date, :description, :cost])
  end
end
