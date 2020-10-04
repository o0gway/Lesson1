module Validation
  def self.included(base)
    self.class_variable_set :@@validations, Hash.new
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods

    def validations
      class_variable_get :@@validations
    end

    def validate(validation_type, value, validation_format = "")
      validations[validation_type] = value
      @format = validation_format
    end
  end

  module InstanceMethods
    def validate!
      self.class.class_variable_get("@@validations").each do |type, value|
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
      raise "Значение атрибута не должно быть nil или пустой строкой" if val.nil? || val == ""
    end

    def format(var)
      raise "Неверный формат" if var !~ @format
    end

    def type(var)
      raise "Неверный класс" unless var.class == @format
    end
  end
end
