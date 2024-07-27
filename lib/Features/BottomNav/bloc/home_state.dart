part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final int currentIndex;
  final List<Widget> routes;

  const HomeState(this.currentIndex, this.routes);
  @override
  List<Object?> get props => [currentIndex, routes];
}

class HomeTabState extends HomeState {
  const HomeTabState(super.currentIndex, super.routes);
}
