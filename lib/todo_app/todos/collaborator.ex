defmodule TodoApp.Todos.Collaborator do
  use Ecto.Schema
  import Ecto.Changeset

  alias TodoApp.Todos.TodoList
  alias TodoApp.Accounts.User

  @messaeg_already_exists "User already in Todo List"

  # schema "collaborators", index: false do ##para que se adicione manualmente el id, validar tambien el migration
  schema "collaborators" do
    belongs_to :user, User
    belongs_to :todo_list, TodoList
  end

  def changeset(collaborator, attrs) do
    collaborator
      |> cast(attrs, [])
      |> validate_required([])
      |> foreign_key_constraint(:user_id)
      |> foreign_key_constraint(:todo_list_id)
      |> unique_constraint([:user_id, :todo_list_id],
        name: :collaborators, 
        message: @messaeg_already_exists)
  end
end
