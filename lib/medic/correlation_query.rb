module Medic
  class CorrelationQuery < HKCorrelationQuery

    include Medic::Types

    def initialize(args={}, block=Proc.new)
      type = object_type(args[:type])
      predicate = args[:predicate]
      sample_predicates = args[:sample_predicates]
      initWithType(type, predicate: predicate, samplePredicates: sample_predicates, completion: block)
    end

  end
end
