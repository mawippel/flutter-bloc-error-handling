import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CustomStreamBuilder<T> extends StatelessWidget {
  final Observable<T> observable;
  final Widget Function(BuildContext context, AsyncSnapshot<T> snapshot)
      function;

  const CustomStreamBuilder({
    Key key,
    @required this.observable,
    @required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: observable,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('ERROR'),
          );
        }
        if (snapshot.hasData) {
          return function(context, snapshot);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
