import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/home_screen/models/products_model.dart';
import 'package:ecommerce_app/features/home_screen/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._homeRepo) : super(ProductsInitial());
  final HomeRepo _homeRepo;
    void fetchProducts() async {
    emit(ProductsLoading());
    final  res = await _homeRepo.getProduct();
    res.fold(
      (error) {
        emit(ProductsFaluire(error));
      },
      (right) {
        ProductsLoaded(right);
      },
    );
  }
     void fetchCategoriesProducts(String catName) async {
    emit(ProductsLoading());
    final  res = await _homeRepo.getProductCategories(catName);
    res.fold(
      (error) {
        emit(ProductsFaluire(error));
      },
      (right) {
        ProductsLoaded(right);
      },
    );
  }
}
