import 'package:flutter_crystalline/flutter_crystalline.dart';

// class ProfileStore extends Store<ProfileStore> {
class ProfileStore extends ChangeNotifierData {
  final Data<String> _username = Data();
  final Data<int> _age = Data();

  Data<String> get username => _username;
  Data<int> get age => _age;

  Future init() async {
    operation = Operation.fetch;
    error = null;
    notifyListeners();
    // -------------------------
    await Future.delayed(const Duration(seconds: 2));
    _username.value = 'easazade';
    _age.value = 27;
    operation = Operation.none;
    notifyListeners();
    // -------------------------
    await Future.delayed(const Duration(seconds: 1));
    error = DataError('oops!', Exception());
    notifyListeners();
  }

  @override
  bool get isAvailable => _age.isAvailable && _username.isAvailable;

  @override
  List<Data<Object?>> get items => [_username, _age];
}
