describe "Medic::ObserverQueryBuilder" do

  before do
    @subject = Medic::ObserverQueryBuilder.new type: :step_count do |query, completion, error|
    end
  end

  it "has a query getter that returns an HKObserverQuery" do
    @subject.query.should.be.kind_of? HKObserverQuery
  end

end
