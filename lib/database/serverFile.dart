import 'package:dio/dio.dart';
import 'package:dummy_api_two_practice/userData/userDetails.dart';

class Apicalling {
  static String _user = "https://jsonplaceholder.typicode.com/users";
  static String _posts = "https://jsonplaceholder.typicode.com/posts";
  static String _todos = "https://jsonplaceholder.typicode.com/todos";
  static String _comments = "https://jsonplaceholder.typicode.com/comments";
  static String _albums = "https://jsonplaceholder.typicode.com/albums";
  static String _photos = "https://jsonplaceholder.typicode.com/photos";

  Dio _dio = Dio();

  Future<List<AllUsers>?> allUserData() async {
    try {
      Response response = await _dio.get(_user);
      List<AllUsers> userList = [];

      for (var data in response.data) {
        userList.add(AllUsers.fromJson(data));
      }
      return userList;
    } on DioError catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<UserPost>?> userPost(userId) async {
    try {
      Response response = await _dio.get("$_posts?userId=$userId");
      List<UserPost> postList = [];

      for (var data in response.data) {
        postList.add(UserPost.fromJson(data));
      }
      return postList;
    } on DioError catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<UserAlbum>?> userAlbum(id) async {
    try {
      Response response = await _dio.get("$_albums?userId=$id");
      List<UserAlbum> userAlbumList = [];

      for (var data in response.data) {
        userAlbumList.add(UserAlbum.fromJson(data));
      }
      return userAlbumList;
    } on DioError catch (e) {
      print(e);
    }

    return null;
  }

  Future<List<UserTodos>?> userTodos(id) async {
    try {
      Response response = await _dio.get("$_todos?userId=$id");
      List<UserTodos> userTodosList = [];

      for (var data in response.data) {
        userTodosList.add(UserTodos.fromJson(data));
      }
      return userTodosList;
    } on DioError catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<UserComments>?> userComments(id) async {
    try {
      Response response = await _dio.get("$_comments?postId=$id");
      List<UserComments> userCommentsList = [];

      for (var data in response.data) {
        userCommentsList.add(UserComments.fromJson(data));
      }
      return userCommentsList;
    } on DioError catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<UserImages>?> userImages(id) async {
    try {
      Response response = await _dio.get("$_photos?albumId=$id");
      List<UserImages> userImagesList = [];

      for (var item in response.data) {
        userImagesList.add(UserImages.fromJson(item));
      }
      return userImagesList;
    } on DioError catch (e) {
      print(e);
    }
    return null;
  }

  Future<UserImages?> imageUserView(id) async {
    try {
      Response response = await _dio.get("$_photos/$id");

      UserImages userImagesview = UserImages.fromJson(response.data);
      return userImagesview;
    } on DioError catch (e) {
      print(e);
    }
    return null;
  }
}
