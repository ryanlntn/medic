class AuthController < UIViewController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.redColor
  end

  def viewDidAppear(animated)
    if Medic.available?

      types = {
        write: [ :step_count ],
        read: [ :step_count, :distance_cycling, :distance_walking_running, :date_of_birth ]
      }

      medic.authorize types do |success, error|
        add_steps if success
      end

    end
  end

  def add_steps
    if medic.authorized_for? :step_count
      alert = UIAlertView.new
      alert.message = "Steps works!"
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
