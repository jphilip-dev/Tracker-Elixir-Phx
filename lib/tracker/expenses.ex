defmodule Tracker.Expenses do
  alias Tracker.Expenses.Expense
  alias Tracker.Repo

  def list_all_expenses(), do: Repo.all(Expense)

  def get_expense_by_id(id), do: Repo.get(Expense, id)

  def create_expense(attrs) do
    new_expense = Expense.changeset(%Expense{}, attrs)
    Repo.insert(new_expense)
  end

  def update_expense(%Expense{} = expense, attrs) do
    expense
    |> Expense.changeset(attrs)
    |> Repo.update()
  end

   def delete_expense(%Expense{} = expense) do
    Repo.delete(expense)
  end
end
