class FindStatisticsController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.blueColor
    self.title = "FindStatistics"
  end

  def viewDidAppear(animated)
    Medic.find_statistics :step_count, options: :sum do |statistics|
      NSLog statistics.to_s
    end
  end


end
