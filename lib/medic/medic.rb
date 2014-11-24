class Medic

  def self.available?
    HKHealthStore.isHealthDataAvailable
  end

end

