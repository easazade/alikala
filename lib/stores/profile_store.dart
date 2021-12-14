import 'package:alikala/arcitecture/data.dart';

class ProfileStore extends Store<ProfileStore> {
  final Data<String> username = Data();
  final Data<int> age = Data();

  Future init() async {
    setStoreOperation(Operation.fetch);
    updateStore();
    await Future.delayed(const Duration(seconds: 2));
    username.setValue('easazade');
    age.setValue(27);
    setStoreOperation(Operation.none);
    updateStore();
  }

  @override
  bool get isAvailable => age.isAvailable && username.isAvailable;

  @override
  List<Object?> get props => [username, age];
}
