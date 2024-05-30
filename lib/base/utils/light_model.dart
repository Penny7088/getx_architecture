import 'dart:convert';

import 'package:getx_architecture/base/utils/extensions/list_extensions.dart';
import 'package:mmkv/mmkv.dart';


final lightKV = _LightModel();

class _LightModel {
  MMKV? mmkv;
  Future config() async{
    await init();
  }
  init() async {
    final rootDir = await MMKV.initialize();
    mmkv ??= MMKV.defaultMMKV();
  }

  void remove(String key) async {
    await init();
    return mmkv?.removeValue(key);
  }

  Future<String?> getString({required String key}) async {
    await init();
    var newKey = key;
    return mmkv?.decodeString(newKey);
  }

  Future<bool?> setString(String key, String? value,
      [bool genNewKey = true]) async {
    await init();
    if (key.isEmpty) return false;
    var newKey = key;
    return mmkv?.encodeString(newKey, value);
  }

  Future<int?> getInt(String? key) async {
    await init();
    if (key?.isEmpty == true) return null;
    var newKey = key!;
    return mmkv?.decodeInt(newKey);
  }

  Future<bool?> setInt(String key, int value) async {
    await init();
    if (key.isEmpty) return false;
    var newKey = key;
    return mmkv?.encodeInt(newKey, value);
  }

  Future<bool?> getBool(String? key) async {
    await init();
    if (key?.isEmpty == true) return null;
    var newKey = key!;
    return mmkv?.decodeBool(newKey);
  }

  Future<bool?> setBool(String key, bool value) async {
    await init();
    if (key.isEmpty) return false;
    var newKey = key;
    return mmkv?.encodeBool(newKey, value);
  }

  Future<List<String>?> getStringList(String key,
      [bool genNewKey = true]) async {
    await init();
    if (key.isEmpty) return null;
    var newKey = key;
    var jsonS = mmkv?.decodeString(newKey);
    if (jsonS?.isNotEmpty == true) {
      return json.decode(jsonS!)?.cast<String>();

    } else {
      return <String>[];
    }
  }

  ///
  Future<bool?> setStringList(String key, List<String> list,
      [bool genNewKey = true]) async {
    await init();
    if (key.isEmpty) return false;
    var newKey = key;
    if (list.isEmpty) {
      return mmkv?.encodeString(newKey, null);
    } else {
      var jsonS = json.encode(list);
      return mmkv?.encodeString(newKey, jsonS);
    }
  }



   Future<bool> putModels<M>({required M model, required String key}) async {
    List<String>? cache = await lightKV.getStringList(key);
    if(model == null){
      return false;
    }
    cache ??= <String>[];
    String m = json.encode(model);
    cache.add(m);
    return await lightKV.setStringList(key,  cache.removeDuplicates()) ?? false;
  }


  Future<List<String>?> getModels({required String key}) async {
    List<String>? cache = await lightKV.getStringList(key);
    if(cache == null || cache.isEmpty == true ){
      return null;
    }
    return cache;
  }
}
