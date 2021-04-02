defmodule BlockClockWeb.PageLiveTest do
  use BlockClockWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "container"
    assert render(page_live) =~ "container"
  end
end
