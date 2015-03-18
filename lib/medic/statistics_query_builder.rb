module Medic
  class StatisticsQueryBuilder
    attr_reader :params
    attr_reader :query

    include Medic::Types
    include Medic::Predicate
    include Medic::StatisticsOptions

    def initialize(args={}, block=Proc.new)
      @params = args
      @query = HKStatisticsQuery.alloc.initWithQuantityType(object_type(args[:type]),
        quantitySamplePredicate: predicate(args),
        options: options_for_stat_query(args[:options]),
        completionHandler: block
      )
    end

  end
end
