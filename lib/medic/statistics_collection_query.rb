module Medic
  class StatisticsCollectionQuery < HKStatisticsCollectionQuery

    include Medic::Types
    include Medic::StatisticsOptions

    def initialize(args={})
      type = object_type(args[:type])
      predicate = args[:predicate]
      options = options_for_stat_query(args[:options])
      anchor = args[:anchor_date] || args[:anchor] || args[:date] || NSDate.date
      interval = args[:interval_components] || args[:interval]
      initWithQuantityType(type, quantitySamplePredicate: predicate, options: options, anchorDate: anchor, intervalComponents: interval)
    end

    alias_method :initial_results_handler, :initialResultsHandler

    def initial_results_handler=(callback=Proc.new)
      self.initialResultsHandler = callback
    end

    alias_method :statistics_update_handler, :statisticsUpdateHandler

    def statistics_update_handler=(callback=Proc.new)
      self.statisticsUpdateHandler = callback
    end

    alias_method :anchor, :anchorDate
    alias_method :anchor_date, :anchorDate
    alias_method :interval, :intervalComponents
    alias_method :interval_components, :intervalComponents

  end
end
