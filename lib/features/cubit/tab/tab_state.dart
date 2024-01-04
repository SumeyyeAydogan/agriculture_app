part of 'tab_cubit.dart';

abstract class TabState extends Equatable {
  const TabState();

  @override
  List<Object> get props => [];

}

class TabInitial extends TabState {
  final TabController? tabController;
  const TabInitial(this.tabController);
}

class TabLoading extends TabState {}
