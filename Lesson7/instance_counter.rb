module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end
  


  module ClassMethods
    attr_accessor :object_list
    
    def instances
      @object_list ||= 0
    end
  end

  module InstanceMethods

  def valid?
    validate!
    true
  rescue StandardError => error
    false
  end

    protected
    
    def register_instance
      self.class.object_list ||= 0
      self.class.object_list += 1
    end
  end
end
