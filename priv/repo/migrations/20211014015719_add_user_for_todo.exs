defmodule TodoApp.Repo.Migrations.AddUserForTodo do
  use Ecto.Migration

  # def change do
  #   alter table(:todos) do
  #     add(:user_id, references(:users, on_delete: :delete_all))
  #   end
  # end

  def up do
    #cuando se aplica la migración
      alter table(:todos) do
      add(:user_id, references(:users, on_delete: :delete_all), null: false)
    end
  end

  def down do
    #cuando se hace como rollback de la migración con mix ecto.rollback
    alter table(:todos) do
      remove(:user_id)
    end
  end
end
