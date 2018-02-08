defmodule AbsintheDialyzerWarning do
  use Absinthe.Schema

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
    middleware
  end
end
