import 'package:permission_handler/permission_handler.dart';

Future<bool> checkPermission() async {
  if (!await Permission.microphone.isGranted) {
    PermissionStatus status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      return false;
    }
  }
  if (!await Permission.storage.isGranted) {
    PermissionStatus status = await Permission.storage.request();
    if (status != PermissionStatus.granted) {
      return false;
    }
  }
  return true;
}
