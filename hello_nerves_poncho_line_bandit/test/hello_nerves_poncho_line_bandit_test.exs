defmodule HelloNervesPonchoLineBanditTest do
  use ExUnit.Case
  doctest HelloNervesPonchoLineBandit

  test "greets the world" do
    assert HelloNervesPonchoLineBandit.hello() == :world
  end
end
