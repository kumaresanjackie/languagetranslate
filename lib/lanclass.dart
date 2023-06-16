import 'dart:ui';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanCls {
  String? CC;
  String? LC;
  Future getlan() async {
    var pref = await SharedPreferences.getInstance();
    CC = (await pref.getString("CC"))!;
    LC = (await pref.getString("LC"))!;

    if(CC == null){
      CC = "US";
      LC = "en";
    }
    await Get.updateLocale(Locale(LC!,CC!));
    print("========== From Class > " + CC!);
    print("========== From Class > " + LC!);
  }
}
