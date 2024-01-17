import 'package:js_guru/app/models/post_model.dart';

import '../../../network_module/api_path.dart';
import '../../../network_module/http_client.dart';

class PostsRepository {
  Future<List<Post>> getPosts() async {
    List<Post> _posts;
    final dynamic response = await HTTPClient.instance.fetchData(ApiPathHelper.getValue(ApiPath.posts));
    final List<dynamic> responseJson = response as List<dynamic>;
    _posts = responseJson.map((dynamic value) => Post.fromJson(value)).toList();
    return _posts;
  }
}
