defmodule Desafio1.Booking.CreateOrUpdateTest do
  use ExUnit.Case

  import Desafio1.Factory

  alias Desafio1.Booking.Agent, as: BookingAgent
  alias Desafio1.Booking.CreateOrUpdate
  alias Desafio1.User.Agent, as: UserAgent

  describe "call/1" do
    setup do
      id = UUID.uuid4()
      user = build(:user, id: id)

      UserAgent.start_link(%{})
      BookingAgent.start_link(%{})

      UserAgent.save(user)

      {:ok, user_id: id}
    end

    test "when all parameters are valid, save booking", %{
      user_id: id
    } do
      params = %{
        data_completa: "2021-03-23T12:00:00",
        cidade_origem: "Campinas",
        cidade_destino: "New York",
        id_usuario: id
      }

      response = CreateOrUpdate.call(params)

      assert {:ok, _uuid} = response
    end

    test "when there are no user with given id, returns error" do
      params = %{
        data_completa: "2021-03-23T12:00:00",
        cidade_origem: "Campinas",
        cidade_destino: "New York",
        id_usuario: "123"
      }

      response = CreateOrUpdate.call(params)

      assert {:error, "Invalid Parameters"} == response
    end

    test "when date is invalid, returns error" do
      params = %{
        data_completa: "2021-03-23",
        cidade_origem: "Campinas",
        cidade_destino: "New York",
        id_usuario: "123"
      }

      response = CreateOrUpdate.call(params)

      assert {:error, "Invalid Parameters"} = response
    end
  end
end
