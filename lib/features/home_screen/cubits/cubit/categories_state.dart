part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  final List<String> categories;

  CategoriesLoaded(this.categories);
}

final class CategoriesFaluire extends CategoriesState {
  final String error;

  CategoriesFaluire(this.error);
}
