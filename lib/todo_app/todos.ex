defmodule TodoApp.Todos do
  @moduledoc """
  The Todos context.
  """

  import Ecto.Query, warn: false
  alias TodoApp.Repo

  alias TodoApp.Todos.Todo

  @doc """
  Returns the list of todos.

  ## Examples

      iex> list_todos()
      [%Todo{}, ...]

  """
  def list_todos do
    Repo.all(Todo)
  end

  @doc """
  Gets a single todo.

  Raises `Ecto.NoResultsError` if the Todo does not exist.

  ## Examples

      iex> get_todo!(123)
      %Todo{}

      iex> get_todo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_todo!(id), do: Repo.get!(Todo, id)
  def get_todo_with_list!(id), do: Repo.get!(Todo, id) |> Repo.preload(:todo_list)

  @doc """
  Creates a todo.

  ## Examples

      iex> create_todo(%{field: value})
      {:ok, %Todo{}}

      iex> create_todo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_todo(attrs \\ %{}) do
    %Todo{}
    |> Todo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a todo.

  ## Examples

      iex> update_todo(todo, %{field: new_value})
      {:ok, %Todo{}}

      iex> update_todo(todo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_todo(%Todo{} = todo, attrs) do
    todo
    |> Todo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a todo.

  ## Examples

      iex> delete_todo(todo)
      {:ok, %Todo{}}

      iex> delete_todo(todo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_todo(%Todo{} = todo) do
    Repo.delete(todo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking todo changes.

  ## Examples

      iex> change_todo(todo)
      %Ecto.Changeset{data: %Todo{}}

  """
  def change_todo(%Todo{} = todo, attrs \\ %{}) do
    Todo.changeset(todo, attrs)
  end

  ##Esta parte se creo cuando creamos el contexto User para fines demostrativos
  # alias TodoApp.Todos.User

  # @doc """
  # Returns the list of users.

  # ## Examples

  #     iex> list_users()
  #     [%User{}, ...]

  # """
  # def list_users do
  #   Repo.all(User)
  # end

  # @doc """
  # Gets a single user.

  # Raises `Ecto.NoResultsError` if the User does not exist.

  # ## Examples

  #     iex> get_user!(123)
  #     %User{}

  #     iex> get_user!(456)
  #     ** (Ecto.NoResultsError)

  # """
  # def get_user!(id), do: Repo.get!(User, id)

  # @doc """
  # Creates a user.

  # ## Examples

  #     iex> create_user(%{field: value})
  #     {:ok, %User{}}

  #     iex> create_user(%{field: bad_value})
  #     {:error, %Ecto.Changeset{}}

  # """
  # def create_user(attrs \\ %{}) do
  #   %User{}
  #   |> User.changeset(attrs)
  #   |> Repo.insert()
  # end

  # @doc """
  # Updates a user.

  # ## Examples

  #     iex> update_user(user, %{field: new_value})
  #     {:ok, %User{}}

  #     iex> update_user(user, %{field: bad_value})
  #     {:error, %Ecto.Changeset{}}

  # """
  # def update_user(%User{} = user, attrs) do
  #   user
  #   |> User.changeset(attrs)
  #   |> Repo.update()
  # end

  # @doc """
  # Deletes a user.

  # ## Examples

  #     iex> delete_user(user)
  #     {:ok, %User{}}

  #     iex> delete_user(user)
  #     {:error, %Ecto.Changeset{}}

  # """
  # def delete_user(%User{} = user) do
  #   Repo.delete(user)
  # end

  # @doc """
  # Returns an `%Ecto.Changeset{}` for tracking user changes.

  # ## Examples

  #     iex> change_user(user)
  #     %Ecto.Changeset{data: %User{}}

  # """
  # def change_user(%User{} = user, attrs \\ %{}) do
  #   User.changeset(user, attrs)
  # end

  alias TodoApp.Todos.TodoList

  @doc """
  Returns the list of todos_lists.

  ## Examples

      iex> list_todos_lists()
      [%TodoList{}, ...]

  """
  def list_todos_lists do
    Repo.all(TodoList)
  end

  @doc """
  Gets a single todo_list.

  Raises `Ecto.NoResultsError` if the Todo list does not exist.

  ## Examples

      iex> get_todo_list!(123)
      %TodoList{}

      iex> get_todo_list!(456)
      ** (Ecto.NoResultsError)

  """
  def get_todo_list!(id), do: Repo.get!(TodoList, id)

  def get_todo_list_with_todos!(id), do: Repo.get!(TodoList, id) |> Repo.preload(:todos)

  @doc """
  Creates a todo_list.

  ## Examples

      iex> create_todo_list(%{field: value})
      {:ok, %TodoList{}}

      iex> create_todo_list(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_todo_list(attrs \\ %{}) do
    %TodoList{}
    |> TodoList.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a todo_list.

  ## Examples

      iex> update_todo_list(todo_list, %{field: new_value})
      {:ok, %TodoList{}}

      iex> update_todo_list(todo_list, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_todo_list(%TodoList{} = todo_list, attrs) do
    todo_list
    |> TodoList.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a todo_list.

  ## Examples

      iex> delete_todo_list(todo_list)
      {:ok, %TodoList{}}

      iex> delete_todo_list(todo_list)
      {:error, %Ecto.Changeset{}}

  """
  def delete_todo_list(%TodoList{} = todo_list) do
    Repo.delete(todo_list)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking todo_list changes.

  ## Examples

      iex> change_todo_list(todo_list)
      %Ecto.Changeset{data: %TodoList{}}

  """
  def change_todo_list(%TodoList{} = todo_list, attrs \\ %{}) do
    TodoList.changeset(todo_list, attrs)
  end
end
