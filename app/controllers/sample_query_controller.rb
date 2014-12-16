class SampleQueryController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.purpleColor
    self.title = "SampleQuery"
  end

  def viewDidAppear(animated)
    query = Medic::SampleQuery.new(type: :dietary_protein, sort_desc: :start_date, limit: 7) do |query, results, error|
      if results
        results.each do |sample|
          NSLog "#{sample.startDate} - #{sample.quantity.doubleValueForUnit(HKUnit.gramUnit)}"
        end
      else
        NSLog "no results"
      end
    end

    Medic.execute(query)
  end

end
