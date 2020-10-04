module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validate
      # тут только сохранение
    end
  end

  module InstanceMethods
    def validate!
      # тут обработать и выкинуть ошибку если что то не так
    end
  end
end
