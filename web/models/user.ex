defmodule Discuss.User do
  use Discuss.Web, :model

  @field_list ~w(email provider token)a

  @derive {Poison.Encoder, only: [:email]}

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string

    has_many :topics, Discuss.Topic
    has_many :comments, Discuss.Comment

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @field_list)
    |> validate_required(@field_list)
  end
end
