module Medic
  class StatisticsCollectionQuery < HKStatisticsCollectionQuery

    include Medic::Types
    include Medic::Predicate
    include Medic::StatisticsOptions
    include Medic::Anchor
    include Medic::Interval

    def initialize(args={})
      self.initWithQuantityType(object_type(args[:type]),
        quantitySamplePredicate: predicate(args),
        options: options_for_stat_query(args[:options]),
        anchorDate: anchor_for_symbol(args[:anchor_date] || args[:anchor] || args[:date] || NSDate.date),
        intervalComponents: interval(args[:interval_components] || args[:interval])
      )
      if block_given?
        handler = Proc.new
        self.initialResultsHandler = handler
        self.statisticsUpdateHandler = Proc.new{|q,_,r,e| handler.call(q,r,e)} if args[:update] == true
      end
      self.statisticsUpdateHandler = args[:update] if args[:update].is_a?(Proc)
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
