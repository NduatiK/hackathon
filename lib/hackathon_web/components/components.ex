defmodule HackathonWeb.Components do
  import Phoenix.LiveView.Helpers
  alias Phoenix.LiveView.JS
  alias HackathonWeb.Router.Helpers, as: Routes
  use Phoenix.HTML

  def community_bottom_bar(assigns) do
    ~H"""
    <div
      class="shadow-lg-above fixed bottom-0 flex flex-row items-center justify-center w-full h-16 px-4 py-1 text-sm bg-white"
    >
      <.bottom_bar
        selected={@current == :events}
        to={Routes.community_show_path(HackathonWeb.Endpoint, :show, @id)}
        icon={:calendar}
        text="Events"
      />
      <.bottom_bar
        selected={@current == :chat}
        to={Routes.community_chat_path(HackathonWeb.Endpoint, :chat, @id)}
        icon={:chat}
        text="Group Chat"
      />
    </div>
    """
  end

  @spec bottom_bar(any) :: Phoenix.LiveView.Rendered.t()
  def bottom_bar(assigns) do
    ~H"""
    <%= live_patch to: @to, class: "w-full h-full " do %>
      <div
        class={
          "flex flex-col items-center justify-center w-full h-full transition-all " <>
            " " <>
            if @selected,
              do: "bg-purple-200 rounded-lg text-purple-700 duration-300",
              else: "bg-white rounded-lg text-gray-700"
        }
      >
        <HackathonWeb.Icons.icon icon={@icon} size={18} />
        <span class=""><%= @text %></span>
      </div>
    <% end %>
    """
  end
end
