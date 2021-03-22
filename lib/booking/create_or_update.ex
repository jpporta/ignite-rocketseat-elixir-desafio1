defmodule Desafio1.Booking.CreateOrUpdate do
  alias Desafio1.Booking.Agent, as: BookingAgent
  alias Desafio1.Booking.Booking
  alias Desafio1.User.Agent, as: UserAgent

  def call(%{
        data_completa: data_completa,
        cidade_origem: cidade_origen,
        cidade_destino: cidade_destino,
        id_usuario: id_usuario
      }) do
    with {:ok, _} <- UserAgent.get(id_usuario),
         {:ok, booking} <- Booking.build(data_completa, cidade_origen, cidade_destino, id_usuario) do
      BookingAgent.save(booking)
    else
      _error -> {:error, "Invalid Parameters"}
    end
  end
end
