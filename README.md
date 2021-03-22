# Desafio1

# 💻 Sobre o desafio

Nesse desafio, você deverá criar uma aplicação de reserva de voos, onde haverá o cadastro de usuários e o cadastro de reservas para um usuário.

A struct do usuário deverá possuir os seguintes campos:

```elixir
%User{
	id: id,
	name: name,
	email: email,
	cpf: cpf
}
```

**Obs:** O Id deve ser gerado automaticamente, pode ser um inteiro ou um UUID, mas não pode se repetir.

A struct da reserva deverá possuir os seguintes campos:

```elixir
%Booking{
	id: id,
	data_completa: data_completa,
	cidade_origem: cidade_origem,
	cidade_destino: cidade_destino,
	id_usuario: id_usuario
}
```

O campo `data_completa` deverá ser uma `NaiveDateTime`, que é um formato de data sem fuso horário e com funções auxiliares. Mais detalhes sobre [NaiveDateTime aqui](https://hexdocs.pm/elixir/NaiveDateTime.html#content).

É importante que todos os dados sejam salvos em um **Agent**, de acordo com o que foi visto no módulo.

Você pode criar o projeto, módulos, funções e structs com o nome que desejar.

Exemplo de chamadas das funções e saídas esperadas: 

```elixir
iex> Flightex.create_user(params)
...> {:ok, user_id}

iex> Flightex.create_booking(user_id, params)
...> {:ok, booking_id}

iex> Flightex.create_booking(invalid_user_id, params)
...> {:error, "User not found"}

iex> Flightex.get_booking(booking_id)
...> {:ok, %Booking{...}}

iex> Flightex.get_booking(invalid_booking_id)
...> {:error, "Flight Booking not found"}
```

Se quiser testar a sua implementação a partir do terminal, rode `iex -S mix` dentro do diretório raiz do projeto.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `desafio1` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:desafio1, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/desafio1](https://hexdocs.pm/desafio1).

