

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Securestorage {
  final Storage = new FlutterSecureStorage();
  Future<void> save(String key, String value) async {
    await Storage.write(key: key, value: value);
  }

  Future<String> read(String key) async {
    return await Storage.read(key: key)??"";
  }

   Future<void> delete(String key) async {
    await Storage.delete(key: key);
  }

  
}
