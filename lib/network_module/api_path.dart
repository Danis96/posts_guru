/// ApiPath
///
/// helper class in which we define paths that
/// we concatenate to our base url
enum ApiPath {
  posts,
  posts_comments,
  users,
  images,
}

mixin ApiPathHelper {
  static String getValue(ApiPath path, {String concatValue = '', String concatValue2 = ''}) {
    switch (path) {
      case ApiPath.posts:
        return '/posts';
      case ApiPath.posts_comments:
        return '/posts/$concatValue/comments';
      case ApiPath.users:
        return '/users';
      case ApiPath.images:
        return '/photos?_start=$concatValue&_limit=$concatValue2';
      default:
        return '';
    }
  }
}
