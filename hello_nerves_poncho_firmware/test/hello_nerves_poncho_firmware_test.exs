defmodule HelloNervesPonchoFirmwareTest do
  use ExUnit.Case
  doctest HelloNervesPonchoFirmware

  test "greets the world" do
    assert HelloNervesPonchoFirmware.hello() == :world
  end
end
