import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_blog/services/repository.dart';
import './bloc.dart';

class BlogDetailsBloc extends Bloc<BlogDetailsEvent, BlogDetailsState> {
  final Repository repository;

  BlogDetailsBloc({this.repository});
  @override
  BlogDetailsState get initialState => InitialBlogDetailsState();

  @override
  Stream<BlogDetailsState> mapEventToState(
    BlogDetailsEvent event,
  ) async* {
    if(event is SelectBlogEvent){
      yield BlogDetailsFetchingState();
      try{
        final blogDetails = await repository.fetchBlogDetails(event.id);
        yield BlogDetailsFetchedState(blogDetails: blogDetails);
      }
      catch(_){
        yield BlogDetailsErrorState();
      }
    }
  }
}
