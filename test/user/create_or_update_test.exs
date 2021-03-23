defmodule Desafio1.User.CreateOrUpdateTest do
  use ExUnit.Case

  import Desafio1.Factory

  alias Desafio1.User.Agent, as: UserAgent
  alias Desafio1.User.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "when all parameters are valid, save user" do
      params = %{
        name: "Joao Porta",
        email: "jpedro.porta@gmail.com",
        cpf: "12345678900"
      }

      response = CreateOrUpdate.call(params)

      assert {:ok, _uuid} = response
    end

    test "when cpf is invalid, returns error" do
      params = %{
        name: "Joao Porta",
        email: "jpedro.porta@gmail.com",
        cpf: 12
      }

      response = CreateOrUpdate.call(params)

      assert {:error, "Invalid Parameters"} = response
    end
  end
end
