import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_error_handling/src/app/app_module.dart';
import 'package:flutter_error_handling/src/shared/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends BlocBase {
  AuthBloc() {
    repo = AppModule.to.getDependency<AuthRepository>();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    jwt = prefs.get("jwt");
  }

  AuthRepository repo;
  String jwt;

  Future<String> login() async {
    var res = await repo
        .login({"email": "flutter@gmail.com", "password": "123456789"});
    jwt = res['token'];
    SharedPreferences.getInstance().then((value) {
      value.setString("jwt", jwt);
    });
    return jwt;
  }
}
