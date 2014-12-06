describe "Medic::SourceQuery" do

  before do
    @subject = Medic::SourceQuery.new type: :dietary_protein do |query, sources, error|
    end
  end

  it "is a subclass of HKSourceQuery" do
    @subject.should.be.kind_of? HKSourceQuery
  end

end
