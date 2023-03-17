# TrailingSlashPlug

**A plug for removing slash at the end of a request path and sending a 301

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `trailing_slash_plug` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:trailing_slash_plug, "~> 0.1.0"}
  ]
end
```

## Usage

```elixir
pipeline :trailing_slash do
  plug(TrailingSlashPlug)
end

scope "/example", as: :example_pages do
  pipe_through([:trailing_slash])
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/trailing_slash_plug>.

