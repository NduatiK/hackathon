defmodule HackathonWeb.CommunityLive.Show do
  use HackathonWeb, :live_view

  alias Hackathon.Communities

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    socket
    |> assign(:page_title, page_title(socket.assigns.live_action))
    |> assign(:community, Communities.get_community!(id))
    |> assign(:past_events, Communities.get_community_events(id, past: true))
    |> assign(:future_events, Communities.get_community_events(id, future: true))
    |> then(&{:noreply, &1})
  end

  defp page_title(:show), do: "Show Community"
  defp page_title(:edit), do: "Edit Community"
end
