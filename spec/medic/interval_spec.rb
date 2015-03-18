describe Medic::Interval do

  before do
    @subject = Object.new
    @subject.extend(Medic::Interval)
  end

  describe "#interval" do
    it "returns the correct NSDateComponents object for symbol" do
      @subject.interval(:nine_hundred_ninety_nine_days).should.be.kind_of? NSDateComponents
      @subject.interval(:nine_hundred_ninety_nine_days).day.should == 999
      @subject.interval("365 days").day.should == 365
      @subject.interval(:day).day.should == 1
    end
  end
end
