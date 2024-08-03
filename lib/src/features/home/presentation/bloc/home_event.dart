import 'package:equatable/equatable.dart';

/// Base class for home events.
///
/// All events related to home should extend this class.
abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event for opening home drawer.
///
/// This event is used to open the drawer in the UI.
class OpenDrawerEvent extends HomeEvent {}

/// Event for opening home drawer.
///
/// This event is used to close the drawer in the UI.
class CloseDrawerEvent extends HomeEvent {}

class PageTappedEvent extends HomeEvent {
  final int index;

  PageTappedEvent(this.index);

  @override
  List<Object> get props => [index];
}
