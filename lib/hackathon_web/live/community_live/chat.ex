defmodule HackathonWeb.CommunityLive.Chat do
  use HackathonWeb, :live_view

  alias Hackathon.Communities
  @topic "messages"
  @impl true
  def mount(_params, session, socket) do
    HackathonWeb.Endpoint.subscribe(@topic)

    socket =
      socket
      |> assign_defaults(session)

    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:community, Communities.get_community!(id))
     |> assign(
       :messages,
       Hackathon.Messaging.list_messages()
       #  [
       #  %{from: "1", text: "We must " <> Faker.Company.bs()},
       #  %{from: "1", text: "We must " <> Faker.Company.bs()},
       #  %{from: "me", text: "We must " <> Faker.Company.bs()},
       #  %{from: "1", text: "We must " <> Faker.Company.bs()},
       #  %{from: "me", text: "We must " <> Faker.Company.bs()},
       #  %{from: "1", text: "We must " <> Faker.Company.bs()},
       #  %{from: "me", text: "We must " <> Faker.Company.bs()},
       #  %{from: "1", text: "We must " <> Faker.Company.bs()},
       #  %{from: "me", text: "We must " <> Faker.Company.bs()},
       #  %{from: "1", text: "We must " <> Faker.Company.bs()},
       #  %{from: "me", text: "We must " <> Faker.Company.bs()},
       #  %{from: "1", text: "We must " <> Faker.Company.bs()},
       #  %{from: "me", text: "We must " <> Faker.Company.bs()},
       #  %{from: "me", text: "We must " <> Faker.Company.bs()},
       #  %{from: "1", text: "We must " <> Faker.Company.bs()},
       #  %{from: "me", text: "We must " <> Faker.Company.bs()}
       #  ]
     )}
  end

  defp page_title(:chat), do: "Show Community"

  def handle_event("send_msg", %{"message" => msg}, socket) do
    status =
      Req.post!("http://127.0.0.1:5000/sentiment", {:form, [{"text", msg}]})
      |> then(fn res -> Jason.decode!(res.body)["message"]["output"] end)

    emotion =
      Req.post!("http://127.0.0.1:5000/emotion", {:form, [{"text", msg}]})
      |> then(fn res -> Jason.decode!(res.body)["message"]["output"] end)

    {:ok, msg} =
      %{
        from: socket.assigns.current_user.id,
        text: msg,
        sentiment:
          case status do
            "NUE" -> "NEUTRAL"
            other -> other
          end,
        emotion: emotion
      }
      |> Hackathon.Messaging.create_message()

    HackathonWeb.Endpoint.broadcast_from(self(), @topic, "message", msg)

    socket
    |> assign(:messages, [
      msg
      | socket.assigns.messages
    ])
    |> then(&{:noreply, &1})
  end

  def handle_info(event, socket) do
    msg =
      event.payload
      |> IO.inspect()

    # if msg.from != inspect(self) do
    socket
    |> assign(:messages, [
      msg
      | socket.assigns.messages
    ])
    |> then(&{:noreply, &1})

    # else
    #   {:noreply, socket}
    # end
  end
end
