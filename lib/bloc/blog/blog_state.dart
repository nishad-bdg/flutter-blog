import 'package:equatable/equatable.dart';
import 'package:flutter_blog/model/api_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlogState extends Equatable {
  BlogState([List props = const <dynamic>[]]) : super(props);
}

class InitialBlogState extends BlogState {}

class BlogFetchingState extends BlogState {}

class BlogFetchedState extends BlogState {
  final List<Blogs> blogs;
  BlogFetchedState({this.blogs}):super([blogs]);
}

class BlogErrorState extends BlogState {}

class BlogEmptyState extends BlogState {}

