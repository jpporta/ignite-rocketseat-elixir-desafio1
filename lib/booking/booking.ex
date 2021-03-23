defmodule Desafio1.Booking.Booking do
  @keys [:id, :data_completa, :cidade_origen, :cidade_destino, :id_usuario]
  @enforce_keys @keys
  defstruct @keys

  def build(data_completa, cidade_origen, cidade_destino, id_usuario) do
    with [date | [time]] <- String.split(data_completa, "T"),
         [year, month, day] <-
           String.split(date, "-")
           |> Enum.map(fn o ->
             {num, _} = Integer.parse(o)
             num
           end),
         [hour, minute, second] <-
           String.split(time, ":")
           |> Enum.map(fn o ->
             {num, _} = Integer.parse(o)
             num
           end),
         {:ok, naive_date} <- NaiveDateTime.new(year, month, day, hour, minute, second) do
      {:ok,
       %__MODULE__{
         id: UUID.uuid4(),
         data_completa: naive_date,
         cidade_origen: cidade_origen,
         cidade_destino: cidade_destino,
         id_usuario: id_usuario
       }}
    else
      _error -> {:error, "Invalid Date"}
    end
  end
end
