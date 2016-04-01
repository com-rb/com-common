class ::Rbcom::AbstractMethodError < ::StandardError
  include ::Rbcom::StandardError


  # @param klass       [Class]  class instance in which method had to
  #   override default implementaion
  # @param method_name [String] name of the method which have to be overridden
  #
  # @return [::Rbcom::AbstractMethodError]
  #
  # @example
  #
  #   # @abstract
  #   class Base
  #     def call
  #       # here might be some other calls
  #
  #       # call to abstract method
  #       very_important_job
  #     end
  #
  #     # @abstract
  #     #
  #     # @raise ::Rbcom::AbstractMethodError when actual implementation has not
  #     #   been provided in concrete class
  #     def very_important_job
  #       raise ::Rbcom::AbstractMethodError.method_not_overridden_error(self.class, __method__)
  #     end
  #   end
  #
  #   class Concrete < Base
  #     def useful_method
  #       # imagine here some implementation of useful work
  #     end
  #   end
  #
  #   # finally we use Concrete class
  #   concreate_instance = Concrete.new
  #
  #   # Here we get an exception that very_important_job method suppose to be
  #   # overridden in Concrete class.
  #   concreate_instance.call
  #
  #   # Exact exception will look like
  #   # Rbcom::AbstractMethodError: Method 'very_important_job' has to be overridden in 'Concrete' class.
  #   # 	       from (irb):14:in `very_important_job'
  #   # 	       from (irb):6:in `call'
  #   # 	       from (irb):29
  #   # 	       from bin/console:14:in `<main>'
  def self.method_not_overridden_error(klass, method_name)
    self.new("Method '#{method_name}' has to be overridden in '#{klass}' class.")
  end
end
