module Medic
  class ObserverQuery < HKObserverQuery

    include Medic::Types
    include Medic::Predicate

    def initialize(args={}, block=Proc.new)
      self.initWithSampleType(object_type(args[:type]),
        predicate: predicate(args),
        updateHandler: block
      )
    end

  end
end
