module Yaffle
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    # any method placed here will apply to classes, like Hickwall
    def acts_as_yaffle(options = {})
      cattr_accessor :yaffle_text_field
      self.yaffle_text_field = (options[:yaffle_text_field] || :last_squawk).to_s
      send :include, InstanceMethods
    end
  end

  module InstanceMethods
    # any method placed here will apply to instances, like @hickwall
    def squawk(string)
      write_attribute(self.class.yaffle_text_field, string.to_squawk)
    end
  end
end

ActiveRecord::Base.send :include, Yaffle
