sealed class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingCompaniesState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeErrorLoadingCompaniesState extends HomeStates {
  final String message;

  HomeErrorLoadingCompaniesState(this.message);
}

class HomeErrorState extends HomeStates {
  final String message;

  HomeErrorState(this.message);
}

class HomeSuccessState extends HomeStates {
  final String message;

  HomeSuccessState(this.message);
}
