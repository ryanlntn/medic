module Medic
  class StatisticsCollectionQuery < HKStatisticsCollectionQuery

    include Medic::Types

    STATISTICS_OPTIONS = {
      none: HKStatisticsOptionNone,
      by_source: HKStatisticsOptionSeparateBySource,
      separate_by_source: HKStatisticsOptionSeparateBySource,
      average: HKStatisticsOptionDiscreteAverage,
      discrete_average: HKStatisticsOptionDiscreteAverage,
      min: HKStatisticsOptionDiscreteMin,
      discrete_min: HKStatisticsOptionDiscreteMin,
      max: HKStatisticsOptionDiscreteMax,
      discrete_max: HKStatisticsOptionDiscreteMax,
      sum: HKStatisticsOptionCumulativeSum,
      cumulative_sum: HKStatisticsOptionCumulativeSum
    }

    def initialize(args={})
      type = object_type(args[:type])
      predicate = args[:predicate]
      options = options_for_stat_query(args[:options])
      anchor = args[:anchor_date] || args[:anchor] || args[:date] || NSDate.date
      interval = args[:interval_components] || args[:interval]
      initWithQuantityType(type, quantitySamplePredicate: predicate, options: options, anchorDate: anchor, intervalComponents: interval)
    end

    alias_method :initial_results_handler, :initialResultsHandler
    alias_method :initial_results_handler=, :initialResultsHandler=
    alias_method :statistics_update_handler, :statisticsUpdateHandler
    alias_method :statistics_update_handler=, :statisticsUpdateHandler=

    alias_method :anchor_date, :anchorDate
    alias_method :interval_components, :intervalComponents

  private

    def options_for_stat_query(symbols)
      options = 0
      Array(symbols).each do |option|
        options = options | statistics_option(option)
      end
      options
    end

    def statistics_option(option)
      option.is_a?(Symbol) ? STATISTICS_OPTIONS[option] : option
    end

  end
end
