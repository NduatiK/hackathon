defmodule HackathonWeb.CommunityLive.Create do
  use HackathonWeb, :live_view

  alias Hackathon.Communities
  alias Hackathon.Communities.Community

  @impl true
  def mount(_params, _session, socket) do
    community = %Community{
      coordinates: %{}
    }

    changeset = Communities.change_community(community)

    {:ok,
     socket
     |> assign(:action, :new)
     |> assign(:community, community)
     |> assign(:return_to, fn id -> Routes.community_show_path(socket, :show, id) end)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"community" => community_params}, socket) do
    changeset =
      socket.assigns.community
      |> Communities.change_community(community_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"community" => community_params}, socket) do
    save_community(socket, socket.assigns.action, community_params)
  end

  defp save_community(socket, :edit, community_params) do
    case Communities.update_community(socket.assigns.community, community_params) do
      {:ok, community} ->
        {:noreply,
         socket
         |> put_flash(:info, "Community updated successfully")
         |> push_redirect(to: socket.assigns.return_to.(community.id))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_community(socket, :new, community_params) do
    case Communities.create_community(community_params) do
      {:ok, community} ->
        {:noreply,
         socket
         |> put_flash(:info, "Community created successfully")
         |> push_redirect(to: socket.assigns.return_to.(community.id))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
