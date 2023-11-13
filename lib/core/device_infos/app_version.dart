import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@lazySingleton
class AppVersion {
  AppVersion({
    required this.packageInfo,
  });

  final PackageInfo packageInfo;

  String call() {
    return packageInfo.version;
  }
}
