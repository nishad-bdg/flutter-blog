import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_blog/services/repository.dart';
import './bloc.dart';

class BlogCategoryBloc extends Bloc<BlogCategoryEvent, BlogCategoryState> {
  
  final Repository repository;
  BlogCategoryBloc({this.repository});

  @override
  BlogCategoryState get initialState => InitialBlogCategoryState();

  @override
  Stream<BlogCategoryState> mapEventToState(
    BlogCategoryEvent event,
  ) async* {
    if(event is AppStartEvent){
      yield BlogCategoryFetchingState();

      try{
        final categories = await repository.fetchBlogCategories();
        yield BlogCategoryFetchedState(categories: categories);
      }catch(_){
        yield BlogCategoryErrorState();
      }

    }
  }
}
