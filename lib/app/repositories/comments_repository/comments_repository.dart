import 'package:js_guru/app/models/comments_model.dart';
import '../../../network_module/api_path.dart';
import '../../../network_module/http_client.dart';

class CommentsRepository {
  Future<List<CommentsModel>> getPostComments(int postID) async {
    List<CommentsModel> _comments;
    final dynamic response =
        await HTTPClient.instance.fetchData(ApiPathHelper.getValue(ApiPath.posts_comments, concatValue: postID.toString()));
    final List<dynamic> responseJson = response as List<dynamic>;
    _comments = responseJson.map((dynamic value) => CommentsModel.fromJson(value)).toList();
    return _comments;
  }
}
