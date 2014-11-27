class DataController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.purpleColor
    self.title = "Data"
  end

  def viewDidAppear(animated)
    NSLog medic.biological_sex.to_s
    NSLog medic.date_of_birth.to_s
    NSLog medic.blood_type.to_s
  end

end
