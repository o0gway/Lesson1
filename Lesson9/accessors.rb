module Accessors
  def self.included(base)
    base.extend ClassMethods
    # base.include InstanceMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*attrs)
      attrs.each do |attr|
        define_method(attr) { instance_variable_get("@#{attr}") }

        define_method("#{attr}=") do |value|
          if instance_variable_get("@#{attr}_history")
            instance_variable_get("@#{attr}_history") << instance_variable_get("@#{attr}")
          else
            instance_variable_set("@#{attr}_history", [])
          end

          instance_variable_set("@#{attr}", value)
        end

        define_method("#{attr}_history") do
          instance_variable_get("@#{attr}_history")
        end
      end
    end

    def strong_attr_accessor(method, name_class)
      define_method(method) { instance_variable_get("@#{method}") }
      define_method("#{method}=") do |value|
        raise 'Неправильный класс у переменной' unless value.is_a?(name_class)

        instance_variable_set("@#{method}", value)
      end
    end
  end
end
