import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlogCategoryEvent extends Equatable {
  BlogCategoryEvent([List props = const <dynamic>[]]) : super(props);
}

class AppStartEvent extends BlogCategoryEvent {

  @override
  String toString() => 'AppStartEvent';
}


