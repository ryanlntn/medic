class FindStatisticsCollectionController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.blueColor
    self.title = "FindStatisticsCollection"
  end

  def viewDidAppear(animated)
    Medic.find_statistics_collection :step_count, options: :sum, anchor: :one_week_ago, interval: :day do |statistics|
      NSLog statistics.to_s
    end
  end

end
