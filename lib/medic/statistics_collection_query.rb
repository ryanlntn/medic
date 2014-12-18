module Medic
  class StatisticsCollectionQuery < HKStatisticsCollectionQuery

    include Medic::Types
    include Medic::Predicate
    include Medic::StatisticsOptions
    include Medic::Interval

    def initialize(args={})
      self.initWithQuantityType(object_type(args[:type]),
        quantitySamplePredicate: predicate(args),
        options: options_for_stat_query(args[:options]),
        anchorDate: args[:anchor_date] || args[:anchor] || args[:date] || NSDate.date,
        intervalComponents: interval(args[:interval_components] || args[:interval])
      )
      self.initialResultsHandler = Proc.new if block_given?
      self
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
