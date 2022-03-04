defmodule HackathonWeb.Components do
  import Phoenix.LiveView.Helpers
  alias Phoenix.LiveView.JS
  alias HackathonWeb.Router.Helpers, as: Routes
  use Phoenix.HTML

  def community_bottom_bar(assigns) do
    ~H"""
    <div class="shadow-lg-above fixed bottom-0 flex-row w-full h-16 bg-red-500">
    </div>
    """
  end
end
