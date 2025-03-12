import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/settings/data/models/settings_model.dart';
import 'package:todo/features/settings/data/repo/settings_repo.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepo repo;

  SettingsCubit(this.repo) : super(SettingsInitial());

  void loadSettings() {
    final settings = repo.getSettings();
    emit(SettingsChanged(settings));
  }

  void updateSettings({bool? notifications, bool? cloud}) {
    if (state is SettingsChanged) {
      final currentSettings = (state as SettingsChanged).settings;

      final newSettings = SettingsModel(
        notifications: notifications ?? currentSettings.notifications,
        cloud: cloud ?? currentSettings.cloud,
      );

      repo.updateSettings(notifications: notifications, cloud: cloud);
      emit(SettingsChanged(newSettings)); 
    }
  }
}
