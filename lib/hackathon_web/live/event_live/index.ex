defmodule HackathonWeb.EventLive.Index do
  use HackathonWeb, :live_view

  alias Hackathon.Communities
  alias Hackathon.Communities.Event

  @impl true
  def mount(%{"community_id" => community_id}, _session, socket) do
    {:ok,
     socket
     |> assign(:events, list_events())
     |> assign(:community_id, community_id)}
  end

  @impl true
  def handle_params(%{"community_id" => community_id} = params, _url, socket) do
    {:noreply,
     socket
     |> apply_action(socket.assigns.live_action, params)
     |> assign(:community_id, community_id)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Event")
    |> assign(:event, Communities.get_event!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Event")
    |> assign(:event, %Event{
      community: socket.assigns.community_id
    })
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Events")
    |> assign(:event, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    event = Communities.get_event!(id)
    {:ok, _} = Communities.delete_event(event)

    {:noreply, assign(socket, :events, list_events())}
  end

  defp list_events do
    Communities.list_events()
  end
end
