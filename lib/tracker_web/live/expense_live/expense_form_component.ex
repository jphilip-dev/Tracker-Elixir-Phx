defmodule TrackerWeb.ExpenseLive.ExpenseFormComponent do
  use TrackerWeb, :live_component

  alias Tracker.Expenses

  def handle_event("save", params, socket) do
    # TODO: Use Case
    {:ok, expense} = Expenses.create_expense(params)

    notify_parent({:expense_created, expense})

    {:noreply,
     socket
     |> put_flash(:info, "Expense created successfully")
     |> push_patch(to: socket.assigns.patch)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to add Expense records in your database.</:subtitle>
      </.header>

      <%!-- TODO: Utilize changeset / validation --%>
      <.simple_form for={%{}}  phx-submit="save" phx-target={@myself}>
           <.input type="date" name="date" value= "" label="Date"/>
           <.input type="text" name="description" value= "" label="Description"/>
           <.input type="number" step="0.01" name="cost" value= "" label="Cost"/>
          <:actions>
              <.button>Save</.button>
          </:actions>
        </.simple_form>
    </div>
    """
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
