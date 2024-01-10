part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeCompleted extends HomeState {
  final List<HomeAdsImagesResponseModel> responseModel;
  const HomeCompleted(this.responseModel);

  @override
  List<Object> get props => [responseModel];
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);
}
