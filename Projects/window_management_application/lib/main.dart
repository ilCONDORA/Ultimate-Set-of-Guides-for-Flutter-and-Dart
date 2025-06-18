import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:window_management_application/bloc/window/window_cubit.dart';
import 'package:window_manager/window_manager.dart';

Future<Directory> getCorrectDirectory() async {
  final platform = Platform.operatingSystem;

  if (kDebugMode && ['windows', 'linux', 'macos'].contains(platform)) {
    // Get the desktop project directory.
    final projectDirectory = Directory.current;
    // Create a debug storage directory.
    final desktopDebugStorageDirectory = Directory(
      '${projectDirectory.path}/DEBUG_STORAGE',
    );
    // Ensure the directory exists.
    await desktopDebugStorageDirectory.create(recursive: true);
    return desktopDebugStorageDirectory;
  }

  switch (platform) {
    case 'android':
      return getApplicationDocumentsDirectory();
    case 'ios':
    case 'macos':
      return getLibraryDirectory();
    case 'windows':
    case 'linux':
      return getApplicationSupportDirectory();
    default:
      return getTemporaryDirectory();
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory((await getCorrectDirectory()).path),
  );

  // We use the if statement to cut off the window management system.
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    await windowManager.ensureInitialized();

    final windowState = WindowCubit().state;

    // This variable has a lot of options, we are going to use the size, center and minimumSize.
    WindowOptions windowOptions = WindowOptions(
      size:
          windowState
              .windowSize, // At first launch it will be null and id doesn't give any errors but after that it will use the size saved in the state.
      center:
          windowState.windowPosition ==
          null, // If the position is null, so after the first launch, it will center the window and after it will use the position saved in the state.
      minimumSize: Size(700, 600),
    );

    // After setting the size, constraint and other things we call this method to set other options.
    // Fun fact: here we have the 'windowManager.setSize' method but it doesn't work, that's why we set the size in the options.
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      if (windowState.windowPosition != null) {
        await windowManager.setPosition(windowState.windowPosition!);
      }
      if (windowState.isMaximized) {
        await windowManager.maximize();
      }
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

// We need to use WindowListener and StatefulWidget to use the windowManager methods.
// I'm not going to explain the methods because the names of them are self explanatory.
class _MainAppState extends State<MainApp> with WindowListener {
  final WindowCubit windowCubit = WindowCubit();

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
  }

  @override
  void onWindowMaximize() {
    if (mounted) {
      windowCubit.changeWindowMaximizedState(true);
    }
  }

  @override
  void onWindowUnmaximize() {
    if (mounted) {
      windowCubit.changeWindowMaximizedState(false);
    }
  }

  @override
  void onWindowResized() async {
    if (mounted) {
      windowCubit.changeWindowSize(await windowManager.getSize());
    }
  }

  @override
  void onWindowMoved() async {
    if (mounted) {
      windowCubit.changeWindowPosition(await windowManager.getPosition());
    }
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Window Manager Example App',
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
