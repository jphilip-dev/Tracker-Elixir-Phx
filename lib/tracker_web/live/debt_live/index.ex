defmodule TrackerWeb.DebtLive.Index do
  use TrackerWeb, :live_view

  alias Tracker.Debts

   def mount(_params, _session, socket) do
    {:ok, assign(socket,:debts, Debts.list_all_debts)}
  end

  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

   def handle_info({TrackerWeb.DebtLive.DebtFormComponent, {:debt_created, debt}}, socket) do

    assigns = socket.assigns
    current_debts = assigns.debts
    updated_debts = [debt | current_debts]

    {:noreply, assign(socket,:debts, updated_debts)} # Refresh from db call or add the new debt
  end


  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Debts")
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Debt")
  end

end
