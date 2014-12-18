class FindSamplesController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.blueColor
    self.title = "FindSamples"
  end

  def viewDidAppear(animated)
    Medic.find_samples :step_count, sort: :start_date, limit: 7 do |samples|
      samples.each do |sample|
        NSLog sample.to_s
      end
    end
  end

end
