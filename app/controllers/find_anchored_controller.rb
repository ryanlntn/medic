class FindAnchoredController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.blueColor
    self.title = "FindAnchored"
  end

  def viewDidAppear(animated)
    @anchor = nil

    Medic.find_anchored :step_count, anchor: @anchor do |results, new_anchor|
      @anchor = new_anchor
      results.each do |sample|
        NSLog sample.to_s
      end
    end
  end


end
