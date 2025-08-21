// ignore_for_file: avoid_redundant_argument_values

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/domain/commons/screen_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/auth/sign_in_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await AppTrackingTransparency.requestTrackingAuthorization();
  await ScreenUtils().isIpad(null);
  // runApp(MyApp());
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    checkIpad();
  }

  Future<dynamic> onSelectNotification(String? payload) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(payload!),
        content: Text("Payload: $payload"),
      ),
    );
  }

  Future<void> checkIpad() async {
    await ScreenUtils().isIpad(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'Pengawas Bulanan',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const SignInPage(),
        );
      },
    );
  }
}
