class SaveController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.purpleColor
    self.title = "Save"
  end

  def viewDidAppear(animated)
    height = { quantity_type: :height, quantity: 77, unit: "inch" }
    Medic.save(height) do |success, error|
      NSLog "Saved sample" unless error
    end
  end

end
