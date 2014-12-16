class CorrelationQueryController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.greenColor
    self.title = "CorrelationQuery"
  end

  def viewDidAppear(animated)
    high_cal = HKQuantity.quantityWithUnit(HKUnit.kilocalorieUnit, doubleValue: 800.0)
    greater_than_high_cal = HKQuery.predicateForQuantitySamplesWithOperatorType(NSGreaterThanOrEqualToPredicateOperatorType, quantity: high_cal)
    energy_consumed = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDietaryEnergyConsumed)
    sample_predicates = { energy_consumed => greater_than_high_cal }
    query = Medic::CorrelationQuery.new type: :food, sample_predicates: sample_predicates do |query, correlations, error|
      if correlations
        correlations.each do |correlation|
          NSLog correlation.to_s
        end
      else
        NSLog "No correlations found."
      end
    end

    Medic.execute(query)
  end

end
