module Medic
  class AnchoredObjectQueryBuilder
    attr_reader :params
    attr_reader :query

    include Medic::Types
    include Medic::Predicate
    include Medic::Anchor

    def initialize(args={}, block=Proc.new)
      @params = args
      @query = HKAnchoredObjectQuery.alloc.initWithType(object_type(args[:type]),
        predicate: predicate(args),
        anchor: anchor_for_symbol(args[:anchor_date] || args[:anchor] || args[:date] || HKAnchoredObjectQueryNoAnchor),
        limit: args[:limit] || HKObjectQueryNoLimit,
        completionHandler: block
      )
    end

  end
end
