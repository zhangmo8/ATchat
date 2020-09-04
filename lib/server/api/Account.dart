import 'package:flutter/cupertino.dart';

import '../http.dart';

class AccountServe {
  static registe({@required Map userInfo}) async =>
      http.post("/auth/register", queryParameters: userInfo);

  static login({@required Map userInfo}) async => http.post("/auth/register/login",
      data: {"email": "944031973@qq.com", "password": "Xyt123"});


  static geta({@required Map userInfo}) async => http.get("/auth/register/test");
}
