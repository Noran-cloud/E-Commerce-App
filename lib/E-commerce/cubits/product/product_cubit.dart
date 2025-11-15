import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/api_service.dart';
import '../../models/product_model.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ApiService _apiService;

  ProductCubit(this._apiService) : super(ProductInitial());

  Future<void> loadProducts() async {
    try {
      emit(ProductLoading());
      final products = await _apiService.getProducts();
      emit(ProductLoaded(products: products, filteredProducts: products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  void searchProducts(String query) {
    final currentState = state;
    if (currentState is ProductLoaded) {
      if (query.isEmpty) {
        emit(
          currentState.copyWith(
            filteredProducts: currentState.products,
            searchQuery: '',
          ),
        );
      } else {
        final filtered = currentState.products.where((product) {
          return product.title.toLowerCase().contains(query.toLowerCase());
        }).toList();

        emit(
          currentState.copyWith(filteredProducts: filtered, searchQuery: query),
        );
      }
    }
  }

  Future<Product?> getProductById(int id) async {
    try {
      return await _apiService.getProductById(id);
    } catch (e) {
      return null;
    }
  }
}
