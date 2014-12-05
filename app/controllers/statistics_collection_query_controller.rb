class StatisticsCollectionQueryController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.blueColor
    self.title = "StatisticsCollectionQuery"
  end

  def viewDidAppear(animated)
    interval = NSDateComponents.new.setDay(1)

    query = Medic::StatisticsCollectionQuery.new(type: :step_count, options: :sum, anchor: yesterday, interval: interval)

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
    results.enumerateStatisticsFromDate(yesterday, toDate: today, withBlock: ->(result, stop_refreshing) {
      if quantity = result.sumQuantity
        NSLog quantity.doubleValueForUnit(HKUnit.countUnit).to_s
      else
        NSLog "no quantity"
      end
    })
  end

  def yesterday
    components = NSDateComponents.new.setDay(-1)
    NSCalendar.currentCalendar.dateByAddingComponents(components, toDate: NSDate.date, options: 0)
  end

end
