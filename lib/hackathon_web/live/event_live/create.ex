defmodule HackathonWeb.EventLive.Create do
  use HackathonWeb, :live_view

  alias Hackathon.Communities, as: Events
  alias Hackathon.Communities.Event

  @impl true
  def mount(%{"community_id" => community_id}, _session, socket) do
    event = %Event{}

    changeset = Events.change_event(event)

    {:ok,
     socket
     |> assign(:action, :new)
     |> assign(:event, event)
     |> assign(:community_id, community_id)
     |> assign(:return_to, fn id -> Routes.event_show_path(socket, :show, community_id, id) end)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"event" => event_params}, socket) do
    changeset =
      socket.assigns.event
      |> Events.change_event(Map.put(event_params, "community_id", socket.assigns.community_id))
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"event" => event_params}, socket) do
    save_event(socket, socket.assigns.action, event_params)
  end

  defp save_event(socket, :edit, event_params) do
    case Events.update_event(socket.assigns.event, event_params) do
      {:ok, event} ->
        {:noreply,
         socket
         |> put_flash(:info, "Event updated successfully")
         |> push_redirect(to: socket.assigns.return_to.(event.id))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_event(socket, :new, event_params) do
    case Events.create_event(Map.put(event_params, "community_id", socket.assigns.community_id)) do
      {:ok, event} ->
        {:noreply,
         socket
         |> put_flash(:info, "Event created successfully")
         |> push_redirect(to: socket.assigns.return_to.(event.id))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
