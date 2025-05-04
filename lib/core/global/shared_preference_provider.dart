import 'package:shared_preferences/shared_preferences.dart';

// part 'shared_preference_provider.g.dart';

class SingletonSharedPreferences {
  SingletonSharedPreferences._();
  static late SharedPreferences instance;
  static Future init() async {
    instance = await SharedPreferences.getInstance();
  }
}

// class SharedPreference {
//   final SharedPreferences _instance;
//   SharedPreference({required SharedPreferences instance})
//       : _instance = instance;
//   SharedPreferences getInstance() => _instance;
//   Future<bool> clear() async {
//     return await _instance.clear();
//   }

//   bool get isLoggedIn {
//     return _instance.getBool(isLoggedInKey) ?? false;
//   }

//   String? get name => _instance.getString(nameKey);
// }

// @riverpod
// SharedPreference sharedPreference(Ref ref) {
//   final instance = SingletonSharedPreferences.instance;
//   return SharedPreference(instance: instance);
// }
