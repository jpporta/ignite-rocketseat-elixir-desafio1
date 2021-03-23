defmodule Desafio1.User.UserTest do
  use ExUnit.Case

  alias Desafio1.User.User

  import Desafio1.Factory

  describe "build/3" do
    test "when all parameters are valid, return user" do
      response =
        User.build(
          "Joao",
          "jpedro.porta@gmail.com",
          "12345678900"
        )

      assert {:ok, _user} = response
    end

    test "when there is an invalid parameter, returns an error" do
      response =
        User.build(
          "Joao",
          "jpedro.porta@gmail.com",
          3
        )

      expected_response = {:error, "Invalid Parameters"}

      assert response == expected_response
    end
  end
end
