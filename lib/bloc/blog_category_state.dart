import 'package:equatable/equatable.dart';
import 'package:flutter_blog/model/api_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlogCategoryState extends Equatable {
  BlogCategoryState([List props = const <dynamic>[]]) : super(props);
}

class InitialBlogCategoryState extends BlogCategoryState {}

class BlogCategoryFetchingState extends BlogCategoryState {}

class BlogCategoryFetchedState extends BlogCategoryState {
  final List<Results> categories;
  BlogCategoryFetchedState({this.categories}):super([categories]);
}



class BlogCategoryEmptyState extends BlogCategoryState {}

class BlogCategoryErrorState extends BlogCategoryState {}
