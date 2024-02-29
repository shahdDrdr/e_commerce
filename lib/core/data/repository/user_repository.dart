import 'package:dartz/dartz.dart';
import 'package:e_commerc/core/data/models/common_response.dart';
import 'package:e_commerc/core/data/models/user_info.dart';
import 'package:e_commerc/core/enums/request_type.dart';
import 'package:e_commerc/core/utils/network_util.dart';

class UserRepository {
  Future<Either<String, List<UserInfo>>> getAllUser() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'users',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);
        if (commonResponse.getStatus) {
          List<UserInfo> listinfouser = [];
          commonResponse.data!.forEach((element) {
            listinfouser.add(UserInfo.fromJson(element));
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
}
