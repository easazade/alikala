import 'package:application/utils/utils_functions.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';
import 'package:shop_client/shop_client.dart';

class CategoryStore extends Store {
  CategoryStore({required this.client}) {
    init();
  }

  final Client client;

  final categories = ListData<Category>([]);

  Future init() async {
    operation = Operation.fetch;
    failure = null;
    notifyListeners();

    final result = await client.categories.getCategories().sealed();

    if (result.isSuccessful) {
      final bannerAds = result.value;
      categories.addAll(bannerAds.mapToData);
    } else {
      failure = Failure('Could not fetch categories', exception: result.exception, cause: Operation.fetch);
    }

    operation = Operation.none;
    notifyListeners();
  }

  @override
  List<Data<Object?>> get items => [categories];
}
