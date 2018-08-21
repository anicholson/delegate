# delegate

Ruby's delegate feature, implemented as Crystal macros.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  delegate:
    github: anicholson/delegate
```

## Usage

```crystal
require "delegate"

class Engine
  def state
    :stopped
  end
end

class Car
  include Delegate

  def initialize(@engine)
  end

  private getter engine

  delegate to: engine, methods: [state]
end

car = Car.new(Engine.new)

car.state # => :stopped
```

delegating to non-implemented methods results in a compile-time error:

```crystal

require "delegate"

# ... Engine definition as before

class Motorbike
  def initialize(@engine)
  end

  private getter engine

  delegate to: engine, methods: [state, current_gear]
end

bike = Motorbike.new(Engine.new)
bike.current_gear # :boom: compile error: Engine does not implement :current_gear

```

## Development

1. Check out the code via `git clone`
2. Run `shards install`
3. Run `crystal spec` to run all tests.

## Contributing

1. Fork it (<https://github.com/your-github-user/delegate/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [anicholson](https://github.com/anicholson) Andy Nicholson - creator, maintainer
