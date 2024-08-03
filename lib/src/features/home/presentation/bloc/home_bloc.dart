import 'package:bloc/bloc.dart';
import 'package:nextdata/src/features/home/presentation/bloc/home_event.dart';
import 'package:nextdata/src/features/home/presentation/bloc/home_state.dart';

/// Business Logic Component (BLoC) for handling home-related events and states.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  bool isDrawerOpen = false;

  HomeBloc() : super(DrawerInitial()) {
    // Initialize event handlers for specific events.
    on<OpenDrawerEvent>((event, emit) => emit(DrawerOpenedState()));
    on<CloseDrawerEvent>((event, emit) => emit(DrawerClosedState()));
    on<PageTappedEvent>((event, emit) {
      emit(BottomNavigationPageChanged(event.index));
    });
  }
}
