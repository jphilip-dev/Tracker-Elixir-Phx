defmodule TrackerWeb.ExpenseLive.Index do
  use TrackerWeb, :live_view

  alias Tracker.Expenses

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :expenses, Expenses.list_all_expenses())}
  end

  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  def handle_info({TrackerWeb.ExpenseLive.ExpenseFormComponent, {:expense_created, expense}}, socket) do

    assigns = socket.assigns

    IO.inspect(assigns)

    current_expenses = assigns.expenses
    updated_expenses = [expense | current_expenses]

    # Refresh from db call or add the new expense
    {:noreply, assign(socket, :expenses, updated_expenses)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Expenses")
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Expense")
  end
end
