import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/bloc/blog_details/bloc.dart';
import 'package:flutter_blog/model/api_model.dart';
import 'package:flutter_blog/services/repository.dart';
import 'package:flutter_blog/utils/BlogData.dart';
import 'package:flutter_blog/widgets/laoding.dart';

class DetailPage extends StatefulWidget {
  final Repository repository;
  final int id;
  final String appBarTitle;
  DetailPage({this.repository,this.id, this.appBarTitle});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  BlogDetailsBloc _blogDetailsBloc;

  @override
  void initState() {
    super.initState();
    _blogDetailsBloc = BlogDetailsBloc(repository: widget.repository);
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => _blogDetailsBloc.dispatch(SelectBlogEvent(id:widget.id))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: Text(widget.appBarTitle),
      ),
      body: BlocProvider(
          builder:(context) => _blogDetailsBloc,
          child: BlocBuilder(
            bloc: _blogDetailsBloc,
            builder: (context,state){
              if(state is InitialBlogDetailsState){
                return Loading();
              }
              else if(state is BlogDetailsFetchingState){
                return Loading();
              }
              else if(state is BlogDetailsErrorState){
                return Center(child: Text("Error loading data."));
              }
              else{
                final stateAsFetchedState = state as BlogDetailsFetchedState;
                final blogDetails = stateAsFetchedState.blogDetails;
                return buildBlogDetails(blogDetails);
              }
            },
          ), 
      ),
    );
  }

  Widget buildBlogDetails(Blogs blogDetails){
    return Container(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: Stack(
        children: <Widget>[
          _getBackground(blogDetails),
          _getContent(blogDetails),
        ],
      ),
    );
  }
  
  Widget _getBackground(Blogs blogDetails){
    return Container(
      height: 300.0,
      child: CachedNetworkImage(
        imageUrl: "${BlogData.base_url}${blogDetails.blogImage}",
         placeholder: (context, url) => new CircularProgressIndicator(),
         errorWidget: (context, url, error) => new Icon(Icons.error),
      ),
     
    );
  }

  Widget _getContent(Blogs blogDetails){
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.fromLTRB(10.0, 320.0, 10.0, 32.0),
        child: Text(blogDetails.article, 
        style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
      ),
    );
  }
}