defmodule Discuss.AuthController do
  use Discuss.Web, :controller
  plug Ueberauth

  def callback(conn, params) do
    IO.puts "+++++++++++++++"
    IO.puts "+++++++++++++++"
    IO.inspect conn.assigns
    IO.puts "+++++++++++++++"
    IO.puts "+++++++++++++++"
    IO.inspect params
    IO.puts "+++++++++++++++"
    IO.puts "++++++++++ets+++++"
  end
end