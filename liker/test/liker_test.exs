defmodule LikerTest do
  use ExUnit.Case
  doctest Liker

  test "greets the world" do
    assert Liker.hello() == :world
  end
end
