require "./spec_helper"

class Engine
  def state
    :started
  end
end

class Car
  include Delegate

  def initialize
    @engine = Engine.new
  end

  private getter engine

  delegate to: engine, methods: [state]
end

class Motorbike
  include Delegate

  def initialize
    @engine = Engine.new
  end

  private getter engine

  delegate to: engine, methods: [state]

  def state
    :parked
  end
end

class Hovercraft
  include Delegate

  def initialize
    @engine = Engine.new
  end

  private getter engine

  delegate to: engine, methods: [current_gear]
end


describe Delegate do
  it "passes through to the delegated object" do
    car = Car.new
    car.state.should eq(:started)
  end

  it "can be overwritten by any existing method" do
    bike = Motorbike.new
    bike.state.should eq(:parked)
  end

  it "delegates to non-existent methods should not compile" do
    hovercraft = Hovercraft.new

    hovercraft.current_gear
  end
end
