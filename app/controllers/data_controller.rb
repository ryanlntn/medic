class DataController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.purpleColor
    self.title = "Data"

    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = "data"
    @label.sizeToFit
    @label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)
    self.view.addSubview @label
  end

  def viewDidAppear(animated)
    NSLog medic.biological_sex.to_s
    NSLog medic.date_of_birth.to_s
    NSLog medic.blood_type.to_s
  end

end
