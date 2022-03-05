defmodule HackathonWeb.EventLive.Show do
  use HackathonWeb, :live_view

  alias Hackathon.Communities

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id, "community_id" => community_id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:community_id, community_id)
     |> assign(:event, Communities.get_event!(id))}
  end

  defp page_title(:show), do: "Show Event"
  defp page_title(:edit), do: "Edit Event"
end
