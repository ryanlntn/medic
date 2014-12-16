module Medic
  class << self

    include Medic::Finders

    def available?
      Medic::Store.available?
    end
    alias_method :is_available?, :available?

    def authorize(types, block=Proc.new)
      Medic::Store.shared.authorize(types, block)
    end

    def authorized?(sym)
      Medic::Store.shared.authorized?(sym)
    end
    alias_method :authorized_for?, :authorized?
    alias_method :is_authorized?, :authorized?
    alias_method :is_authorized_for?, :authorized?

    def biological_sex
      Medic::Store.shared.biological_sex
    end

    def blood_type
      Medic::Store.shared.blood_type
    end

    def date_of_birth
      Medic::Store.shared.date_of_birth
    end

    def delete(hk_object, block=Proc.new)
      Medic::Store.shared.delete(hk_object, block)
    end
    alias_method :delete_object, :delete

    def save(hk_objects, block=Proc.new)
      Medic::Store.shared.save(hk_objects, block)
    end
    alias_method :save_object, :save
    alias_method :save_objects, :save

    def execute(query)
      Medic::Store.shared.execute(query)
    end
    alias_method :execute_query, :execute

    def stop(query)
      Medic::Store.shared.stop(query)
    end
    alias_method :stop_query, :stop

    def enable_background_delivery(type, frequency, block=Proc.new)
      Medic::Store.shared.enable_background_delivery(type, frequency, block)
    end
    alias_method :enable_background_delivery_for, :enable_background_delivery

    def disable_background_delivery(type, block=Proc.new)
      Medic::Store.shared.disable_background_delivery(type, block)
    end
    alias_method :disable_background_delivery_for, :disable_background_delivery

    def disable_all_background_delivery(block=Proc.new)
      Medic::Store.shared.disable_all_background_delivery(block)
    end

  end
end

