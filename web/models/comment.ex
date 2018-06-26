defmodule Discuss.Comment do
  use Discuss.Web, :model

  @encoded_fields ~w(content user)a

  @derive {Poison.Encoder, only: @encoded_fields}

  schema "comments" do
    field :content, :string

    belongs_to :user, Discuss.User
    belongs_to :topic, Discuss.Topic

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
