defmodule AbsintheDialyzerWarningTest do
  use ExUnit.Case
  doctest AbsintheDialyzerWarning

  test "schema works" do
    assert {:ok, result} = Absinthe.run("{ get_person { name } }", AbsintheDialyzerWarning)
    assert result.data["get_person"]["name"] == "Trevor"
  end
end
