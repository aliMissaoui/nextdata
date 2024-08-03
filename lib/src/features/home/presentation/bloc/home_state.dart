import 'package:equatable/equatable.dart';

/// Base class for all home states.
///
/// This class extends [Equatable] to enable value comparison.
abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Initial state of the drawer.
class DrawerInitial extends HomeState {}

/// State indicating that the drawer has been opened.
class DrawerClosedState extends HomeState {}

/// State indicating that the drawer has been opened.
class DrawerOpenedState extends HomeState {}

class BottomNavigationInitial extends HomeState {}

class BottomNavigationPageChanged extends HomeState {
  final int currentIndex;

  BottomNavigationPageChanged(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}
