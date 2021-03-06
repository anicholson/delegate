module Delegate
  VERSION = "0.2.0"

  macro delegate(to, methods)
    {% for m in methods %}
      def {{m.id}}(*args)
        {{to}}.{{m.id}}(*args)
      end
    {% end %}
  end
end
