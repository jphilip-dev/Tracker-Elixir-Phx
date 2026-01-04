defmodule Tracker.Debts do
  alias Tracker.Debts.Debt
  alias Tracker.Repo

  def list_all_debts(), do: Repo.all(Debt)

  def get_debt_by_id(id), do: Repo.get(Debt, id)

  def create_debt(attrs) do
    new_debt = Debt.changeset(%Debt{}, attrs)
    Repo.insert(new_debt)
  end

  def update_debt(%Debt{} = debt, attrs) do
    debt
    |> Debt.changeset(attrs)
    |> Repo.update()
  end

   def delete_debt(%Debt{} = debt) do
    Repo.delete(debt)
  end
end
