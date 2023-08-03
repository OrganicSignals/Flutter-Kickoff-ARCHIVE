import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemytest/models/bag.dart';

class CartBagNotifier extends StateNotifier<List<Bag>> {
  CartBagNotifier() : super([]);

  void toggleBagCartStatus(Bag bag) {
    final bagInCart = state.contains(bag);
    if (bagInCart) {
      state = state.where((b) => b.id != bag.id).toList();
    } else {
      state = [...state, bag];
    }
  }

  CartCounter() {
    // TODO: implement CartCounter
    CartCounter();
  }
}

final cartBagProvider =
    StateNotifierProvider<CartBagNotifier, List<Bag>>((ref) {
  return CartBagNotifier();
});
