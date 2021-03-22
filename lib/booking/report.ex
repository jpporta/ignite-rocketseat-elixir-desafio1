defmodule Desafio1.Booking.Report do
  alias Desafio1.Booking.Agent, as: BookingAgent
  alias Desafio1.Booking.Booking

  def create(filename \\ "report.csv") do
    booking_list = build_booking_list()

    File.write(filename, booking_list)
  end

  defp build_booking_list do
    BookingAgent.list_all()
    |> Map.values()
    |> Enum.map(&booking_string(&1))
  end

  defp booking_string(%Booking{
         id_usuario: user_id,
         cidade_origen: origin,
         cidade_destino: destiny,
         data_completa: date
       }) do
    formated_date =
      NaiveDateTime.truncate(date, :microsecond)
      |> NaiveDateTime.to_string()

    "#{user_id}, #{origin}, #{destiny}, #{formated_date}\n"
  end
end
