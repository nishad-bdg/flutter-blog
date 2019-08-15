import 'package:flutter_blog/model/api_model.dart';
import 'package:flutter_blog/services/blog_api_provider.dart';

class Repository {
  final blogAPiProvider = BlogApiProvider();
  Future<List<Results>> fetchBlogCategories() =>
      blogAPiProvider.fetchBlogCategories();

  Future<List<Blogs>> fetchBlogs(String slug) =>
    blogAPiProvider.fetchBlogs(slug);
}
