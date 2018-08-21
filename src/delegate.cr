module Delegate
  VERSION = "0.1.0"

  macro delegate(to, methods)
    {% for m in methods %}
      def {{m.id}}
        {{to}}.{{m.id}}
      end
    {% end %}
  end
end
