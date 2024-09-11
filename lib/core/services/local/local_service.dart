import 'package:hive/hive.dart';

class LocalService {
  final String _boxName = 'apiData';
  late final Box _apiDataBox;

  Future<void> initialize() async {
    Hive.init("ecommerce_demo");
    _apiDataBox = await Hive.openBox(_boxName);
  }

  Future<void> storeData(String key, dynamic data) async {
    await _apiDataBox.put(key, data);
  }

  dynamic getData(String key) {
    return _apiDataBox.get(key);
  }

  Future<void> clearAllData() async {
    await _apiDataBox.clear();
  }
}
