describe "Medic" do
  before do
    @medic = Medic.new
  end

  describe ".available?" do
    it "determines if HealthKit is available" do
      Medic.available?.should == true
    end

    it "has an .is_available? alias" do
      Medic.is_available?.should == true
    end
  end

  describe "#authorize" do

  end

  describe "#authorized?" do

  end


end
