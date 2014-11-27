class AuthController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.redColor
    self.title = "Auth"

    right_button = UIBarButtonItem.alloc.initWithTitle("Data", style: UIBarButtonItemStyleBordered, target: self, action: :open_data)
    self.navigationItem.rightBarButtonItem = right_button
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

  def open_data
    self.navigationController.pushViewController(DataController.new, animated: true)
  end

end
