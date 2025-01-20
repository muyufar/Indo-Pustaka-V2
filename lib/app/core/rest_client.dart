import 'package:indopustaka/app/data/models/menu_multi/menu_multi_resp.dart';
import 'package:indopustaka/app/data/string_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: StringConstant.webUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/admin/pustaka/api/menu_multimedia")
  Future<MenuMultiResponse> getMulMedMenu();
}
