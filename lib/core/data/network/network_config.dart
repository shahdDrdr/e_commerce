import 'package:e_commerc/core/data/repository/shared_prefrence_repository.dart';
import 'package:e_commerc/core/enums/request_type.dart';

class NetworkConfig {
  static Map<String, String> getHeaders(
      {bool? needAuth = false,
      required RequestType type,
      Map<String, String>? extraHeaders}) {
    return {
      if (needAuth!)
        "Authorization":
            "Bearer ${SharedPrefrenceRepository().getTokenInfo().token}",
      if (type != RequestType.GET) "Content-Type": "application/json",
      if (extraHeaders != null) ...extraHeaders,
    };
  }
}
