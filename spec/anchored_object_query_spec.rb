describe "Medic::AnchoredObjectQuery" do

  before do
    @subject = Medic::AnchoredObjectQuery.new type: :step_count do |query, results, new_anchor, error|
    end
  end

  it "is a subclass of HKAnchoredObjectQuery" do
    @subject.should.be.kind_of? HKAnchoredObjectQuery
  end

end
