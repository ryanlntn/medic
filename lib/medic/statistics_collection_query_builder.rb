module Medic
  class StatisticsCollectionQueryBuilder
    attr_reader :params
    attr_reader :query

    include Medic::Types
    include Medic::Predicate
    include Medic::StatisticsOptions
    include Medic::Anchor
    include Medic::Interval

    def initialize(args={})
      @params = args
      @query = HKStatisticsCollectionQuery.alloc.initWithQuantityType(object_type(args[:type]),
        quantitySamplePredicate: predicate(args),
        options: options_for_stat_query(args[:options]),
        anchorDate: anchor_for_symbol(args[:anchor_date] || args[:anchor] || args[:date] || NSDate.date),
        intervalComponents: interval(args[:interval_components] || args[:interval])
      )
      if block_given?
        handler = Proc.new
        @query.initialResultsHandler = handler
        @query.statisticsUpdateHandler = Proc.new{|q,_,r,e| handler.call(q,r,e)} if args[:update] == true
      end
      @query.statisticsUpdateHandler = args[:update] if args[:update].is_a?(Proc)
    end

    def initial_results_handler
      @query.initialResultsHandler
    end

    def initial_results_handler=(callback=Proc.new)
      @query.initialResultsHandler = callback
    end

    def statistics_update_handler
      @query.statisticsUpdateHandler
    end

    def statistics_update_handler=(callback=Proc.new)
      @query.statisticsUpdateHandler = callback
    end

  end
end
