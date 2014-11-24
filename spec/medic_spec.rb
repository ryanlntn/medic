describe "Medic" do
  before do
    @medic = Medic.new
  end

  it ".available?" do
    Medic.available?.should == true
  end

  it ".is_available?" do
    Medic.is_available?.should == true
  end
end
