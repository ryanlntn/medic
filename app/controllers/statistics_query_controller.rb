class StatisticsQueryController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.greenColor
    self.title = "Query"
  end

  def viewDidAppear(animated)
    query = Medic::StatisticsQuery.new type: :step_count, options: :sum do |query, result, error|
      if result
        NSLog result.startDate.to_s
        NSLog result.quantityType.to_s
        NSLog result.averageQuantity.to_s
        NSLog result.maximumQuantity.to_s
        NSLog result.minimumQuantity.to_s
        NSLog result.sumQuantity.to_s
      end
    end

    Medic.execute(query)
  end

end
