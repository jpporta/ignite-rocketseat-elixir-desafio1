defmodule Desafio1.Booking.BookingTest do
  use ExUnit.Case

  alias Desafio1.Booking.Booking

  import Desafio1.Factory

  describe "build/4" do
    test "when all parameters are valid, return booking" do
      user_id = UUID.uuid4()

      response =
        Booking.build(
          "2021-03-23T11:38:00",
          "Campinas",
          "New York",
          user_id
        )

      assert {:ok, _user} = response
    end

    test "when there is an invalid parameter, returns an error" do
      response =
        Booking.build(
          "2021-03-23",
          "Campinas",
          "New York",
          "123"
        )

      expected_response = {:error, "Invalid Date"}

      assert response == expected_response
    end
  end
end
