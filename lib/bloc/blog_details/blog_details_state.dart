import 'package:equatable/equatable.dart';
import 'package:flutter_blog/model/api_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlogDetailsState extends Equatable {
  BlogDetailsState([List props = const <dynamic>[]]) : super(props);
}

class InitialBlogDetailsState extends BlogDetailsState {}

class BlogDetailsFetchingState extends BlogDetailsState {}

class BlogDetailsFetchedState extends BlogDetailsState {
  final Blogs blogDetails;
  BlogDetailsFetchedState({this.blogDetails}):super([blogDetails]);

}

class BlogDetailsErrorState extends BlogDetailsState {}



