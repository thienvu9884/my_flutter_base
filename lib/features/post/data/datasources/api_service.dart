import 'package:flutter_base/features/post/data/models/post_model.dart';
import 'package:injectable/injectable.dart';
import 'package:my_core/import.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@lazySingleton
@RestApi()
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio) = _ApiService;

  @GET("/posts")
  Future<List<PostModel>> getPosts();
}
