import 'package:alikala/arcitecture/data.dart';

class ProfileStore extends Store<ProfileStore> {
  final Data<String> _username = Data();
  final Data<int> _age = Data();

  ReadOnlyData<String> get username => _username;
  ReadOnlyData<int> get age => _age;

  Future init() async {
    setStoreOperation(Operation.fetch);
    setStoreError(null);
    updateStoreeeeeeeeeeeeeeeeeeeeeeeee();
    await Future.delayed(const Duration(seconds: 2));
    _username.setValue('easazade');
    _age.setValue(27);
    setStoreOperation(Operation.none);
    updateStoreeeeeeeeeeeeeeeeeeeeeeeee();
    await Future.delayed(const Duration(seconds: 1));
    setStoreError(DataError('oops!', Exception()));
    updateStoreeeeeeeeeeeeeeeeeeeeeeeee();
  }

  @override
  bool get isAvailable => _age.isAvailable && _username.isAvailable;

  @override
  List<Object?> get props => [_username, _age];
}
