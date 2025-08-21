abstract class BaseNavigator {
  // ignore: avoid_positional_boolean_parameters
  void setLoadingPage(bool condition);
  void showError(String? message);
  void showExpired() {}
  void refreshState();
  void showConnectionError();
}
