class FindSamplesController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.blueColor
    self.title = "FindSamples"
  end

  def viewDidAppear(animated)
    # Medic.find_samples :step_count do |samples|
    #   samples.each do |sample|
    #     NSLog sample
    #   end
    # end
  end

end
