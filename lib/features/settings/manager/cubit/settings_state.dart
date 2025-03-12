import 'package:todo/features/settings/data/models/settings_model.dart';

abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsChanged extends SettingsState {
  final SettingsModel settings;
  SettingsChanged(this.settings);
}
