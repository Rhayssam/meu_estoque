enum LoginStates {
  init,
  loading,
  error,
  success
  ;

  bool get isLoading => this == LoginStates.loading;
  bool get isSuccess => this == LoginStates.success;
  bool get hasError => this == LoginStates.error;
}
