import 'package:furnish_ar/models/catalog.dart';
import 'package:furnish_ar/store/store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModels _catalog;
  final List<int> _itemIds = [];

  CatalogModels get catalog => _catalog;
  set catalog(CatalogModels newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  Iterable get items => _itemIds.map((id) => _catalog.getById(id).toList());

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
