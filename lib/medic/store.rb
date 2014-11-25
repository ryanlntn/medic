module Medic
  class Store < HKHealthStore

    include Medic::Types

    def self.available?
      isHealthDataAvailable
    end
    singleton_class.send(:alias_method, :is_available?, :available?)

    def authorize(args={}, &block)
      write = args[:write] ? args[:write].map{ |sym| object_type(sym) } : []
      read = args[:read] ? args[:read].map{ |sym| object_type(sym) } : []
      requestAuthorizationToShareTypes NSSet.setWithArray(write), readTypes: NSSet.setWithArray(read), completion: ->(success, error){
        block.call(success, error)
      }
    end

    def authorized?(sym)
      authorizationStatusForType(object_type(sym)) == HKAuthorizationStatusSharingAuthorized
    end
    alias_method :authorized_for?, :authorized?
    alias_method :is_authorized?, :authorized?
    alias_method :is_authorized_for?, :authorized?

  end
end
