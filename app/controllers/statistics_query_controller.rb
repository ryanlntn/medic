class StatisticsQueryController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.yellowColor
    self.title = "StatisticsQuery"
  end

  def viewDidAppear(animated)
    query = Medic::StatisticsQuery.new type: :step_count, options: :sum do |query, result, error|
      if quantity = result.sumQuantity
        NSLog quantity.doubleValueForUnit(HKUnit.countUnit).to_s
      else
        NSLog "no quantity"
      end
    end

    Medic.execute(query)
  end

end
