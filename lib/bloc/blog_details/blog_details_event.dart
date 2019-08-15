import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlogDetailsEvent extends Equatable {
  BlogDetailsEvent([List props = const <dynamic>[]]) : super(props);
}

class SelectBlogEvent extends BlogDetailsEvent{
  final int id;
  SelectBlogEvent({this.id}):super([id]);
}
