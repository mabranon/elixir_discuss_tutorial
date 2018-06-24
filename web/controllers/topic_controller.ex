defmodule Discuss.TopicController do
	use Discuss.Web, :controller

	alias Discuss.Topic

	@requires_auth ~w(new create edit update delete)a

	plug Discuss.Plugs.RequireAuth when action in @requires_auth

	def index(conn, _params) do
		topics = Repo.all(Topic)

		render conn, "index.html", topics: topics
	end

	def new(conn, _params) do
		changeset = Topic.changeset(%Topic{}, %{})

		render conn, "new.html", changeset: changeset
	end

	def create(conn, %{"topic" => topic_title}) do
		changeset = conn.assigns.user
			|> build_assoc(:topics)
			|> Topic.changeset(topic_title)

		case Repo.insert(changeset) do
			{:ok, _topic} ->
				conn
				|> put_flash(:info, "Topic Created")
				|> redirect(to: topic_path(conn, :index))
			{:error, changeset} ->
				render conn, "new.html", changeset: changeset
		end
 end

	def edit(conn, %{"id" => topic_id}) do
		topic = Repo.get(Topic, topic_id)
		changeset = Topic.changeset(topic)

		render conn, "edit.html", changeset: changeset, topic: topic
	end

	def update(
		conn,
		%{"id" => topic_id, "topic" => new_topic}
	) do
		old_topic = Repo.get(Topic, topic_id)
		changeset = Topic.changeset(old_topic, new_topic)

		case Repo.update(changeset) do
			{:ok, _topic} ->
				conn
				|> put_flash(:info, "Topic Updated")
				|> redirect(to: topic_path(conn, :index))
			{:error, changeset} ->
				render(conn, "edit.html",	topic: old_topic,	changeset: changeset)
		end
	end

	def delete(conn, %{"id" => topic_id}) do
		Repo.get!(Topic, topic_id)
		|> Repo.delete!

		conn
		|> put_flash(:info, "Topic Deleted")
		|> redirect(to: topic_path(conn, :index))
	end
end