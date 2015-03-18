module Medic
  class CorrelationQueryBuilder
    attr_reader :params
    attr_reader :query

    include Medic::Types
    include Medic::Predicate

    def initialize(args={}, block=Proc.new)
      @params = args
      @query = HKCorrelationQuery.alloc.initWithType(object_type(args[:type]),
        predicate: predicate(args),
        samplePredicates: sample_predicates(args[:sample_predicates]),
        completion: block
      )
    end

  private

    def sample_predicates(predicates)
      Hash[ predicates.map{ |type, pred| [object_type(type), predicate(pred)] } ]
    end

  end
end
