module Medic
  module HKConstants

    ERROR_CODES = {
      no_error: HKNoError,
      health_data_unavailable: HKErrorHealthDataUnavailable,
      health_data_restricted: HKErrorHealthDataRestricted,
      invalid_argument: HKErrorInvalidArgument,
      authorization_denied: HKErrorAuthorizationDenied,
      authorization_not_determined: HKErrorAuthorizationNotDetermined,
      database_inaccessible: HKErrorDatabaseInaccessible,
      user_canceled: HKErrorUserCanceled
    }

    UPDATE_FREQUENCIES = {
      immediate: HKUpdateFrequencyImmediate,
      hourly: HKUpdateFrequencyHourly,
      daily: HKUpdateFrequencyDaily,
      weekly: HKUpdateFrequencyWeekly
    }

    AUTHORIZATION_STATUSES = {
      not_determined: HKAuthorizationStatusNotDetermined,
      sharing_denied: HKAuthorizationStatusSharingDenied,
      sharing_authorized: HKAuthorizationStatusSharingAuthorized
    }

    BIOLOGICAL_SEXES = {
      not_set: HKBiologicalSexNotSet,
      female: HKBiologicalSexFemale,
      male: HKBiologicalSexMale
    }

    BLOOD_TYPES = {
      not_set: HKBloodTypeNotSet,
      a_positive: HKBloodTypeAPositive,
      a_negative: HKBloodTypeANegative,
      b_positive: HKBloodTypeBPositive,
      b_negative: HKBloodTypeBNegative,
      a_b_positive: HKBloodTypeABPositive,
      a_b_negative: HKBloodTypeABNegative,
      o_positive: HKBloodTypeOPositive,
      o_negative: HKBloodTypeONegative
    }

    SLEEP_ANALYSES = {
      in_bed: HKCategoryValueSleepAnalysisInBed,
      asleep: HKCategoryValueSleepAnalysisAsleep
    }

    def error_code(sym)
      ERROR_CODES[sym]
    end

    def update_frequency(sym)
      UPDATE_FREQUENCIES[sym]
    end

    def authorization_status(sym)
      AUTHORIZATION_STATUSES[sym]
    end

    def biological_sex(sym)
      BIOLOGICAL_SEXES[sym]
    end

    def blood_type(sym)
      BLOOD_TYPES[sym]
    end

    def sleep_analysis(sym)
      SLEEP_ANALYSES[sym]
    end

  end
end
