defmodule Desafio1.User.AgentTest do
  use ExUnit.Case

  alias Desafio1.User.Agent, as: UserAgent

  import Desafio1.Factory

  describe "save/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "saves user" do
      user = build(:user)

      assert {:ok, _uuid} = UserAgent.save(user)
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "when user exists, returns user" do
      {:ok, id} =
        :user
        |> build()
        |> UserAgent.save()

      response = UserAgent.get(id)
      expected_response = {:ok, build(:user, id: id)}

      assert response == expected_response
    end

    test "when user does not exist, returns error" do
      response = UserAgent.get("123")
      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
