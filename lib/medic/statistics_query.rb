module Medic
  class StatisticsQuery < HKStatisticsQuery

    include Medic::Types
    include Medic::Predicate
    include Medic::StatisticsOptions

    def initialize(args={}, block=Proc.new)
      self.initWithQuantityType(object_type(args[:type]),
        quantitySamplePredicate: predicate(args),
        options: options_for_stat_query(args[:options]),
        completionHandler: block
      )
    end

  end
end
