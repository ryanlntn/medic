describe "Medic::ObserverQuery" do

  before do
    @subject = Medic::ObserverQuery.new type: :step_count do |query, completion, error|
    end
  end

  it "is a subclass of HKObserverQuery" do
    @subject.should.be.kind_of? HKObserverQuery
  end

end
