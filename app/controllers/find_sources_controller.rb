class FindSourcesController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.blueColor
    self.title = "FindSources"
  end

  def viewDidAppear(animated)
    Medic.find_sources :step_count do |sources|
      sources.each do |source|
        NSLog source
      end
    end
  end

end
