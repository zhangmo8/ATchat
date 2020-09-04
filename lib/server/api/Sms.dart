import 'package:flutter/cupertino.dart';

import '../http.dart';

class SmsServe {
  static registe({@required String email}) async =>
      http.get("auth/register/send-code", queryParameters: {"email": email});
}
