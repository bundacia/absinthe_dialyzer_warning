defmodule AbsintheDialyzerWarning do
  use Absinthe.Schema
  # Uncomment the following line to silence the dialyzer warning
  # @dialyzer {:nowarn_function, __do_absinthe_middleware__: 3}

  object :person do
    field :name, :string
  end

  query do
    field :get_person, :person do
      resolve fn _, _ -> {:ok, %{name: "Trevor"}} end
    end
  end

  @impl Absinthe.Schema
  def middleware(middleware, _, _) do
    middleware ++ [PassThroughMiddleware]
  end
end

defmodule PassThroughMiddleware do
  @behaviour Absinthe.Middleware

  def call(res, _config) do
    res
  end
end
