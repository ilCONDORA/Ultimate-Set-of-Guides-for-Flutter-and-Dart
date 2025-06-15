part of 'window_cubit.dart';

/// [WindowState] manages the state of the application's window state.
///
/// Here we define all the variables and methods used to manage the state.
///
@immutable
class WindowState {
  final Size? windowSize;
  final Offset? windowPosition;
  final bool isMaximized;

  /// Constructor for [WindowState].
  /// The only variable instantiated is [isMaximized] and is set to false,
  /// the other two can be null an will stay null until the first app launch.
  ///
  const WindowState({
    this.windowSize,
    this.windowPosition,
    this.isMaximized = false,
  });

  /// This method will be used by the other methods inside [WindowCubit],
  /// it's a simple way to set only one value or more without problems for the other ones.
  ///
  WindowState copyWith({
    Size? windowSize,
    Offset? windowPosition,
    bool? isMaximized,
  }) {
    return WindowState(
      windowSize: windowSize ?? this.windowSize,
      windowPosition: windowPosition ?? this.windowPosition,
      isMaximized: isMaximized ?? this.isMaximized,
    );
  }

  /// Converts the current state to a JSON map.
  /// See concrete implementation in [WindowCubit].
  ///
  Map<String, dynamic> toJson() {
    return {
      'windowSize': {'width': windowSize?.width, 'height': windowSize?.height},
      'windowPosition': {'x': windowPosition?.dx, 'y': windowPosition?.dy},
      'isMaximized': isMaximized,
    };
  }

  /// Creates a new instance of [WindowState] from a JSON map.
  /// See concrete implementation in [WindowCubit].
  ///
  static WindowState fromJson(Map<String, dynamic> json) {
    return WindowState(
      windowSize: Size(
        json['windowSize']['width'] as double,
        json['windowSize']['height'] as double,
      ),
      windowPosition: Offset(
        json['windowPosition']['x'] as double,
        json['windowPosition']['y'] as double,
      ),
      isMaximized: json['isMaximized'] as bool,
    );
  }
}

/// This class is used by [WindowCubit] as a constructor for the initial state.
/// [WindowInitial] extends [WindowState] so the real constructor is the one in [WindowState].
///
final class WindowInitial extends WindowState {}
