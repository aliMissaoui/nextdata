import 'dart:async';
import 'package:bloc/bloc.dart';
import 'opening_screen_event.dart';
import 'opening_screen_state.dart';

/// Business Logic Component (BLoC) for handling openingScreenInApp-related events and states.
class OpeningScreenBloc extends Bloc<OpeningScreenEvent, OpeningScreenState> {
  OpeningScreenBloc() : super(OpeningScreenInitial()) {
    on<StartOpeningScreenEvent>(_onStartOpeningScreenEvent);
  }

  Future<void> _onStartOpeningScreenEvent(
    StartOpeningScreenEvent event,
    Emitter<OpeningScreenState> emit,
  ) async {
    emit(OpeningScreenLoading());
    await Future.delayed(const Duration(seconds: 3));
    emit(OpeningScreenNavigate());
  }
}
