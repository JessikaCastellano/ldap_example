defmodule LdapExampleWeb.PageController do
  use LdapExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
