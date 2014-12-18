module Medic
  class CorrelationQuery < HKCorrelationQuery

    include Medic::Types
    include Medic::Predicate

    def initialize(args={}, block=Proc.new)
      self.initWithType(object_type(args[:type]),
        predicate: predicate(args),
        samplePredicates: args[:sample_predicates],
        completion: block
      )
    end

  end
end
