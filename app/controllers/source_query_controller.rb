class SourceQueryController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.redColor
    self.title = "SourceQuery"
  end

  def viewDidAppear(animated)
    query = Medic::SourceQuery.new(type: :dietary_protein) do |query, sources, error|
      if sources
        sources.allObjects.each do |source|
          NSLog source.name.to_s
        end
      else
        NSLog "no sources"
      end
    end

    Medic.execute(query)
  end

end
