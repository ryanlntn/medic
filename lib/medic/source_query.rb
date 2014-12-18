module Medic
  class SourceQuery < HKSourceQuery

    include Medic::Types
    include Medic::Predicate

    def initialize(args={}, block=Proc.new)
      self.initWithSampleType(object_type(args[:type]),
        samplePredicate: predicate(args),
        completionHandler: block
      )
    end

  end
end
