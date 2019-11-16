import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_error_handling/src/pages/home/home_repository.dart';
import 'package:flutter_error_handling/src/shared/models/post_model.dart';
import 'package:rxdart/rxdart.dart';

class CreateBloc extends BlocBase {
  
  final HomeRepository repo;

  CreateBloc(this.repo);

  String title;
  String body;

  var post = BehaviorSubject<PostModel>();

  PostModel get postValue => post.value;
  Sink<PostModel> get postIn => post.sink;
  Observable<int> get responseOut => post.switchMap(observablePost);

  Stream<int> observablePost(PostModel data) async* {
    yield 0;
    try {
      var response = await repo.createPost(data.toJson());
      yield response;
    } catch (e) {
      post.addError(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
  
}