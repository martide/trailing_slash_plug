defmodule TrailingSlashPlugTest do
  use ExUnit.Case
  doctest TrailingSlashPlug

  alias Plug.Conn

  describe "call/2" do
    test "redirects to the same path without trailing slash" do
      conn = %Conn{request_path: "/foo/"}
      response = TrailingSlashPlug.call(conn, [])
      assert response.status == 301
      assert {"location", "/foo"} in response.resp_headers
    end

    test "redirects to the same path without trailing slash and adds query_string " do
      conn = %Conn{request_path: "/foo/", query_string: "page=1"}
      response = TrailingSlashPlug.call(conn, [])
      assert response.status == 301
      assert {"location", "/foo?page=1"} in response.resp_headers
    end

    test "does not redirect when there is no trailing slash" do
      conn = %Conn{request_path: "/foo", status: 200}
      response = TrailingSlashPlug.call(conn, [])
      assert response.status == 200
      refute {"location", "/foo"} in response.resp_headers
    end

    test "does not redirect when path is equal to /" do
      conn = %Conn{request_path: "/", status: 200}
      
      response = TrailingSlashPlug.call(conn, [])
      assert response.status == 200
      refute {"location", "/"} in response.resp_headers
    end
  end
end
