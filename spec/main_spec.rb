describe "Application 'medic'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "has one windows" do
    @app.windows.size.should == 1
  end
end
