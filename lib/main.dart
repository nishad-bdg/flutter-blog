import 'package:flutter/material.dart';
import 'package:flutter_blog/services/repository.dart';

import 'pages/home_page.dart';

void main(){
  final _repository = Repository();
  runApp(MyApp(repository:_repository));
}

class MyApp extends StatelessWidget {
  final Repository repository;
  MyApp({this.repository});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Blog',
      theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
      home: HomePage(repository:repository),
    );
  }
}