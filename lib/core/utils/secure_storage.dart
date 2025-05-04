import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );
  static _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  static const _iosOptions =
      IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  static Future<void> addItem(
      {required String key, required String value}) async {
    await _storage.write(
      key: key,
      value: value,
      aOptions: _getAndroidOptions(),
      iOptions: _iosOptions,
    );
  }

  static Future<String?> readItem({required String key}) async {
    return await _storage.read(
      key: key,
      aOptions: _getAndroidOptions(),
      iOptions: _iosOptions,
    );
  }

  static Future<void> deleteAll() async {
    await _storage.deleteAll(
      aOptions: _getAndroidOptions(),
      iOptions: _iosOptions,
    );
  }
}
