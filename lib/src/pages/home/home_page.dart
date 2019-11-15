import 'package:flutter/material.dart';
import 'package:flutter_error_handling/src/pages/home/home_bloc.dart';
import 'package:flutter_error_handling/src/pages/home/home_module.dart';
import 'package:flutter_error_handling/src/shared/models/post_model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  void initState() {
    super.initState();
    bloc.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<List<PostModel>>(
          stream: bloc.responseOut,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('ERROR'),
              );
            }
            if (snapshot.hasData) {
              return Column(
                children: snapshot.data
                    .map((post) => ListTile(
                          title: Text(post.title),
                        ))
                    .toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
