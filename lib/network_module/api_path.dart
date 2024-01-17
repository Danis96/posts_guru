/// ApiPath
///
/// helper class in which we define paths that
/// we concatenate to our base url
enum ApiPath {
  posts,
  posts_comments,
  users,
}

mixin ApiPathHelper {
  static String getValue(ApiPath path, {String concatValue = ''}) {
    switch (path) {
      case ApiPath.posts:
        return '/posts';
      case ApiPath.posts_comments:
        return '/posts/$concatValue/comments';
        case ApiPath.users:
        return '/users';
      default:
        return '';
    }
  }
}
