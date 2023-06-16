import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:languagetranslate/lanclass.dart';
import 'package:languagetranslate/languages.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();


  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  // String? CC;
  // String? LC;
  // @override
/*  void initState() {
    // TODO: implement initState
    super.initState();
    getL();
  }
bool load = true;
  void getL() async {
    setState(() {
      load = false;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    CC = (await pref.getString("CC"))!;
    LC = (await pref.getString("LC"))!;
    print(CC);
    print(LC);
    setState(() {
      load = true;
    });
  }*/

  @override
  Widget build(BuildContext context) {

    // print(lanCls.LC!);
    // print(lanCls.CC);
    return GetMaterialApp(
      translations: Language(),
      locale: Locale("en" ,"US"),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LanCls lanCls = LanCls();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lanCls.getlan();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "name".tr,
              textAlign: TextAlign.center,
            ),
            Text(
              "position".tr,
              textAlign: TextAlign.center,
            ),
            FilledButton(
                onPressed: () async {
                  Get.updateLocale(Locale("en", 'US'));
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setString("CC", "US").then((value) => print("CC Success"));
                  await pref.setString("LC", "en").then((value) => print("CL Success"));
                },
                child: Text("English")),
            FilledButton(
                onPressed: () async {
                  Get.updateLocale(Locale("ta", 'IN'));
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setString("CC", "IN").then((value) => print("CC Success"));
                  await pref.setString("LC", "ta").then((value) => print("CL Success"));
                },
                child: Text("தமிழ்")),
            FilledButton(
                onPressed: () async {
                  Get.updateLocale(Locale("ka", 'IN'));
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setString("CC", "IN").then((value) => print("CC Success"));
                  await pref.setString("LC", "ka").then((value) => print("CL Success"));
                },
                child: Text("ಕನ್ನಡ")),
            FilledButton(
                onPressed: () async {
                  Get.updateLocale(Locale("te", 'IN'));
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setString("CC", "IN").then((value) => print("CC Success"));
                  await pref.setString("LC", "te").then((value) => print("CL Success"));
                },
                child: Text("తెలుగు")),
            FilledButton(
                onPressed: () async {
                  Get.updateLocale(Locale("ma", 'IN'));
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setString("CC", "IN").then((value) => print("CC Success"));
                  await pref.setString("LC", "ma").then((value) => print("CL Success"));
                },
                child: Text("മലയാളം")),
            FilledButton(
                onPressed: () async {
                  Get.updateLocale(Locale("hi", 'IN'));
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setString("CC", "IN").then((value) => print("CC Success"));
                  await pref.setString("LC", "hi").then((value) => print("CL Success"));
                },
                child: Text("हिंदी")),
          ],
        ),
      ),
    );
  }
}
