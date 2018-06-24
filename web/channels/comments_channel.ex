defmodule Discuss.CommentsChannel do
  use Discuss.Web, :channel

  def join(topic, _auth_msg, socket) do
    {:ok, %{hey: "there"}, socket}
  end

  def handle_in(topic, message, socket) do
    IO.puts "+++++++++++++++++"
    IO.puts "+++++++++++++++++"
    IO.puts topic
    IO.puts "+++++++++++++++++"
    IO.puts "+++++++++++++++++"
    IO.inspect(message)
    IO.puts "+++++++++++++++++"
    IO.puts "+++++++++++++++++"
    {:reply, :ok, socket}
  end
end