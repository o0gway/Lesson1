module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end
  


  module ClassMethods
    attr_accessor :object_list
    
    def instances
      @object_list ||= []
      @object_list.size
    end
  end

  module InstanceMethods

    protected
    
    def register_instance
      self.class.object_list ||= []
      self.class.object_list << self
    end
  end
end