class Utils {
  static const DEFAULT_URL = "https://www.google.com";
  static const _PROD_BASE_URL = "https://api.ravepay.co/v3/sdkcheckout/";
  static const String STANDARD_PAYMENT = "payments";
  static const _DEBUG_BASE_URL = "https://ravesandboxapi.flutterwave.com/v3/sdkcheckout/";

  /// Returns base url depending on test mode
  static String getBaseUrl(final bool isTestMode) {
    return isTestMode ? _DEBUG_BASE_URL : _PROD_BASE_URL;
  }
}
