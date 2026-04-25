import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/networking/api_end_points.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/features/home_screen/models/categories_model.dart';
import 'package:ecommerce_app/features/home_screen/models/products_model.dart';

class HomeRepo {
  final DioHelper _dioHelper;
  HomeRepo(this._dioHelper);
  Future<Either<String, List<ProductsModel>>> getProduct() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndPoints.products,
      );
      if (response.statusCode == 200) {
        List<ProductsModel> products = productsModelFromJson(response.data);

        return Right(products);
      } else {
        return Left("SomeThing Went Wring");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<ProductsModel>>> getProductCategories(
    String categoriesName,
  ) async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint:
            "${ApiEndPoints.products}/${ApiEndPoints.catProducts}/$categoriesName",
      );
      if (response.statusCode == 200) {
        List<ProductsModel> products = productsModelFromJson(response.data);
        return Right(products);
      } else {
        return Left("SomeThing Went Wring");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<String>>> getCategories() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndPoints.categories,
      );
      if (response.statusCode == 200) {
        List<String> categories = categoriesModelFromJson(response.data);
        categories.insert(0, "All");
        return Right(categories);
      } else {
        return Left("SomeThing Went Wring");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
