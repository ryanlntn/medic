class ObserveFinderController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.yellowColor
    self.title = "ObserveFinder"
  end

  def viewDidAppear(animated)
    Medic.observe :step_count do |completion, error|
      Medic.find_sources :step_count do |sources|
        sources.each do |source|
          NSLog source
        end
      end
    end
  end

end
