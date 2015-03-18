describe Medic::HKConstants do

  before do
    @subject = Object.new
    @subject.extend(Medic::HKConstants)
  end

  describe "#error_code" do
    it "returns the correct error code for symbol" do
      @subject.error_code(:no_error).should == HKNoError
      @subject.error_code(:health_data_unavailable).should == HKErrorHealthDataUnavailable
      @subject.error_code(:health_data_restricted).should == HKErrorHealthDataRestricted
      @subject.error_code(:invalid_argument).should == HKErrorInvalidArgument
      @subject.error_code(:authorization_denied).should == HKErrorAuthorizationDenied
      @subject.error_code(:authorization_not_determined).should == HKErrorAuthorizationNotDetermined
      @subject.error_code(:database_inaccessible).should == HKErrorDatabaseInaccessible
      @subject.error_code(:user_canceled).should == HKErrorUserCanceled
    end
  end

  describe "#update_frequency" do
    it "returns the correct update frequency for symbol" do
      @subject.update_frequency(:immediate).should == HKUpdateFrequencyImmediate
      @subject.update_frequency(:hourly).should == HKUpdateFrequencyHourly
      @subject.update_frequency(:daily).should == HKUpdateFrequencyDaily
      @subject.update_frequency(:weekly).should == HKUpdateFrequencyWeekly
    end
  end

  describe "#authorization_status" do
    it "returns the correct authorization status for symbol" do
      @subject.authorization_status(:not_determined).should == HKAuthorizationStatusNotDetermined
      @subject.authorization_status(:sharing_denied).should == HKAuthorizationStatusSharingDenied
      @subject.authorization_status(:sharing_authorized).should == HKAuthorizationStatusSharingAuthorized
    end
  end

  describe "#biological_sex" do
    it "returns the correct biological sex for symbol" do
      @subject.biological_sex(:not_set).should == HKBiologicalSexNotSet
      @subject.biological_sex(:female).should == HKBiologicalSexFemale
      @subject.biological_sex(:male).should == HKBiologicalSexMale
    end
  end

  describe "#blood_type" do
    it "returns the correct blood type for symbol" do
      @subject.blood_type(:not_set).should == HKBloodTypeNotSet
      @subject.blood_type(:a_positive).should == HKBloodTypeAPositive
      @subject.blood_type(:a_negative).should == HKBloodTypeANegative
      @subject.blood_type(:b_positive).should == HKBloodTypeBPositive
      @subject.blood_type(:b_negative).should == HKBloodTypeBNegative
      @subject.blood_type(:a_b_positive).should == HKBloodTypeABPositive
      @subject.blood_type(:a_b_negative).should == HKBloodTypeABNegative
      @subject.blood_type(:o_positive).should == HKBloodTypeOPositive
      @subject.blood_type(:o_negative).should == HKBloodTypeONegative
    end
  end

  describe "#sleep_analysis" do
    it "returns the correct sleep analysis for symbol" do
      @subject.sleep_analysis(:in_bed).should == HKCategoryValueSleepAnalysisInBed
      @subject.sleep_analysis(:asleep).should == HKCategoryValueSleepAnalysisAsleep
    end
  end

end
