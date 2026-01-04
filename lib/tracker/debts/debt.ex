defmodule Tracker.Debts.Debt do

  use Ecto.Schema
  import Ecto.Changeset

  schema "debts" do
    field :date, :date
    field :lender, :string
    field :amount_owed, :decimal
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, [:date, :lender, :amount_owed])
    |> validate_required([:date, :lender, :amount_owed])
  end
end
