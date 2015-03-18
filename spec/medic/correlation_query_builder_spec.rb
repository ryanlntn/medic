describe Medic::CorrelationQueryBuilder do

  before do
    high_cal = HKQuantity.quantityWithUnit(HKUnit.kilocalorieUnit, doubleValue: 800.0)
    greater_than_high_cal = HKQuery.predicateForQuantitySamplesWithOperatorType(NSGreaterThanOrEqualToPredicateOperatorType, quantity: high_cal)
    energy_consumed = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDietaryEnergyConsumed)
    sample_predicates = { energy_consumed => greater_than_high_cal }
    @subject = Medic::CorrelationQueryBuilder.new type: :food, sample_predicates: sample_predicates do |query, correlations, error|
    end
  end

  it "has a query getter that returns an HKCorrelationQuery" do
    @subject.query.should.be.kind_of? HKCorrelationQuery
  end

end
