module Validation
  def self.included(base)
    # self.class_variable_set :@@validations, Hash.new
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(value, type, options = '')
      @validations ||= []
      @validations << {attr: value, type: type, options: options}
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |element|
        value = instance_variable_get("@#{element[:attr]}")
        type = element[:type]
        options = element[:options]
        send(value, type, options)
      end
    end

    def valid?
      validate!
    rescue RuntimeError => e
      false
    end

    private

    def validate_presence(val)
      raise 'Значение атрибута не должно быть nil или пустой строкой' if val.nil? || val == ''
    end

    def validate_format(val, format)
      raise 'Неверный формат' if val !~ format
    end

    def validate_type(val, type)
      raise 'Неверный класс' unless val.is_a?(type)
    end
  end
end
