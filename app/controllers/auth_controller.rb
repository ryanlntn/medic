class AuthController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.redColor
    self.title = "Auth"
  end

  def viewDidAppear(animated)
    if Medic.available?

      types = {
        share: [ :step_count ],
        read: [ :date_of_birth, :biological_sex, :blood_type ]
      }

      medic.authorize types do |success, error|
        NSLog "Authorized!"
      end

      medic.enable_background_delivery :step_count, :hourly do |success, error|
        NSLog "This worked!"
      end
    end
  end

end
