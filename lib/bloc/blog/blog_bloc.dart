import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_blog/services/repository.dart';
import './bloc.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final Repository repository;
  BlogBloc({this.repository});
  
  @override
  BlogState get initialState => InitialBlogState();

  @override
  Stream<BlogState> mapEventToState(
    BlogEvent event,
  ) async* {
    if(event is SelectCategoryEvent){
      yield BlogFetchingState();

      try{
       final blogs = await repository.fetchBlogs(event.slug);
       if(blogs.length == 0){
         yield BlogEmptyState();
       }
       else{
         yield BlogFetchedState(blogs: blogs);
       }
       
      }
      catch(_){
        yield BlogErrorState();
      }

    }
  }
}
