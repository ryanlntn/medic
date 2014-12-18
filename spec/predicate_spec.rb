describe "Medic::Predicate" do

  before do
    @subject = Object.new
    @subject.extend(Medic::Predicate)
  end

  describe "#predicate" do
    it "returns an NSPredicate for the given symbols" do
      @subject.predicate(uuid: :something).should.be.kind_of NSPredicate
      @subject.predicate(source: :something).should.be.kind_of NSPredicate
      @subject.predicate(meta_data: :something).should.be.kind_of NSPredicate
      @subject.predicate(no_correlation: true).should.be.kind_of NSPredicate
      @subject.predicate(workout: :something).should.be.kind_of NSPredicate
    end

    it "passes through the NSPredicate if given a predicate" do
      @subject.predicate(predicate: :whatever).should == :whatever
    end

    it "returns nil if no arguments match" do
      @subject.predicate({}).should == nil
      @subject.predicate({nonsense: nil}).should == nil
    end
  end

end
