import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:switch_theme_application/bloc/app_settings_bloc/app_settings_bloc.dart';
import 'package:switch_theme_application/config/app_theme.dart';
import 'package:switch_theme_application/widgets/condor_switch_theme_mode.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize Hydrated Bloc Storage dynamically.
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationSupportDirectory(), // Store data in the \AppData\Roaming\ilCONDORA folder in Windows and /.local/share in Linux, idk for MacOS.
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppSettingsBloc(),
      child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
        buildWhen: (previous, current) =>
            previous.appSettingsModel.themeMode !=
            current.appSettingsModel.themeMode,
        builder: (context, state) {
          return MaterialApp(
            title: 'Switch Theme Example App',
            theme: CondorAppTheme.lightTheme,
            darkTheme: CondorAppTheme.darkTheme,

            /// The theme is determined by the current settings in the app's state.
            themeMode: state.appSettingsModel.themeMode,
            home: const Scaffold(
              body: Center(
                child: CondorSwitchThemeMode(),
              ),
            ),
          );
        },
      ),
    );
  }
}
