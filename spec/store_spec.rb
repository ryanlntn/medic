describe "Medic::Store" do

  before do
    @subject = Medic::Store.new
  end

  describe "#authorize" do
    it "calls requestAuthorizationToShareTypes:readTypes:completion with correct args" do
      @subject.mock! 'requestAuthorizationToShareTypes:readTypes:completion' do |share, read, comp|
        share.should.be.kind_of? NSSet
        read.should.be.kind_of? NSSet
        comp.should.respond_to? :call
        true
      end
      @subject.authorize(read: [:step_count]){|success, error|}.should == true
    end
  end

  describe "#authorized?" do
    it "calls authorizationStatusForType with correct args" do
      @subject.mock! 'authorizationStatusForType' do |type|
        type.should.be.kind_of? HKObjectType
        false
      end
      @subject.authorized?(:step_count).should == false
    end

    it "has an #is_authorized? alias" do
      @subject.method(:is_authorized?).should == @subject.method(:authorized?)
    end

    it "has an #authorized_for? alias" do
      @subject.method(:authorized_for?).should == @subject.method(:authorized?)
    end

    it "has an #is_authorized_for? alias" do
      @subject.method(:is_authorized_for?).should == @subject.method(:authorized?)
    end
  end

  describe "#biological_sex" do
    it "calls biologicalSexWithError with correct args" do
      @subject.mock! 'biologicalSexWithError' do |error|
        error.should.be.kind_of? Pointer
        mock(:biologicalSex, return: HKBiologicalSexFemale)
      end
      @subject.biological_sex.should == :female
    end
  end

  describe "#blood_type" do
    it "calls bloodTypeWithError with correct args" do
      @subject.mock! 'bloodTypeWithError' do |error|
        error.should.be.kind_of? Pointer
        mock(:bloodType, return: HKBloodTypeONegative)
      end
      @subject.blood_type.should == :o_negative
    end
  end

  describe "#date_of_birth" do
    it "calls dateOfBirthWithError with correct args" do
      @subject.mock! 'dateOfBirthWithError' do |error|
        error.should.be.kind_of? Pointer
        true
      end
      @subject.date_of_birth.should == true
    end
  end

end
