import 'package:project/controllers/api_helper.dart';
import 'package:project/models/post.dart';

class PostController {
  Future<List<Post>> getAll() async {
    dynamic jsonObject = await ApiHelper().getRequest("posts");
    List<Post> result = [];
    jsonObject.forEach((json) {
      result.add(Post.fromJson(json));
    });
    return result;
  }
}
