defmodule Desafio1.Booking.AgentTest do
  use ExUnit.Case

  alias Desafio1.Booking.Agent, as: BookingAgent

  import Desafio1.Factory

  describe "save/1" do
    setup do
      BookingAgent.start_link(%{})
      :ok
    end

    test "saves booking" do
      booking = build(:booking)

      assert {:ok, _uuid} = BookingAgent.save(booking)
    end
  end

  describe "get/1" do
    setup do
      BookingAgent.start_link(%{})
      :ok
    end

    test "when booking exists, returns booking" do
      user_id = UUID.uuid4()

      {:ok, id} =
        :booking
        |> build(id_usuario: user_id)
        |> BookingAgent.save()

      response = BookingAgent.get(id)
      expected_response = {:ok, build(:booking, id: id, id_usuario: user_id)}

      assert response == expected_response
    end

    test "when booking does not exist, returns error" do
      response = BookingAgent.get("123")
      expected_response = {:error, "Flight Booking not found"}

      assert response == expected_response
    end
  end
end
