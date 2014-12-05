module Medic
  class StatisticsQuery < HKStatisticsQuery

    include Medic::Types
    include Medic::StatisticsOptions

    def initialize(args={}, block=Proc.new)
      type = object_type(args[:type])
      predicate = args[:predicate]
      options = options_for_stat_query(args[:options])
      initWithQuantityType(type, quantitySamplePredicate: predicate, options: options, completionHandler: block)
    end

  end
end
