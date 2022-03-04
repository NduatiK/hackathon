defmodule HackathonWeb.CommunityLiveTest do
  use HackathonWeb.ConnCase

  import Phoenix.LiveViewTest
  import Hackathon.CommunitiesFixtures

  @create_attrs %{
    coordinates: %{},
    description: "some description",
    location: "some location",
    name: "some name",
    visibility: :public
  }
  @update_attrs %{
    coordinates: %{},
    description: "some updated description",
    location: "some updated location",
    name: "some updated name",
    visibility: :private
  }
  @invalid_attrs %{coordinates: nil, description: nil, location: nil, name: nil, visibility: nil}

  defp create_community(_) do
    community = community_fixture()
    %{community: community}
  end

  describe "Index" do
    setup [:create_community]

    test "lists all communities", %{conn: conn, community: community} do
      {:ok, _index_live, html} = live(conn, Routes.community_index_path(conn, :index))

      assert html =~ "Listing Communities"
      assert html =~ community.description
    end

    test "saves new community", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.community_index_path(conn, :index))

      assert index_live |> element("a", "New Community") |> render_click() =~
               "New Community"

      assert_patch(index_live, Routes.community_index_path(conn, :new))

      assert index_live
             |> form("#community-form", community: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#community-form", community: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.community_index_path(conn, :index))

      assert html =~ "Community created successfully"
      assert html =~ "some description"
    end

    test "updates community in listing", %{conn: conn, community: community} do
      {:ok, index_live, _html} = live(conn, Routes.community_index_path(conn, :index))

      assert index_live |> element("#community-#{community.id} a", "Edit") |> render_click() =~
               "Edit Community"

      assert_patch(index_live, Routes.community_index_path(conn, :edit, community))

      assert index_live
             |> form("#community-form", community: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#community-form", community: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.community_index_path(conn, :index))

      assert html =~ "Community updated successfully"
      assert html =~ "some updated description"
    end

    test "deletes community in listing", %{conn: conn, community: community} do
      {:ok, index_live, _html} = live(conn, Routes.community_index_path(conn, :index))

      assert index_live |> element("#community-#{community.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#community-#{community.id}")
    end
  end

  describe "Show" do
    setup [:create_community]

    test "displays community", %{conn: conn, community: community} do
      {:ok, _show_live, html} = live(conn, Routes.community_show_path(conn, :show, community))

      assert html =~ "Show Community"
      assert html =~ community.description
    end

    test "updates community within modal", %{conn: conn, community: community} do
      {:ok, show_live, _html} = live(conn, Routes.community_show_path(conn, :show, community))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Community"

      assert_patch(show_live, Routes.community_show_path(conn, :edit, community))

      assert show_live
             |> form("#community-form", community: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#community-form", community: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.community_show_path(conn, :show, community))

      assert html =~ "Community updated successfully"
      assert html =~ "some updated description"
    end
  end
end
