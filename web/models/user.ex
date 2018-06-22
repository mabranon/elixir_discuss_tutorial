defmodule Discuss.User do
  use Discuss.Web, :model

  @field_list ~w(email provider token)a

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @field_list)
    |> validate_required(@field_list)
  end
end