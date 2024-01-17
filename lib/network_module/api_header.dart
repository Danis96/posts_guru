import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// ApiHeader
///
/// helper class where we define different types of headers
/// that we will send in our requests
enum ApiHeader {
  appJson,
  auth,
  register_email,
  authAppJson,
  appAndDeviceInfo,
}

mixin ApiHeaderHelper {
  static Future<Map<String, String>> getValue(ApiHeader path) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final String version = packageInfo.version;
    String deviceBrand = '';
    String deviceManufacturer = '';
    String deviceModel = '';
    String deviceOS = '';
    String deviceOSVersion = '';
    try {
      final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceBrand = androidInfo.brand;
        deviceManufacturer = androidInfo.manufacturer;
        deviceModel = androidInfo.model;
        deviceOS = 'Android';
        deviceOSVersion = '${androidInfo.version.sdkInt}';
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceBrand = 'Apple';
        deviceManufacturer = '';
        deviceModel = iosInfo.model;
        deviceOS = 'iOS';
        deviceOSVersion = iosInfo.systemVersion;
      }
    } on PlatformException {
      print('Failed to get platform info');
    }

    switch (path) {
      case ApiHeader.appJson:
        return <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        };
      case ApiHeader.auth:
        return <String, String>{
          HttpHeaders.authorizationHeader: 'Token ---',
          'X-AppInfo-Implementation': 'Native',
          'X-AppInfo-Version': version,
          'X-DeviceInfo-Brand': deviceBrand,
          'X-DeviceInfo-Manufacturer': deviceManufacturer,
          'X-DeviceInfo-Model': deviceModel,
          'X-DeviceInfo-OS': deviceOS,
          'X-DeviceInfo-OS-Version': deviceOSVersion,
          'Content-Type': 'application/json; charset=utf-8'
        };
      case ApiHeader.register_email:
        return <String, String>{HttpHeaders.contentTypeHeader: 'multipart/form-data; charset=utf-8'};
      case ApiHeader.authAppJson:
        return <String, String>{
          HttpHeaders.authorizationHeader: 'Token ----',
          'X-AppInfo-Implementation': 'Native',
          'X-AppInfo-Version': version,
          'X-DeviceInfo-Brand': deviceBrand,
          'X-DeviceInfo-Manufacturer': deviceManufacturer,
          'X-DeviceInfo-Model': deviceModel,
          'X-DeviceInfo-OS': deviceOS,
          'X-DeviceInfo-OS-Version': deviceOSVersion,
          'Accept-Language': 'languageCode',
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        };
      case ApiHeader.appAndDeviceInfo:
        return <String, String>{
          'X-AppInfo-Implementation': 'Native',
          'X-AppInfo-Version': version,
          'X-DeviceInfo-Brand': deviceBrand,
          'X-DeviceInfo-Manufacturer': deviceManufacturer,
          'X-DeviceInfo-Model': deviceModel,
          'X-DeviceInfo-OS': deviceOS,
          'X-DeviceInfo-OS-Version': deviceOSVersion,
          'Accept-Language': 'languageCode',
          'accept': 'application/json; charset=utf-8',
        };
      default:
        return <String, String>{'': ''};
    }
  }
}
