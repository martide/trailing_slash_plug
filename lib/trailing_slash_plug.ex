defmodule TrailingSlashPlug do
  @moduledoc """
  A plug for removing slash at the end of request path and sending a 301 status

  A solution for removing slash
  [Onward debate](https://developers.google.com/search/blog/2010/04/to-slash-or-not-to-slash)

  # Examples

    #### Phoenix.Router

    pipeline :trailing_slash do
      plug(TrailingSlashPlug)
    end

    scope "/example", as: :public_pages do
      pipe_through([:trailing_slash])
    end
  """
  @behaviour Plug
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    path = conn.request_path

    if String.ends_with?(path, "/") && path != "/" do
      new_path = String.slice(path, 0..-2)

      conn
      |> put_status(301)
      |> put_resp_header("location", maybe_add_query_param(new_path, conn.query_string))
    else
      conn
    end
  end

  defp maybe_add_query_param(new_path, query_string) when query_string != "" do
    new_path <> "?#{query_string}"
  end

  defp maybe_add_query_param(new_path, _query_string), do: new_path
end
