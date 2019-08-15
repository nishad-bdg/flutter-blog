import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlogDetailsState extends Equatable {
  BlogDetailsState([List props = const <dynamic>[]]) : super(props);
}

class InitialBlogDetailsState extends BlogDetailsState {}

class BlogDetailsFetchingState extends BlogDetailsState {}

class BlogDetailsFetchedState extends BlogDetailsState {}

class BlogDetailsErrorState extends BlogDetailsState {}


