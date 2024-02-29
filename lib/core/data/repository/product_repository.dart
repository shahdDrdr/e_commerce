import 'package:dartz/dartz.dart';
import 'package:e_commerc/core/data/models/common_response.dart';
import 'package:e_commerc/core/data/models/product_info.dart';
import 'package:e_commerc/core/enums/request_type.dart';
import 'package:e_commerc/core/utils/network_util.dart';
class ProductRepository {
  Future<Either<String, List<ProductModel>>> getAllProduct() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'products',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);
        if (commonResponse.getStatus) {
          List<ProductModel> listinfouser = [];
          commonResponse.data!.forEach((element) {
            listinfouser.add(ProductModel.fromJson(element));
          });
          return Right(listinfouser);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
   Future<Either<String, List<ProductModel>>> getProductByCategory(
      String category) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'products/category/$category',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<ProductModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(ProductModel.fromJson(element));
            },
          );
          return Right(result);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
   Future<Either<String, List<String>>> getAllCategory() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'Products/categories',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);
        if (commonResponse.getStatus) {
          List<String> result = [];
          commonResponse.data!.forEach((element) {
           result.add(element.toString());
          });
          return Right(result);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
  

}
