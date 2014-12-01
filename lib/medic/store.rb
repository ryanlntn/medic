module Medic
  class Store < HKHealthStore

    include Medic::Types
    include Medic::HKConstants

    def self.shared
      Dispatch.once { @store ||= new }
      @store
    end

    def self.unload
      @store = nil
    end

    def self.available?
      isHealthDataAvailable
    end
    singleton_class.send(:alias_method, :is_available?, :available?)

    def authorize(types, block=Proc.new)
      share = Array(types[:share]).map{ |sym| object_type(sym) }
      read  = Array(types[:read]).map{ |sym| object_type(sym) }

      requestAuthorizationToShareTypes(NSSet.setWithArray(share), readTypes: NSSet.setWithArray(read), completion: ->(success, error){
        block.call(success, error)
      })
    end

    def authorized?(sym)
      authorizationStatusForType(object_type(sym)) == HKAuthorizationStatusSharingAuthorized
    end
    alias_method :authorized_for?, :authorized?
    alias_method :is_authorized?, :authorized?
    alias_method :is_authorized_for?, :authorized?

    def biological_sex
      error = Pointer.new(:object)
      sex = biologicalSexWithError error
      if block_given?
        yield BIOLOGICAL_SEXES.invert[sex.biologicalSex], error[0]
      else
        BIOLOGICAL_SEXES.invert[sex.biologicalSex]
      end
    end

    def blood_type
      error = Pointer.new(:object)
      blood = bloodTypeWithError error
      if block_given?
        yield BLOOD_TYPES.invert[blood.bloodType], error[0]
      else
        BLOOD_TYPES.invert[blood.bloodType]
      end
    end

    def date_of_birth
      error = Pointer.new(:object)
      birthday = dateOfBirthWithError error
      if block_given?
        yield birthday, error[0]
      else
        birthday
      end
    end

    def delete(hk_object, block=Proc.new)
      deleteObject(hk_object, withCompletion: ->(success, error){
        block.call(success, error)
      })
    end

    def save(hk_objects, block=Proc.new)
      saveObjects(Array(hk_objects), withCompletion: ->(success, error){
        block.call(success, error)
      })
    end

    # TODO: workout support
    # addSamples:toWorkout:completion:

    def execute(query)
      executeQuery(query)
    end
    alias_method :execute_query, :execute

    def stop(query)
      stopQuery(query)
    end
    alias_method :stop_query, :stop

    def enable_background_delivery(type, frequency, block=Proc.new)
      enableBackgroundDeliveryForType(object_type(type), frequency: update_frequency(frequency), withCompletion: ->(success, error){
        block.call(success, error)
      })
    end
    alias_method :enable_background_delivery_for, :enable_background_delivery

    def disable_background_delivery(type, block=Proc.new)
      return disable_all_background_delivery(block) if type == :all
      disableBackgroundDeliveryForType(object_type(type), withCompletion: ->(success, error){
        block.call(success, error)
      })
    end
    alias_method :disable_background_delivery_for, :disable_background_delivery

    def disable_all_background_delivery(block=Proc.new)
      disableAllBackgroundDeliveryWithCompletion(->(success, error){
        block.call(success, error)
      })
    end

  end
end
