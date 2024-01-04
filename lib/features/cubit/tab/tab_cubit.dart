import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabController? tabController;
  TabCubit(this.tabController)
      : super(TabInitial(tabController));
  void changeIndex({required int index}) {
    emit(TabLoading());
    tabController?.index = index;
    emit(TabInitial(tabController));
  }
}
