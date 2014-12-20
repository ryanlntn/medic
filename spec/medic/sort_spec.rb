describe "Medic::Sort" do

  before do
    @subject = Object.new
    @subject.extend(Medic::Sort)
  end

  describe "#sort_descriptors" do
    it "returns an array of NSSortDescriptor objects" do
      @subject.sort_descriptors(:start_date).should.all? { |sd| sd.kind_of? NSSortDescriptor }
      @subject.sort_descriptors([:start_date, :end_date]).should.all? { |sd| sd.kind_of? NSSortDescriptor }
    end
  end

  describe "#sort_identifier" do
    it "returns the correct sort_identifier for symbol" do
      @subject.sort_identifier(:start_date).should == HKSampleSortIdentifierStartDate
      @subject.sort_identifier(:end_date).should == HKSampleSortIdentifierEndDate
    end

    it "passes through the argument if not a symbol" do
      @subject.sort_identifier(NSSortDescriptor).should == NSSortDescriptor
    end
  end

end
