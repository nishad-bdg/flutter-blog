import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/bloc/blog_category_bloc.dart';
import 'package:flutter_blog/bloc/blog_category_event.dart';
import 'package:flutter_blog/bloc/blog_category_state.dart';
import 'package:flutter_blog/model/api_model.dart';
import 'package:flutter_blog/pages/blog_page.dart';
import 'package:flutter_blog/services/repository.dart';
import 'package:flutter_blog/utils/BlogData.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<BlogCategoryBloc>(context),
      builder: (context, state) {
        if (state is InitialBlogCategoryState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BlogCategoryErrorState) {
          return Center(
            child: Text("Error loading Categories"),
          );
        } else if (state is BlogCategoryEmptyState) {
          return Center(
            child: Text("Empty category"),
          );
        } else if (state is BlogCategoryFetchingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final stateAsBlogCatgoryFetchedState =
              state as BlogCategoryFetchedState;
          final categories = stateAsBlogCatgoryFetchedState.categories;
          return buildCategoryList(categories);
        }
      },
    );
  }

  

  Widget buildCategoryList(List<Results> categories) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onLongPress: () {
              print("Long press");
              BlocProvider.of<BlogCategoryBloc>(context)
                  .dispatch(AppStartEvent());
            },
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlogPage(
                    repository:Repository(),
                    slug: categories[index].slug,
                    appBarTitle: categories[index].categoryName,
                    )
                )
              );
            },
            leading: CachedNetworkImage(
              imageUrl: "${BlogData.base_url}${categories[index].categoryImage}",
              placeholder: (context, url) => new CircularProgressIndicator(),
              height: 80.0,
              width: 80.0,
            ),
            title: Text(
              categories[index].categoryName,
              style: BlogData.titleStyle,
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.white,
            ),
          );
        },
        itemCount: categories.length,
        separatorBuilder: (BuildContext context, index) {
          return Divider(
            height: 8.0,
            color: Colors.transparent,
          );
        },
      ),
    );
  }
}
