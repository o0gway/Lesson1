module Validation
  def self.included(base)
    # self.class_variable_set :@@validations, Hash.new
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(validation_type, value, validation_format = '')
      @validations ||= []
      @validations << [validation_type, value, validation_format]
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |type, value|
        send type, value
      end
      true
    end

    def valid?
      validate!
    rescue RuntimeError => e
      puts e.message
      false
    end

    private

    def presence(val)
      raise 'Значение атрибута не должно быть nil или пустой строкой' if val.nil? || val == ''
    end

    def format(val, format)
      raise 'Неверный формат' if val !~ format
    end

    def type(val, type)
      raise 'Неверный класс' unless val.is_a?(type)
    end
  end
end
