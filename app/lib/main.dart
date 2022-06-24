import 'package:app/controllers/global_controller.dart';
import 'package:app/utils/routes.dart';
import 'package:app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var options = EMOptions(appKey: "1135220518118413#demo");
  await EMClient.getInstance.init(options);
  EMClient.getInstance.startCallback();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());
    return GetMaterialApp(
      title: "ProcessManagement",
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.system,
      getPages: Routes.pages,
    );
  }
}
