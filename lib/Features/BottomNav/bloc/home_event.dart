part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeTappedEvent extends HomeEvent {
  final int tabIndex;
  HomeTappedEvent(this.tabIndex);
}



class PushPageWithBottomNav extends HomeEvent {
  final Widget page;
  PushPageWithBottomNav(this.page);
}

class RemovePage extends HomeEvent {}

class RefreshNav extends HomeEvent {}

class RemoveAllPagesWithBottomNav extends HomeEvent {}
