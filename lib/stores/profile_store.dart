import 'package:flutter_crystalline/flutter_crystalline.dart';

// class ProfileStore extends Store<ProfileStore> {
class ProfileStore extends ChangeNotifierData {
  final Data<String> username = Data();
  final Data<int> age = Data();

  Future init() async {
    operation = Operation.fetch;
    error = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    username.value = 'easazade';
    age.value = 27;
    operation = Operation.none;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    error = DataError('oops!', Exception());
    notifyListeners();
  }

  @override
  bool get isAvailable => age.isAvailable && username.isAvailable;

  @override
  List<Data<Object?>> get items => [username, age];

  @override
  List<Data<Object?>> get requiredItems => [username, age];
}
