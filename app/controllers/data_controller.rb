class DataController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.purpleColor
    self.title = "Data"
  end

  def viewDidAppear(animated)
    NSLog Medic.biological_sex.to_s
    NSLog Medic.date_of_birth.to_s
    NSLog Medic.blood_type.to_s
  end

end
