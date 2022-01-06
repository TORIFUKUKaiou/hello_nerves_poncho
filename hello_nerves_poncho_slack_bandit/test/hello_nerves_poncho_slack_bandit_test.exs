defmodule HelloNervesPonchoSlackBanditTest do
  use ExUnit.Case
  doctest HelloNervesPonchoSlackBandit

  test "greets the world" do
    assert HelloNervesPonchoSlackBandit.hello() == :world
  end
end
