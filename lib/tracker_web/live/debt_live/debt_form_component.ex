defmodule TrackerWeb.DebtLive.DebtFormComponent do
  use TrackerWeb, :live_component

  alias Tracker.Debts

   def handle_event("save", params, socket) do
    #TODO: Use Case
    {:ok, debt} = Debts.create_debt(params)

    notify_parent({:debt_created, debt})
     {:noreply,
         socket
         |> put_flash(:info, "Debt created successfully")
         |> push_patch(to: socket.assigns.patch)}

  end

  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to add debt records in your database.</:subtitle>
      </.header>

      <%!-- TODO: Utilize changeset / validation --%>
      <.simple_form for={%{}}  phx-submit="save" phx-target={@myself}>
           <.input type="date" name="date" value= "" label="Date"/>
           <.input type="text" name="lender" value= "" label="Lender"/>
           <.input type="number" step="0.01" name="amount_owed" value= "" label="Amount Owed"/>
          <:actions>
              <.button>Save</.button>
          </:actions>
        </.simple_form>
    </div>
    """
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
