defmodule HackathonWeb.Icons do
  use Phoenix.HTML
  import Phoenix.LiveView.Helpers

  def icon(assigns) do
    ~H"""
    <div class={"inline-flex " <> (assigns[:class] || "")}>
      <%= {:safe, render_icon(@icon, assigns[:size] || 16)} %>
    </div>
    """
  end

  defp render_icon(:send, size) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" width=#{size} height=#{size} viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-send"><line x1="22" y1="2" x2="11" y2="13"></line><polygon points="22 2 15 22 11 13 2 9 22 2"></polygon></svg>
    """
  end

  defp render_icon(:chat, size) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" width=#{size} height=#{size}  viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
    """
  end

  defp render_icon(:calendar, size) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" width=#{size} height=#{size} viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
    """
  end

  defp render_icon(:save, size) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" width=#{size} height=#{size} viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-save"><path d="M19 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11l5 5v11a2 2 0 0 1-2 2z"></path><polyline points="17 21 17 13 7 13 7 21"></polyline><polyline points="7 3 7 8 15 8"></polyline></svg>
    """
  end

  defp render_icon(:arrow_left, size) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24" width=#{size} height=#{size}><g><path fill="none" d="M0 0h24v24H0z"/><path d="M7.828 11H20v2H7.828l5.364 5.364-1.414 1.414L4 12l7.778-7.778 1.414 1.414z"/></g></svg>
    """
  end

  defp render_icon(:arrow_right, size) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24" width=#{size} height=#{size}><g xmlns="http://www.w3.org/2000/svg"><path fill="none" d="M0 0h24v24H0z"/><path d="M16.172 11l-5.364-5.364 1.414-1.414L20 12l-7.778 7.778-1.414-1.414L16.172 13H4v-2z"/></g></svg>
    """
  end

  defp render_icon(:link, size) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24" width=#{size} height=#{size}><g xmlns="http://www.w3.org/2000/svg">
    <path fill="none" d="M0 0h24v24H0z"/>
    <path d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm0-2a8 8 0 1 0 0-16 8 8 0 0 0 0 16zM11 7h2v2h-2V7zm0 4h2v6h-2v-6z"/>
    </g></svg>
    """
  end

  defp render_icon(:close, size) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24" width=#{size} height=#{size}><g xmlns="http://www.w3.org/2000/svg">
    <g xmlns="http://www.w3.org/2000/svg">
        <path fill="none" d="M0 0h24v24H0z"/>
        <path d="M12 10.586l4.95-4.95 1.414 1.414-4.95 4.95 4.95 4.95-1.414 1.414-4.95-4.95-4.95 4.95-1.414-1.414 4.95-4.95-4.95-4.95L7.05 5.636z"/>
    </g>
    </svg>
    """
  end

  defp render_icon(:search, size) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24" width=#{size} height=#{size}><g xmlns="http://www.w3.org/2000/svg">
    <g xmlns="http://www.w3.org/2000/svg">
    <path fill="none" d="M0 0h24v24H0z"/>
    <path d="M18.031 16.617l4.283 4.282-1.415 1.415-4.282-4.283A8.96 8.96 0 0 1 11 20c-4.968 0-9-4.032-9-9s4.032-9 9-9 9 4.032 9 9a8.96 8.96 0 0 1-1.969 5.617zm-2.006-.742A6.977 6.977 0 0 0 18 11c0-3.868-3.133-7-7-7-3.868 0-7 3.132-7 7 0 3.867 3.132 7 7 7a6.977 6.977 0 0 0 4.875-1.975l.15-.15z"/>
    </g>
    </svg>
    """
  end

  defp render_icon(:chevron_right, size) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width=#{size} height=#{size}>
    <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"/>
    </svg>
    """
  end

  defp render_icon(:chevron_down, size) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" width=#{size} height=#{size} viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg>
    """
  end

  defp render_icon(:check_circle, size) do
    """
    <svg  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width=#{size} height=#{size}>
    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
    </svg>
    """
  end

  defp render_icon(:x, size) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" width=#{size} height=#{size}>
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
    </svg>
    """
  end

  defp render_icon(:trash, size) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" width=#{size} height=#{size}>
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
    </svg>

    """
  end

  #
  # EDITOR
  #
  defp render_icon(:bold, size) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24" width=#{size} height=#{size}>
    <g>
        <path fill="none" d="M0 0h24v24H0z"/>
        <path d="M8 11h4.5a2.5 2.5 0 1 0 0-5H8v5zm10 4.5a4.5 4.5 0 0 1-4.5 4.5H6V4h6.5a4.5 4.5 0 0 1 3.256 7.606A4.498 4.498 0 0 1 18 15.5zM8 13v5h5.5a2.5 2.5 0 1 0 0-5H8z"/>
    </g>
    </svg>
    """
  end

  defp render_icon(:italic, size) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24" width=#{size} height=#{size}>
    <g>
    <path fill="none" d="M0 0h24v24H0z"/>
    <path d="M15 20H7v-2h2.927l2.116-12H9V4h8v2h-2.927l-2.116 12H15z"/>
    </g>
    </svg>
    """
  end

  defp render_icon(:underline, size) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24" width=#{size} height=#{size}>
    <g>
    <path fill="none" d="M0 0h24v24H0z"/>
    <path d="M8 3v9a4 4 0 1 0 8 0V3h2v9a6 6 0 1 1-12 0V3h2zM4 20h16v2H4v-2z"/>
    </g>
    </svg>
    """
  end

  defp render_icon(:strikethrough, size) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24" width=#{size} height=#{size}>
    <g>
        <path fill="none" d="M0 0h24v24H0z"/>
        <path d="M17.154 14c.23.516.346 1.09.346 1.72 0 1.342-.524 2.392-1.571 3.147C14.88 19.622 13.433 20 11.586 20c-1.64 0-3.263-.381-4.87-1.144V16.6c1.52.877 3.075 1.316 4.666 1.316 2.551 0 3.83-.732 3.839-2.197a2.21 2.21 0 0 0-.648-1.603l-.12-.117H3v-2h18v2h-3.846zm-4.078-3H7.629a4.086 4.086 0 0 1-.481-.522C6.716 9.92 6.5 9.246 6.5 8.452c0-1.236.466-2.287 1.397-3.153C8.83 4.433 10.271 4 12.222 4c1.471 0 2.879.328 4.222.984v2.152c-1.2-.687-2.515-1.03-3.946-1.03-2.48 0-3.719.782-3.719 2.346 0 .42.218.786.654 1.099.436.313.974.562 1.613.75.62.18 1.297.414 2.03.699z"/>
    </g>
    </svg>
    """
  end
end
