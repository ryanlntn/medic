describe "Medic::SampleQueryBuilder" do

  before do
    @subject = Medic::SampleQueryBuilder.new type: :dietary_protein, limit: 7 do |query, results, error|
    end
  end

  it "has a query getter that returns an HKSampleQuery" do
    @subject.query.should.be.kind_of? HKSampleQuery
  end

end
