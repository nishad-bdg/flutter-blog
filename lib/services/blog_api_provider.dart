import 'dart:async';
import 'package:flutter_blog/model/api_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BlogApiProvider {
  final String baseUrl = 'http://192.168.0.102:8000/api/v1';

  Future<List<Results>> fetchBlogCategories() async {
    final response = await http.get(baseUrl+'/blog/category/');
    // print("Response : ${response.body.toString()}");
    return parseResponse(response);
  }

  List<Results> parseResponse(http.Response response) {
    final parse = json.decode(response.body);
    if (response.statusCode == 200) {
      return BlogCategory.fromJson(parse).results;
    } else {
      throw Exception("Failed to load data");
    }
  }


  Future<List<Blogs>> fetchBlogs(String slug) async {
    print(baseUrl+'/blog/category/'+slug+'/');
    final response = await http.get(baseUrl+'/blog/category/'+slug+'/');
    //print(response.body.toString());
    final parse = json.decode(response.body);
    if(response.statusCode == 200){
      print(Results.fromJson(parse).blogs);
      return Results.fromJson(parse).blogs;
    }
    else{
      throw Exception("Failed to load data");
    }
  }


  Future<Blogs>fetchBlogDetails(int id) async {
    print(baseUrl+'/blog/'+id.toString()+'/');
    final response = await http.get(baseUrl+'/blog/'+id.toString()+'/');
    print(response.body.toString());
    final parse = json.decode(response.body);
    if(response.statusCode == 200){
      return Blogs.fromJson(parse);
    }else{
      throw Exception("Error loading data");
    }
  }

}
