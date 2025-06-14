import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/theme/theme_cubit.dart';
import 'utils/app_theme.dart';
import 'components/change_theme_segmented_button.dart';

Future<Directory> getCorrectDirectory() async {
  final platform = Platform.operatingSystem;

  if (kDebugMode && ['windows', 'linux', 'macos'].contains(platform)) {
    // Get the desktop project directory
    final projectDirectory = Directory.current;
    // Create a debug storage directory
    final desktopDebugStorageDirectory = Directory(
      '${projectDirectory.path}/DEBUG_STORAGE',
    );
    // Ensure the directory exists
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
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getCorrectDirectory()).path),
  );

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'Change Theme Example App',
            theme: MyOwnAppTheme.lightTheme,
            darkTheme: MyOwnAppTheme.darkTheme,
            // The theme is determined by the current settings in the app's state.
            themeMode: themeState.themeMode,
            home: const Scaffold(
              body: Center(
                child: ChangeThemeSegmentedButton(),
              ),
            ),
          );
        },
      ),
    );
  }
}
