class FindStatisticsCollectionController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.blueColor
    self.title = "FindStatisticsCollection"
  end

  def viewDidAppear(animated)
    Medic.find_statistics_collection :step_count, options: :sum, anchor: one_week_ago, interval: :day do |statistics|
      NSLog statistics.to_s
    end
  end

  def one_week_ago
    components = NSDateComponents.new.setDay(-7)
    NSCalendar.currentCalendar.dateByAddingComponents(components, toDate: NSDate.date, options: 0)
  end

end
