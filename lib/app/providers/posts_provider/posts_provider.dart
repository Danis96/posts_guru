import 'package:flutter/material.dart';
import 'package:js_guru/app/models/comments_model.dart';
import 'package:js_guru/app/repositories/comments_repository/comments_repository.dart';
import 'package:js_guru/app/repositories/posts_repository/posts_repository.dart';
import 'package:js_guru/app/repositories/user_repository/user_repository.dart';

import '../../models/post_model.dart';
import '../../models/user_model.dart';

class PostsProvider extends ChangeNotifier {
  PostsProvider() {
    _postsRepository = PostsRepository();
    _commentsRepository = CommentsRepository();
    _userRepository = UserRepository();
  }

  PostsRepository? _postsRepository;
  CommentsRepository? _commentsRepository;
  UserRepository? _userRepository;

  Post? _post;
  Post get post => _post ?? Post();
  set setPost(Post value) => _post = value;

  List<Post>? _posts = <Post>[];
  List<Post>? get posts => _posts;
  set setPosts(List<Post> value) => _posts = value;

  List<CommentsModel>? _comments = <CommentsModel>[];
  List<CommentsModel>? get comments => _comments;
  set setComments(List<CommentsModel> value) => _comments = value;

  List<User>? _users = <User>[];
  List<User>? get users => _users;
  set setUser(List<User> value) => _users = value;

  Future<String?> fetchPosts() async {
    try {
      _posts = await _postsRepository!.getPosts();
      findUser();
      notifyListeners();
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> fetchPostComments(int postID) async {
    _comments!.clear();
    try {
      _comments = await _commentsRepository!.getPostComments(postID);
      for (final Post _p in _posts!) {
        if (_p.id == postID) {
          _p.comments = _comments!;
        }
      }
      notifyListeners();
      return null;
    } catch (e) {
      return e.toString();
    }
  }


  Future<String?> fetchUsers() async {
    try {
      _users = await _userRepository!.getUsers();
      notifyListeners();
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  void findUser() {
    if(_posts!.isNotEmpty && _users!.isNotEmpty)
    for(final Post _p in _posts!) {
       for(final User _u in _users!) {
         if(_p.userID == _u.id) {
           _p.user = _u.name;
         }
       }
    }
    notifyListeners();
  }


  bool postsNotEmptyOrNull() => _posts != null && _posts!.isNotEmpty;
}
