defmodule HackathonWeb.CommunityLive.Chat do
  use HackathonWeb, :live_view

  alias Hackathon.Communities

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:community, Communities.get_community!(id))
     |> assign(:messages, [
       %{from: "1", text: "We must " <> Faker.Company.bs()},
       %{from: "1", text: "We must " <> Faker.Company.bs()},
       %{from: "me", text: "We must " <> Faker.Company.bs()},
       %{from: "1", text: "We must " <> Faker.Company.bs()},
       %{from: "me", text: "We must " <> Faker.Company.bs()},
       %{from: "1", text: "We must " <> Faker.Company.bs()},
       %{from: "me", text: "We must " <> Faker.Company.bs()},
       %{from: "1", text: "We must " <> Faker.Company.bs()},
       %{from: "me", text: "We must " <> Faker.Company.bs()},
       %{from: "1", text: "We must " <> Faker.Company.bs()},
       %{from: "me", text: "We must " <> Faker.Company.bs()},
       %{from: "1", text: "We must " <> Faker.Company.bs()},
       %{from: "me", text: "We must " <> Faker.Company.bs()},
       %{from: "me", text: "We must " <> Faker.Company.bs()},
       %{from: "1", text: "We must " <> Faker.Company.bs()},
       %{from: "me", text: "We must " <> Faker.Company.bs()}
     ])}
  end

  defp page_title(:chat), do: "Show Community"

  def handle_event("send_msg", %{"message" => msg}, socket) do
    status =
      Req.post!("http://127.0.0.1:5000/sentiment", {:form, [{"text", msg}]})
      |> then(fn res -> Jason.decode!(res.body)["message"]["output"] end)

    emotion =
      Req.post!("http://127.0.0.1:5000/emotion", {:form, [{"text", msg}]})
      |> then(fn res -> Jason.decode!(res.body)["message"]["output"] end)

    socket
    |> assign(:messages, [
      %{
        from: "me",
        text: msg,
        sentiment: status,
        emotion: emotion
      }
      | socket.assigns.messages
    ])
    |> then(&{:noreply, &1})
  end
end
