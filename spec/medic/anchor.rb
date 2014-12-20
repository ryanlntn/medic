describe "Medic::Anchor" do

  before do
    @subject = Object.new
    @subject.extend(Medic::Anchor)
  end

  describe "#anchor_for_symbol" do
    it "returns the correct NSDate object for symbol" do
      @subject.anchor_for_symbol(:nine_hundred_ninety_nine_days_ago).should.be.kind_of? NSDate
      @subject.anchor_for_symbol(:nine_hundred_ninety_nine_days_ago).to_s.should == NSCalendar.currentCalendar.dateByAddingComponents(NSDateComponents.new.setDay(-999), toDate: NSDate.date, options: 0).to_s
      @subject.anchor_for_symbol("365 days").to_s.should == NSCalendar.currentCalendar.dateByAddingComponents(NSDateComponents.new.setDay(-365), toDate: NSDate.date, options: 0).to_s
      @subject.anchor_for_symbol(:day).to_s.should == NSCalendar.currentCalendar.dateByAddingComponents(NSDateComponents.new.setDay(-1), toDate: NSDate.date, options: 0).to_s
    end
  end
end
