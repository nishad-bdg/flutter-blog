import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class BlogDetailsBloc extends Bloc<BlogDetailsEvent, BlogDetailsState> {
  @override
  BlogDetailsState get initialState => InitialBlogDetailsState();

  @override
  Stream<BlogDetailsState> mapEventToState(
    BlogDetailsEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
