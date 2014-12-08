class StatisticsCollectionQueryController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.blueColor
    self.title = "StatisticsCollectionQuery"
  end

  def viewDidAppear(animated)
    query = Medic::StatisticsCollectionQuery.new(type: :step_count, options: :sum, anchor: one_week_ago, interval: :day)

    query.initial_results_handler = ->(query, results, error){
      NSLog("An error occurred calculating statistics: #{error.localizedDescription}") if error
      handle(results) if results
    }

    query.statistics_update_handler = ->(query, statistics, results, error){
      NSLog("An error occurred calculating statistics: #{error.localizedDescription}") if error
      handle(results) if results
    }

    Medic.execute(query)
  end

  def handle(results)
    today = NSDate.date
    results.enumerateStatisticsFromDate(one_week_ago, toDate: today, withBlock: ->(result, stop_refreshing) {
      if quantity = result.sumQuantity
        NSLog quantity.doubleValueForUnit(HKUnit.countUnit).to_s
      else
        NSLog "no quantity"
      end
    })
  end

  def one_week_ago
    components = NSDateComponents.new.setDay(-7)
    NSCalendar.currentCalendar.dateByAddingComponents(components, toDate: NSDate.date, options: 0)
  end

end
