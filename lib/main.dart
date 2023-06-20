import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ozlu_sozler_flutter/firebase_options.dart';
import 'package:ozlu_sozler_flutter/screens/home_screen_deneme.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

Future<void> main() async {
  var devices = ["6D9C97CA23F72C2B9BD9E8C14EE91158"];
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  RequestConfiguration requestConfiguration =
      RequestConfiguration(testDeviceIds: devices);
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);
  await Firebase.initializeApp(
    name: "ozlusozler-13ec6",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ScreenUtil.init(
      context,
      designSize: const Size(411, 800),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyProvider(),
      child: ScreenUtilInit(
          designSize: const Size(411, 800),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              //theme: ThemeData.dark(),
              title: 'Material App',
              home: HomeScreenDeneme(),
            );
          }),
    );
  }
}
