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

  Future<Post> getByID(int id) async {
    var jsonObject = await ApiHelper().getRequest("posts/$id");

    return Post.fromJson(jsonObject);
  }

  Future<List<Comment>> getCommentByID(int id) async {
    var jsonObject = await ApiHelper().getRequest("posts/$id/comments");
    List<Comment> result = [];
    jsonObject.forEach((json) {
      result.add(Comment.fromJson(json));
    });
    return result;
  }

  Future<Post> create(Post post) async {
    dynamic jsonObject = await ApiHelper().postRequest("posts", post.toJson());
    return Post.fromJson(jsonObject);
  }

  Future<Post> put(Post post, int id) async {
    dynamic jsonObject =
        await ApiHelper().putRequest("posts/$id", post.toJson());
    return Post.fromJson(jsonObject);
  }

  Future<Post> delete(int id) async {
    dynamic jsonObject = await ApiHelper().deleteRequest("posts/$id");
    return Post.fromJson(jsonObject);
  }
}
