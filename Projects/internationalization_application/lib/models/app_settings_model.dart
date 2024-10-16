import 'package:flutter/material.dart';

/// Model for the application settings.
class AppSettingsModel {
  final Locale locale;

  /// Sets the default value for the application locale.
  static const Locale defaultLocale = Locale('en', 'US');

  /// Constructor for creating an AppSettings instance.
  AppSettingsModel({
    this.locale = defaultLocale,
  });

  /// Create an AppSettings instance from a JSON map.
  factory AppSettingsModel.fromJson(Map<String, dynamic> json) {
    return AppSettingsModel(
      locale: Locale(
        json['languageCode'] as String? ?? defaultLocale.languageCode,
        json['countryCode'] as String? ?? defaultLocale.countryCode,
      ),
    );
  }

  /// Converts an AppSettings instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'languageCode': locale.languageCode,
      'countryCode': locale.countryCode,
    };
  }

  /// Creates a copy of the current AppSettingsModel with the option to modify specific properties. If a property is not provided, the current value is retained.
  /// This method is used to create a new instance of AppSettingsModel with modified properties.
  AppSettingsModel copyWith({
    Locale? locale,
  }) {
    return AppSettingsModel(
      locale: locale ?? this.locale,
    );
  }
}
