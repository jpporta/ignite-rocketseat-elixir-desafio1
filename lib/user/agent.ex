defmodule Desafio1.User.Agent do
  alias Desafio1.User.User

  use Agent

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%User{id: uuid} = user) do
    Agent.update(__MODULE__, &update_state(&1, user))
    {:ok, uuid}
  end

  defp update_state(state, %User{id: id} = user), do: Map.put(state, id, user)

  def get(id), do: Agent.get(__MODULE__, &get_user(&1, id))

  defp get_user(state, id) do
    case Map.get(state, id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
