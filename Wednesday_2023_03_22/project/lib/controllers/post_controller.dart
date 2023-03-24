import 'package:project/controllers/api_helper.dart';
import 'package:project/models/comment.dart';
import 'package:project/models/post.dart';

class PostController {
  Future<List<Post>> getAll() async {
    var jsonObject = await ApiHelper().getRequest("posts");
    List<Post> result = [];
    jsonObject.forEach((json) {
      result.add(Post.fromJson(json));
    });
    return result;
  }

  Future<List<Post>> getByID(int id) async {
    var jsonObject = await ApiHelper().getRequest("posts/$id");
    List<Post> result = [];
    result.add(Post.fromJson(jsonObject));
    return result;
  }

  Future<List<Comment>> getCommentByID(int id) async {
    var jsonObject = await ApiHelper().getRequest("posts/$id/comments");
    List<Comment> result = [];
    jsonObject.forEach((json) {
      result.add(Comment.fromJson(json));
    });
    return result;
  }
}
