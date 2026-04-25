import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/home_screen/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._homeRepo) : super(CategoriesInitial());
  final HomeRepo _homeRepo;
  void fetchCategories() async {
    emit(CategoriesLoading());
    final Either<String, List<String>> res = await _homeRepo.getCategories();
    res.fold(
      (error) {
        emit(CategoriesFaluire(error));
      },
      (categories) {
        CategoriesLoaded(categories);
      },
    );
  }
}
