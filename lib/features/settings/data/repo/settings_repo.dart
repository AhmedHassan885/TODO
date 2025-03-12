import 'package:todo/features/settings/data/models/settings_model.dart';

class SettingsRepo {
  SettingsRepo._ob();
  static final SettingsRepo _instance = SettingsRepo._ob();
  static SettingsRepo getInstance() {
    return _instance;
  }

  SettingsModel _settings = SettingsModel(notifications: true, cloud: true);

  SettingsModel getSettings() {
    return _settings;
  }

  void updateSettings({bool? notifications, bool? cloud}) {
    _settings = SettingsModel(
      notifications: notifications ?? _settings.notifications,
      cloud: cloud ?? _settings.cloud,
    );
  }
}
