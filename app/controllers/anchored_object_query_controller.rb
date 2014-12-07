class AnchoredObjectQueryController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.yellowColor
    self.title = "AnchoredObjectQuery"
  end

  def viewDidAppear(animated)
    @anchor = nil

    query = Medic::AnchoredObjectQuery.new type: :step_count, anchor: @anchor do |query, results, new_anchor, error|
      @anchor = new_anchor
      results.each do |sample|
        NSLog sample.to_s
      end
    end

    Medic.execute(query)
  end

end
