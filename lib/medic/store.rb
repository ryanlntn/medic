module Medic
  class Store < HKHealthStore

    include Medic::Types
    include Medic::Constants

    def self.available?
      isHealthDataAvailable
    end
    singleton_class.send(:alias_method, :is_available?, :available?)

    def authorize(types, &block)
      share = types[:share] ? types[:share].map{ |sym| object_type(sym) } : []
      read = types[:read] ? types[:read].map{ |sym| object_type(sym) } : []

      requestAuthorizationToShareTypes NSSet.setWithArray(share), readTypes: NSSet.setWithArray(read), completion: ->(success, error){
        block.call(success, error)
      }
    end

    def authorized?(sym)
      authorizationStatusForType(object_type(sym)) == HKAuthorizationStatusSharingAuthorized
    end
    alias_method :authorized_for?, :authorized?
    alias_method :is_authorized?, :authorized?
    alias_method :is_authorized_for?, :authorized?

    # def biological_sex(error)
    # end

    # def blood_type(error)
    # end

    # def date_of_birth
    #   # error = Pointer.new(:object)
    #   # dob = dateOfBirthWithError error
    #   # if block_given?
    #   #   yield dob, error[0]
    #   # else
    #   #   dob
    #   # end
    # end


    # deleteObject:withCompletion:
    # saveObject:withCompletion:
    # saveObjects:withCompletion:

    # addSamples:toWorkout:completion:

    # executeQuery:
    # stopQuery:

    def enable_background_delivery(type, frequency, &block)
      enableBackgroundDeliveryForType object_type(type), frequency: update_frequency(frequency), withCompletion: ->(success, error){
        block.call(success, error)
      }
    end

    # enableBackgroundDeliveryForType:frequency:withCompletion:
    # disableBackgroundDeliveryForType:withCompletion:
    # disableAllBackgroundDeliveryWithCompletion:

  end
end
