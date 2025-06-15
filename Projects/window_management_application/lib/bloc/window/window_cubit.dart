import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'window_state.dart';

/// [WindowCubit] manages the application's window state and it also saves it thanks to the [HydratedBloc] implementation.
///
/// It allows the change of the windows size, window position and window maximized state through it's methods:
/// [changeWindowSize], [changeWindowPosition], [changeWindowMaximizedState].
///
/// The current settings are stored in the state, which is persisted using the [HydratedCubit] functionality.
///
class WindowCubit extends HydratedCubit<WindowState> {
  /// Constructor for [WindowCubit]. It initializes the state by using the constructor of [WindowState].
  ///
  WindowCubit() : super(WindowInitial());

  /// Method called to change the state of the window size.
  ///
  void changeWindowSize(Size newSize) {
    emit(state.copyWith(windowSize: newSize));
  }

  /// Method called to change the state of the window position.
  ///
  void changeWindowPosition(Offset newPosition) {
    emit(state.copyWith(windowPosition: newPosition));
  }

  /// Method called to change the state of the window maximized state.
  ///
  void changeWindowMaximizedState(bool newMaximizedState) {
    emit(state.copyWith(isMaximized: newMaximizedState));
  }

  @override
  WindowState? fromJson(Map<String, dynamic> json) {
    return WindowState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(WindowState state) {
    return state.toJson();
  }
}
