class SaveController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.purpleColor
    self.title = "Save"
  end

  def viewDidAppear(animated)
    blood_pressure = {
      correlation_type: :blood_pressure,
      objects: [
        {
          quantity_type: :blood_pressure_systolic,
          quantity: 120
        },
        {
          quantity_type: :blood_pressure_diastolic,
          quantity: 80
        }
      ]
    }
    Medic.save(blood_pressure) do |success, error|
      NSLog "Saved sample" unless error
    end
  end

end
