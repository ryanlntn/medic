class SaveController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.purpleColor
    self.title = "Save"
  end

  def viewDidAppear(animated)
    heightQuantity = HKQuantity.quantityWithUnit(HKUnit.inchUnit, doubleValue: 77.0)
    heightType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight)
    now = NSDate.date

    heightSample = HKQuantitySample.quantitySampleWithType(
      heightType,
      quantity: heightQuantity,
      startDate: now,
      endDate: now
    )

    Medic.save heightSample do |success, error|
      NSLog "Saved sample" unless error
    end
  end

end
