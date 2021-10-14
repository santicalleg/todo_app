defmodule TodoApp.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TodoApp.Todos` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        description: "some description",
        done: true,
        expiration: ~N[2021-10-12 14:33:00]
      })
      |> TodoApp.Todos.create_todo()

    todo
  end

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        born_date: ~D[2021-10-12],
        email: "some email",
        last_name: "some last_name",
        name: "some name"
      })
      |> TodoApp.Todos.create_user()

    user
  end
end
