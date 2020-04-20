defmodule WhosTheManTest do
  use ExUnit.Case
  doctest WhosTheMan

  test "greets the world" do
    assert WhosTheMan.hello() == :world
  end
end
