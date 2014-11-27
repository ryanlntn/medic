class AuthController < UIViewController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.redColor
  end

  def viewDidAppear(animated)
    if Medic.available?

      types = {
        share: [ :step_count ],
        read: [ :step_count, :distance_cycling, :distance_walking_running, :date_of_birth ]
      }

      medic.authorize types do |success, error|
        medic.enable_background_delivery :step_count, :hourly do |success, error|
          NSLog "This worked!"
        end
      end

    end
  end

  def add_steps
    if medic.authorized_for? :step_count
      alert = UIAlertView.new
      alert.message = "Steps work!"
      alert.show
    else
      alert = UIAlertView.new
      alert.message = "Steps doesn't work!"
      alert.show
    end
  end

  def medic
    UIApplication.sharedApplication.delegate.health_store
  end

end
