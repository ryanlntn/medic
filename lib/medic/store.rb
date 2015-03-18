module Medic
  class Store
    include Medic::Types
    include Medic::Units
    include Medic::HKConstants

    def self.shared
      Dispatch.once { @@hk_store ||= HKHealthStore.new }
      Dispatch.once { @medic_store ||= new }
      @medic_store
    end

    def self.hk_store
      @@hk_store
    end

    def self.unload
      @@hk_store = nil
      @medic_store = nil
    end

    def self.available?
      HKHealthStore.isHealthDataAvailable
    end
    singleton_class.send(:alias_method, :is_available?, :available?)

    def authorize(types, block=Proc.new)
      share = Array(types[:share] || types[:write]).map{ |sym| object_type(sym) }
      read  = Array(types[:read]).map{ |sym| object_type(sym) }

      @@hk_store.requestAuthorizationToShareTypes(NSSet.setWithArray(share), readTypes: NSSet.setWithArray(read), completion: ->(success, error){
        block.call(success, error)
      })
    end

    def authorized?(sym)
      @@hk_store.authorizationStatusForType(object_type(sym)) == HKAuthorizationStatusSharingAuthorized
    end
    alias_method :authorized_for?, :authorized?
    alias_method :is_authorized?, :authorized?
    alias_method :is_authorized_for?, :authorized?

    def biological_sex
      error = Pointer.new(:object)
      sex = @@hk_store.biologicalSexWithError error
      if block_given?
        yield BIOLOGICAL_SEXES.invert[sex.biologicalSex], error[0]
      else
        BIOLOGICAL_SEXES.invert[sex.biologicalSex]
      end
    end

    def blood_type
      error = Pointer.new(:object)
      blood = @@hk_store.bloodTypeWithError error
      if block_given?
        yield BLOOD_TYPES.invert[blood.bloodType], error[0]
      else
        BLOOD_TYPES.invert[blood.bloodType]
      end
    end

    def date_of_birth
      error = Pointer.new(:object)
      birthday = @@hk_store.dateOfBirthWithError error
      if block_given?
        yield birthday, error[0]
      else
        birthday
      end
    end

    def delete(hk_object, block=Proc.new)
      @@hk_store.deleteObject(hk_object, withCompletion: ->(success, error){
        block.call(success, error)
      })
    end
    alias_method :delete_object, :delete

    def save(hk_objects, block=Proc.new)
      objs_array = hk_objects.is_a?(Array) ? hk_objects : [hk_objects]
      @@hk_store.saveObjects(objs_array.map{|obj| prepare_for_save(obj)}, withCompletion: ->(success, error){
        block.call(success, error)
      })
    end
    alias_method :save_object, :save
    alias_method :save_objects, :save

    # TODO: workout support
    # addSamples:toWorkout:completion:

    def execute(query)
      @@hk_store.executeQuery(query)
    end
    alias_method :execute_query, :execute

    def stop(query)
      @@hk_store.stopQuery(query)
    end
    alias_method :stop_query, :stop

    def enable_background_delivery(type, frequency, block=Proc.new)
      @@hk_store.enableBackgroundDeliveryForType(object_type(type), frequency: update_frequency(frequency), withCompletion: ->(success, error){
        block.call(success, error)
      })
    end
    alias_method :enable_background_delivery_for, :enable_background_delivery

    def disable_background_delivery(type, block=Proc.new)
      return disable_all_background_delivery(block) if type == :all
      @@hk_store.disableBackgroundDeliveryForType(object_type(type), withCompletion: ->(success, error){
        block.call(success, error)
      })
    end
    alias_method :disable_background_delivery_for, :disable_background_delivery

    def disable_all_background_delivery(block=Proc.new)
      @@hk_store.disableAllBackgroundDeliveryWithCompletion(->(success, error){
        block.call(success, error)
      })
    end

  private

    def prepare_for_save(sample)
      return sample if sample.kind_of? HKSample

      date = sample[:date] || NSDate.date
      start_date = sample[:start] || sample[:start_date] || date
      end_date = sample[:end] || sample[:end_date] || date
      metadata = sample[:metadata] || {}

      type = object_type(sample[:type] || sample[:sample_type] || sample[:quantity_type] || sample[:correlation_type] || sample[:category_type])

      case type
      when HKQuantityType
        quantity = HKQuantity.quantityWithUnit((sample_unit(sample[:unit]) || type.canonicalUnit), doubleValue: sample[:quantity])
        HKQuantitySample.quantitySampleWithType(type, quantity: quantity, startDate: start_date, endDate: end_date, metadata: metadata)
      when HKCorrelationType
        objects = (sample[:objects].is_a?(Array) ? sample[:objects] : [sample[:objects]]).map{|obj| prepare_for_save(obj)}
        HKCorrelation.correlationWithType(type, startDate: start_date, endDate: end_date, objects: objects, metadata: metadata)
      when HKCategoryType
        value = sleep_analysis(sample[:value]) # SleepAnalysis is the only category type at the moment
        HKCategorySample.categorySampleWithType(type, value: value, startDate: start_date, endDate: end_date, metadata: metadata)
      else
        # handle workouts
      end
    end

  end
end
