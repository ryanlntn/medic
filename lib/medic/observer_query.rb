module Medic
  class ObserverQuery < HKObserverQuery

    include Medic::Types

    def initialize(args={}, block=Proc.new)
      type = object_type(args[:type])
      predicate = args[:predicate]
      initWithSampleType(type, predicate: predicate, updateHandler: block)
    end

  end
end
