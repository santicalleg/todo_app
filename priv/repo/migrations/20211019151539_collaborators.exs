defmodule TodoApp.Repo.Migrations.Collaborators do
  use Ecto.Migration

  def up do
    create table(:collaborators) do
      add(:todo_list_id, references(:todos_lists, on_delete: :nothing))
      add(:user_id, references(:users, on_delete: :nothing))

      timestamps()
    end

    create(unique_index(:collaborators, [:todo_list_id, :user_id]))
  end

  def down do
    drop(table(:collaborators))
  end
end
