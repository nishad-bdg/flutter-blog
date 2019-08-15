import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlogEvent extends Equatable {
  BlogEvent([List props = const <dynamic>[]]) : super(props);
}

class SelectCategoryEvent extends BlogEvent {
  final String slug;
  SelectCategoryEvent({@required this.slug}) : super([slug]);
}
