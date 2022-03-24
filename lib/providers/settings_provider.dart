import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  late SharedPreferences prefs;

  SettingsProvider() {
    setup();
  }

  void setup() async {
    prefs = await SharedPreferences.getInstance();

    _resolutionPreset = ResolutionPreset.values.byName(
        prefs.getString('resolutionPreset') ?? ResolutionPreset.high.name);

    _flashMode = FlashMode.values.byName(
      prefs.getString('flashMode') ?? FlashMode.auto.name,
    );

    _showInfoOnCamera = prefs.getBool('showInfoOnCamera') ?? true;
    _showHeading = prefs.getBool('showHeading') ?? true;
    _showPosition = prefs.getBool('showPosition') ?? true;
    _showAltitude = prefs.getBool('showAltitude') ?? true;
    _useMetricForAlt = prefs.getBool('useMetricForAlt') ?? true;

    notifyListeners();
  }

  ResolutionPreset _resolutionPreset = ResolutionPreset.high;
  ResolutionPreset get resolutionPreset => _resolutionPreset;

  void setResolutionPreset(ResolutionPreset resolutionPreset) async {
    _resolutionPreset = resolutionPreset;
    await prefs.setString('resolutionPreset', resolutionPreset.name);
    notifyListeners();
  }

  FlashMode _flashMode = FlashMode.auto;
  FlashMode get flashMode => _flashMode;

  void setFlashMode(FlashMode flashMode) async {
    _flashMode = flashMode;
    await prefs.setString('flashMode', flashMode.name);
    notifyListeners();
  }

  bool _showInfoOnCamera = true;
  bool get showInfoOnCamera => _showInfoOnCamera;

  void setShowInfoOnCamera(bool value) async {
    _showInfoOnCamera = value;
    await prefs.setBool('showInfoOnCamera', value);
    notifyListeners();
  }

  bool _showHeading = true;
  bool get showHeading => _showHeading;

  void setShowHeading(bool value) async {
    _showHeading = value;
    await prefs.setBool('showHeading', value);
    notifyListeners();
  }

  bool _showPosition = true;
  bool get showPosition => _showPosition;

  void setShowPosition(bool value) async {
    _showPosition = value;
    await prefs.setBool('showPosition', value);
    notifyListeners();
  }

  bool _showAltitude = true;
  bool get showAltitude => _showAltitude;

  void setShowAltitude(bool value) async {
    _showAltitude = value;
    await prefs.setBool('showAltitude', value);
    notifyListeners();
  }

  bool _useMetricForAlt = true;
  bool get useMetricForAlt => _useMetricForAlt;

  void setUseMetricForAlt(bool value) async {
    _useMetricForAlt = value;
    await prefs.setBool('useMetricForAlt', value);
    notifyListeners();
  }
}