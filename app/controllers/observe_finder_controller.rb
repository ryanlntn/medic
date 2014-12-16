class ObserveFinderController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.yellowColor
    self.title = "ObserveFinder"
  end

  def viewDidAppear(animated)
    Medic.observe :step_count do |completion, error|
      get_step_sources
    end
  end

  def get_step_sources
    query = Medic::SourceQuery.new(type: :step_count) do |query, sources, error|
      if sources
        sources.allObjects.each do |source|
          NSLog source.public_methods.to_s
          NSLog source.name.to_s
        end
      else
        NSLog "no sources"
      end
    end

    Medic.execute(query)
  end

end
