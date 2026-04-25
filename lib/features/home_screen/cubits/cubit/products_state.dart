part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsLoaded extends ProductsState {
  final List<ProductsModel> products;

  ProductsLoaded(this.products);
}

final class ProductsFaluire extends ProductsState {
  final String error;

  ProductsFaluire(this.error);
}
