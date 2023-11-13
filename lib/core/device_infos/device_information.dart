import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeviceInformation {
  DeviceInformation({
    required this.deviceInfoPlugin,
  });

  final DeviceInfoPlugin deviceInfoPlugin;

  Future<String> getDeviceName() async {
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      return '${androidInfo.manufacturer}  ${androidInfo.model}';
    }

    final iosInfo = await deviceInfoPlugin.iosInfo;
    return '${iosInfo.utsname.machine} ${iosInfo.model}';
  }

  Future<String?> getDeviceId() async {
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      return androidInfo.device;
    }
    final iosInfo = await deviceInfoPlugin.iosInfo;
    return iosInfo.identifierForVendor;
  }
}
