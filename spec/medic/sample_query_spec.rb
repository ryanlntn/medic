describe "Medic::SampleQuery" do

  before do
    @subject = Medic::SampleQuery.new type: :dietary_protein, limit: 7 do |query, results, error|
    end
  end

  it "is a subclass of HKSampleQuery" do
    @subject.should.be.kind_of? HKSampleQuery
  end

end
