import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/bloc/blog/bloc.dart';
import 'package:flutter_blog/model/api_model.dart';
import 'package:flutter_blog/pages/blog_details.dart';
import 'package:flutter_blog/services/repository.dart';
import 'package:flutter_blog/utils/BlogData.dart';
import 'package:flutter_blog/widgets/laoding.dart';

class BlogPage extends StatefulWidget {
  final Repository repository;
  final String slug;
  final String appBarTitle;
  BlogPage({this.repository, this.slug, this.appBarTitle});
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  BlogBloc _blogBloc;

  @override
  void initState() {
    super.initState();
    _blogBloc = BlogBloc(repository: widget.repository);
    SchedulerBinding.instance.addPostFrameCallback(
        (_) => _blogBloc.dispatch(SelectCategoryEvent(slug: widget.slug)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        builder: (context) => _blogBloc,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.appBarTitle),
          ),
          body: BlocBuilder(
            bloc: _blogBloc,
            builder: (context, state) {
              if (state is InitialBlogState) {
                return Loading();
              } else if (state is BlogFetchingState) {
                return Loading();
              } else if (state is BlogErrorState) {
                return Center(
                  child: Text("Error loading blogs"),
                );
              } else if (state is BlogEmptyState) {
                return Center(
                  child: Text("No data found"),
                );
              } else {
                final stateIsBogFetchedState = state as BlogFetchedState;
                final blogs = stateIsBogFetchedState.blogs;
                return Container(
                  margin: const EdgeInsets.all(5.0),
                  child: buildBlogListWithGridView(blogs),
                );
              }
            },
          ),
        ));
  }

  Widget buildBlogListWithGridView(List<Blogs> blogs) {
    return GridView.builder(
      itemCount: blogs.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Hero(
            tag: blogs[index].title,
            child: Material(
              child: InkWell(
                onLongPress: () {
                  print("Long Pressed");
                  _blogBloc.dispatch(SelectCategoryEvent(slug: widget.slug));
                },
                onTap: () {
                  print("Pressed items");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                repository: widget.repository,
                                id: blogs[index].id,
                                appBarTitle: blogs[index].title,
                              )));
                },
                child: GridTile(
                    footer: Container(
                      color: Colors.black87,
                      child: ListTile(
                        title: Text(
                          blogs[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    child: Container(
                      child: CachedNetworkImage(
                        imageUrl:
                            "${BlogData.base_url}${blogs[index].blogImage}",
                        placeholder: (context, url) =>
                            new CircularProgressIndicator(),
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
            ),
          ),
        );
      },
    );
  }
}
