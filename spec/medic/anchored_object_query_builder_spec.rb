describe "Medic::AnchoredObjectQueryBuilder" do

  before do
    @subject = Medic::AnchoredObjectQueryBuilder.new type: :step_count do |query, results, new_anchor, error|
    end
  end

  it "has a query getter that returns an HKAnchoredObjectQuery" do
    @subject.query.should.be.kind_of? HKAnchoredObjectQuery
  end

end
