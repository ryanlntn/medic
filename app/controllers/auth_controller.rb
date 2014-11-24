class AuthController < UIViewController

  def viewDidLoad
    super
  end

  def viewDidAppear(animated)
    if Medic.available?

      requested_data = [
        HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount),
        HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceCycling),
        HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceWalkingRunning)
      ]

      UIApplication.sharedApplication.delegate.health_store.requestAuthorizationToShareTypes NSSet.setWithObjects(nil), readTypes: NSSet.setWithArray(requested_data), completion: ->(success, error){
        if success
          alert = UIAlertView.new
          alert.message = "Success"
          alert.show
        else
          alert = UIAlertView.new
          alert.message = "Failure #{error.localizedDescription}"
          alert.show
        end
      }

    end
  end

end
