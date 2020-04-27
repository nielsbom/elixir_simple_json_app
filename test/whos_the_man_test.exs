defmodule SimpleJsonAppTest do
  use ExUnit.Case
  doctest SimpleJsonApp

  test "greets the world" do
    assert SimpleJsonApp.hello() == :world
  end
end
