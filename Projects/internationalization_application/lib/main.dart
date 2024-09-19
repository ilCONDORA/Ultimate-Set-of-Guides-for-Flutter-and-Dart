import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:internationalization_application/bloc/app_settings_bloc/app_settings_bloc.dart';
import 'package:internationalization_application/l10n/l10n.dart';
import 'package:internationalization_application/services/condor_localization_service.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize Hydrated Bloc Storage dynamically.
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage
            .webStorageDirectory // Web storage which is not used for this software.
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
            previous.appSettingsModel.locale != current.appSettingsModel.locale,
        builder: (context, state) {
          return MaterialApp(
            title: 'Internationalization Example App',
            locale: state.appSettingsModel.locale,
            supportedLocales: L10n.supportedLocales,
            localizationsDelegates: L10n.localizationsDelegates,
            home: Builder(builder: (context) {
              /// Initialize the service that manages the localization.
              condorLocalization.init(context);

              return Scaffold(
                appBar: AppBar(
                  title: Text(condorLocalization.l10n.appName),
                ),
                body: Center(
                  /// Show the localized text.
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(condorLocalization.l10n.exampleText),
                      const SizedBox(width: 33),
                      DropdownButton<Locale>(
                        value: state.appSettingsModel.locale,
                        items: L10n.supportedLocales.map((iterableLocale) {
                          return DropdownMenuItem(
                            value: iterableLocale,
                            child: Text(
                              iterableLocale.languageCode.toUpperCase(),
                            ),
                          );
                        }).toList(),
                        onChanged: (newLocale) {
                          /// Updates the app settings by dispatching the ChangeAppSettings event to the BLoC.
                          context.read<AppSettingsBloc>().add(
                                ChangeAppSettings(
                                  appSettingsModel:
                                      state.appSettingsModel.copyWith(
                                    locale: newLocale,
                                  ),
                                ),
                              );
                        },
                      )
                    ],
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
