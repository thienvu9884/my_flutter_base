import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

class SimpleBlocObserver extends BlocObserver {
  const SimpleBlocObserver();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('🔵 [Created] ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('🔵 [Event] ${bloc.runtimeType} | $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    final currentStateName = change.currentState.toString().length > 200
        ? change.currentState.runtimeType
        : change.currentState;
    final nextStateName = change.nextState.toString().length > 200
        ? change.nextState.runtimeType
        : change.nextState;

    log(
      '🔵 [Change] ${bloc.runtimeType} | Current: $currentStateName -> Next: $nextStateName',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('🔴 [Error] ${bloc.runtimeType} | $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('⚪ [Closed] ${bloc.runtimeType}');
  }
}
