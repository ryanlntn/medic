module Medic
  module StatisticsOptions

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
