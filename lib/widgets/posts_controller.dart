import 'package:flutter_wordpress_api_get_post/services/Api_service.dart';
import 'package:flutter_wordpress_api_get_post/widgets/user_model.dart';
import 'package:get/get.dart';

class PostController extends GetxController {

  var postsList = List<Posts>.empty(growable: true).obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    var posts = await ApiService().fetchPosts(Get.arguments);
    try {
      isLoading(true);
      if (posts.length > 0) {
        postsList.clear();
        postsList.addAll(posts);
      }
    } finally {
      isLoading(false);
    }
  }

}