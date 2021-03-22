defmodule Desafio1 do
  alias Desafio1.Booking.Agent, as: BookingAgent
  alias Desafio1.Booking.CreateOrUpdate, as: BookingCreateorUpdate
  alias Desafio1.User.Agent, as: UserAgent
  alias Desafio1.User.CreateOrUpdate, as: UserCreateorUpdate

  def start_agents do
    UserAgent.start_link(%{})
    BookingAgent.start_link(%{})
  end

  defdelegate create_user(params), to: UserCreateorUpdate, as: :call
  defdelegate create_booking(params), to: BookingCreateorUpdate, as: :call
  defdelegate get_booking(params), to: BookingAgent, as: :get
end
