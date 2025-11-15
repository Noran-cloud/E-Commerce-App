import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/cart_item_model.dart';
import '../../models/product_model.dart';
import '../../services/storage_service.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final StorageService _storageService;

  CartCubit(this._storageService) : super(const CartState());

  Future<void> loadCart() async {
    try {
      emit(state.copyWith(isLoading: true));
      final items = await _storageService.loadCart();
      emit(state.copyWith(items: items, isLoading: false));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load cart',
      ));
    }
  }

  Future<void> addToCart(Product product) async {
    try {
      final currentItems = List<CartItem>.from(state.items);
      final existingIndex = currentItems.indexWhere(
        (item) => item.product.id == product.id,
      );

      if (existingIndex >= 0) {
        currentItems[existingIndex] = currentItems[existingIndex].copyWith(
          quantity: currentItems[existingIndex].quantity + 1,
        );
      } else {
        currentItems.add(CartItem(product: product, quantity: 1));
      }

      await _storageService.saveCart(currentItems);
      emit(state.copyWith(items: currentItems));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to add to cart'));
    }
  }

  Future<void> incrementQuantity(int productId) async {
    try {
      final currentItems = List<CartItem>.from(state.items);
      final index = currentItems.indexWhere(
        (item) => item.product.id == productId,
      );

      if (index >= 0) {
        currentItems[index] = currentItems[index].copyWith(
          quantity: currentItems[index].quantity + 1,
        );
        await _storageService.saveCart(currentItems);
        emit(state.copyWith(items: currentItems));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to update quantity'));
    }
  }

  Future<void> decrementQuantity(int productId) async {
    try {
      final currentItems = List<CartItem>.from(state.items);
      final index = currentItems.indexWhere(
        (item) => item.product.id == productId,
      );

      if (index >= 0) {
        if (currentItems[index].quantity > 1) {
          currentItems[index] = currentItems[index].copyWith(
            quantity: currentItems[index].quantity - 1,
          );
        } else {
          currentItems.removeAt(index);
        }
        await _storageService.saveCart(currentItems);
        emit(state.copyWith(items: currentItems));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to update quantity'));
    }
  }

  Future<void> removeFromCart(int productId) async {
    try {
      final currentItems = List<CartItem>.from(state.items);
      currentItems.removeWhere((item) => item.product.id == productId);
      await _storageService.saveCart(currentItems);
      emit(state.copyWith(items: currentItems));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to remove item'));
    }
  }

  Future<void> clearCart() async {
    try {
      await _storageService.clearCart();
      emit(state.copyWith(items: []));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to clear cart'));
    }
  }
}