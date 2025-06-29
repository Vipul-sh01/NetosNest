import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Routes/AppRoutes.dart';
import 'ViewModels/DarkModeViewModels.dart';
import 'ViewModels/UserViewsModels/UserViewsModels.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(LightModeController());
  Get.lazyPut<AuthControllers>(() => AuthControllers());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LightModeController darkModeController = Get.put(LightModeController());

    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: darkModeController.isLightMode.value ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/homeScreen',
      getPages: AppRoutes.routes,
    ));
  }
}
