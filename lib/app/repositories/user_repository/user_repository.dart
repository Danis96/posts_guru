import 'package:js_guru/app/models/user_model.dart';

import '../../../network_module/api_path.dart';
import '../../../network_module/http_client.dart';

class UserRepository {
  Future<List<User>> getUsers() async {
    List<User> _users;
    final dynamic response = await HTTPClient.instance.fetchData(ApiPathHelper.getValue(ApiPath.posts));
    final List<dynamic> responseJson = response as List<dynamic>;
    _users = responseJson.map((dynamic value) => User.fromJson(value)).toList();
    return _users;
  }
}
