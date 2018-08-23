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

class GearBox
  def change_gear(gear)
    gear
  end
end

class Hovercraft
  include Delegate

  def initialize
    @engine  = Engine.new
    @gearbox = GearBox.new
  end

  private getter gearbox

  delegate to: gearbox, methods: [change_gear]
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

  it "preserves arity" do
    craft = Hovercraft.new

    craft.change_gear(:park).should eq(:park)
  end
end
