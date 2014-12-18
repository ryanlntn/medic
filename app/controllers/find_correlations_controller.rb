class FindCorrelationsController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.blueColor
    self.title = "FindCorrelations"
  end

  def viewDidAppear(animated)
    high_cal = HKQuantity.quantityWithUnit(HKUnit.kilocalorieUnit, doubleValue: 800.0)
    greater_than_high_cal = HKQuery.predicateForQuantitySamplesWithOperatorType(NSGreaterThanOrEqualToPredicateOperatorType, quantity: high_cal)

    sample_predicates = { dietary_energy_consumed: greater_than_high_cal }

    Medic.find_correlations :food, sample_predicates: sample_predicates do |correlations|
      correlations.each do |correlation|
        NSLog correlation.to_s
      end
    end
  end

end
