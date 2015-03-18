describe Medic::SourceQueryBuilder do

  before do
    @subject = Medic::SourceQueryBuilder.new type: :dietary_protein do |query, sources, error|
    end
  end

  it "has a query getter that returns an HKSourceQuery" do
    @subject.query.should.be.kind_of? HKSourceQuery
  end

end
