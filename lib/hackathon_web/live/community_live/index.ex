defmodule HackathonWeb.CommunityLive.Index do
  use HackathonWeb, :live_view

  alias Hackathon.Communities
  alias Hackathon.Communities.Community

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :communities, list_communities())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Community")
    |> assign(:community, Communities.get_community!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Community")
    |> assign(:community, %Community{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Communities")
    |> assign(:community, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    community = Communities.get_community!(id)
    {:ok, _} = Communities.delete_community(community)

    {:noreply, assign(socket, :communities, list_communities())}
  end

  defp list_communities do
    Communities.list_communities()
  end
end
