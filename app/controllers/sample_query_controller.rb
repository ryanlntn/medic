class SampleQueryController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.yellowColor
    self.title = "SampleQuery"
  end

  def viewDidAppear(animated)
    query = Medic::SampleQuery.new(type: :dietary_protein, limit: 7) do |query, results, error|
      if results
        results.each do |sample|
          NSLog sample.quantity.doubleValueForUnit(HKUnit.gramUnit).to_s
        end
      else
        NSLog "no results"
      end
    end

    Medic.execute(query)
  end

end
