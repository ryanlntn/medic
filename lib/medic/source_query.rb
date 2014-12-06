module Medic
  class SourceQuery < HKSourceQuery

    include Medic::Types

    def initialize(args={}, block=Proc.new)
      type = object_type(args[:type])
      predicate = args[:predicate]
      initWithSampleType(type, samplePredicate: predicate, completionHandler: block)
    end

  end
end
