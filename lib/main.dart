import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pharmacy/routes/app_pages.dart';
import 'package:pharmacy/utils/constants.dart';
import 'package:pharmacy/utils/local_storage.dart';

import 'colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Fetch token during app initialization
  final token = await getValueFromLocal(SharedPreferenceConst.API_TOKEN)as String?;
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    print("token -------------------$token");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Paiselyy",
      initialRoute: (token == null || token =="")
          ? AppPages.initial
          : AppPages.initialHome,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: secondaryTextStyle(
            color: white,
            size: 18,
            weight: FontWeight.w500,
          ),
          color: appColorPrimary,
        ),
      ),
      getPages: AppPages.routes,
    );
  }
}
