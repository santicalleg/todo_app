defmodule TodoApp.Todos.Todo do
  use Ecto.Schema
  import Ecto.Changeset
  alias TodoApp.Accounts.User
  alias TodoApp.Todos.TodoList

  schema "todos" do
    belongs_to :user, User
    belongs_to :todo_list, TodoList
    field :description, :string
    field :done, :boolean, default: false
    field :expiration, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:description, :done, :expiration, :user_id, :todo_list_id])
    |> validate_required([:description, :done, :expiration])
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:todo_list_id)
  end

  # def changeset(todo, :insert, attrs) do

  # end

  # def changeset(todo, :update, attrs) do

  # end
end
