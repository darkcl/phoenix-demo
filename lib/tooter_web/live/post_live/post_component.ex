defmodule TooterWeb.PostLive.PostComponent do
  use TooterWeb, :live_component

  def render(assigns) do
    ~L"""
    <tr id="post-<%= @post.id %>">
      <td><%= @post.username %></td>
      <td><%= @post.body %></td>
      <td><%= @post.likes_count %></td>
      <td><%= @post.reposts_count %></td>

      <td>
        <span><%= live_patch "Edit", to: Routes.post_index_path(@socket, :edit, @post) %></span>
        <span><a href="#" phx-click="like" phx-target="<%= @myself %>">Like</a></span>
        <span><a href="#" phx-click="repost" phx-target="<%= @myself %>">Repost</a></span>
      </td>
    </tr>
    """
  end

  def handle_event("like", _, socket) do
    Tooter.Timeline.inc_likes(socket.assigns.post)
    {:noreply, socket}
  end

  def handle_event("repost", _, socket) do
    Tooter.Timeline.inc_reposts(socket.assigns.post)
    {:noreply, socket}
  end
end
