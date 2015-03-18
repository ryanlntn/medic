describe Medic::QueryOptions do

  before do
    @subject = Object.new
    @subject.extend(Medic::QueryOptions)
  end

  describe "#query_options" do
    it "correctly calculates the value for options" do
      @subject.query_options(:none).should == 0
      @subject.query_options([:strict_start_date]).should == 1
      @subject.query_options([:strict_start_date, :strict_end_date]).should == 3
    end
  end

  describe "#query_option" do
    it "returns the correct type identifier for symbol" do
      @subject.query_option(:none).should == HKQueryOptionNone
      @subject.query_option(:strict_start_date).should == HKQueryOptionStrictStartDate
      @subject.query_option(:strict_end_date).should == HKQueryOptionStrictEndDate
    end
  end

end
