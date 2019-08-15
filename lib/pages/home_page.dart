import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/bloc/bloc.dart';
import 'package:flutter_blog/services/repository.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blog/widgets/bottom_bar.dart';

import 'category_list.dart';

class HomePage extends StatefulWidget {
  final Repository repository;
  HomePage({this.repository});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BlogCategoryBloc _blogCategoryBloc;

  @override
  void initState() {
    super.initState();
    _blogCategoryBloc = BlogCategoryBloc(repository: widget.repository);
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => _blogCategoryBloc.dispatch(AppStartEvent())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: makeBottom,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        elevation: 0.1,
        title: Text("Blog Categories"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: (){

            },
          )
        ],
      ),
      body: BlocProvider(
        builder: (context) => _blogCategoryBloc,
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CategoryList()
            ],
          ),
        ),
      ),
    );
  }
}