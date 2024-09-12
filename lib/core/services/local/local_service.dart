import 'package:hive_flutter/hive_flutter.dart';

class LocalService {
  final String _boxName = 'apiData';
   Box? _apiDataBox;
  

  Future<void> storeData(String key, dynamic data) async {
    _apiDataBox ??= await Hive.openBox(_boxName);
    await _apiDataBox!.put(key, data);
  }

  dynamic getData(String key) async{
    _apiDataBox ??= await Hive.openBox(_boxName);
    return _apiDataBox?.get(key);
  }

  Future<void> clearAllData() async {
    _apiDataBox ??= await Hive.openBox(_boxName);
    await _apiDataBox?.clear();
  }
}
