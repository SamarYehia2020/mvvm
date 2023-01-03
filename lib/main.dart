import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mvvm_usamaa_app/binding/binding.dart';
import 'package:mvvm_usamaa_app/views/screens/auth/login_screen.dart';
import 'package:mvvm_usamaa_app/views/screens/control_view.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  await SentryFlutter.init(
      (options) => options.dsn = 'https://<key>@sentry.io/<project>',
      appRunner: () => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ControlView(),
      initialBinding: Binding(),
      theme: ThemeData(fontFamily: 'SourceSansPro'),
    );
  }
}
