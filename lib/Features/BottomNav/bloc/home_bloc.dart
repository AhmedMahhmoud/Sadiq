import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeTabState(0, [])) {
    on<HomeTappedEvent>(_onHomeTapped);
    on<HomeEvent>(
      (event, emit) async {
        if (event is HomeTappedEvent) {
          emit(HomeTabState(event.tabIndex, const []));
        } else if (event is PushPageWithBottomNav) {
          emit(HomeTabState(
              state.currentIndex,
              state.routes.toList()
                ..add(FadeInUp(
                    key: GlobalKey(),
                    duration: const Duration(milliseconds: 300),
                    child: event.page))));
        } else if (event is RemovePage) {
          emit(HomeTabState(
              state.currentIndex, state.routes.toList()..removeLast()));
        } else if (event is RemoveAllPagesWithBottomNav) {
          emit(HomeTabState(state.currentIndex, const []));
        } else if (event is RefreshNav) {
          if (state.routes.isNotEmpty) {
            final lastRoute = state.routes.last;

            emit(HomeTabState(
                state.currentIndex,
                state.routes.toList()
                  ..add(FadeInUp(
                      key: GlobalKey(),
                      duration: const Duration(milliseconds: 0),
                      child: lastRoute))));
          }
        }
      },
    );
    on<UpdateAmIatHomeEvent>(_onUpdateAmIatHome);
  }
  bool amIatHomeNav = true;
  int tabIndex = 0;

  FutureOr<void> _onUpdateAmIatHome(
      UpdateAmIatHomeEvent event, Emitter<HomeState> emit) {
    amIatHomeNav = event.amIatHomeNav;
    emit(HomeTabState(tabIndex, state.routes));
  }

  FutureOr<void> _onHomeTapped(HomeTappedEvent event, Emitter<HomeState> emit) {
    emit(HomeTabState(event.tabIndex, const []));
  }
}
