module Medic
  module HKConstants

    def error_code(sym)
      {
        no_error: HKNoError,
        health_data_unavailable: HKErrorHealthDataUnavailable,
        health_data_restricted: HKErrorHealthDataRestricted,
        invalid_argument: HKErrorInvalidArgument,
        authorization_denied: HKErrorAuthorizationDenied,
        authorization_not_determined: HKErrorAuthorizationNotDetermined,
        database_inaccessible: HKErrorDatabaseInaccessible,
        user_canceled: HKErrorUserCanceled
      }[sym]
    end

    def update_frequency(sym)
      {
        immediate: HKUpdateFrequencyImmediate,
        hourly: HKUpdateFrequencyHourly,
        daily: HKUpdateFrequencyDaily,
        weekly: HKUpdateFrequencyWeekly
      }[sym]
    end

    def authorization_status(sym)
      {
        not_determined: HKAuthorizationStatusNotDetermined,
        sharing_denied: HKAuthorizationStatusSharingDenied,
        sharing_authorized: HKAuthorizationStatusSharingAuthorized
      }[sym]
    end

    def biological_sex(sym)
      {
        not_set: HKBiologicalSexNotSet,
        female: HKBiologicalSexFemale,
        male: HKBiologicalSexMale
      }[sym]
    end

    def blood_type(sym)
      {
        not_set: HKBloodTypeNotSet,
        a_positive: HKBloodTypeAPositive,
        a_negative: HKBloodTypeANegative,
        b_positive: HKBloodTypeBPositive,
        b_negative: HKBloodTypeBNegative,
        a_b_positive: HKBloodTypeABPositive,
        a_b_negative: HKBloodTypeABNegative,
        o_positive: HKBloodTypeOPositive,
        o_negative: HKBloodTypeONegative
      }[sym]
    end

    def sleep_analysis(sym)
      {
        in_bed: HKCategoryValueSleepAnalysisInBed,
        asleep: HKCategoryValueSleepAnalysisAsleep
      }[sym]
    end

  end
end
