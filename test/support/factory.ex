defmodule Desafio1.Factory do
  use ExMachina

  alias Desafio1.Booking.Booking
  alias Desafio1.User.User

  def user_factory do
    %User{
      id: UUID.uuid4(),
      name: "Joao Porta",
      email: "jpedro.porta@gmail.com",
      cpf: "12345678900"
    }
  end

  def booking_factory do
    {:ok, datetime} = NaiveDateTime.new(2021, 03, 23, 11, 38, 0)

    %Booking{
      id: UUID.uuid4(),
      data_completa: datetime,
      cidade_origen: "Campinas",
      cidade_destino: "New York",
      id_usuario: UUID.uuid4()
    }
  end
end
