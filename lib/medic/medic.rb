class Medic

  def self.available?
    HKHealthStore.isHealthDataAvailable
  end
  self.singleton_class.send(:alias_method, :is_available?, :available?)

end

