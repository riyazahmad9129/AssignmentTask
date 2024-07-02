import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:login_task/add_child.dart';
import 'package:login_task/child_details.dart';
import 'package:login_task/child_screen.dart';
import 'package:login_task/distrtict_screen.dart';
import 'package:login_task/home_screen.dart';
import 'package:login_task/login.dart';
import 'package:login_task/provider/log_out.dart';
import 'package:login_task/provider/login_provider.dart';
import 'package:login_task/provider/state_provider.dart';
import 'package:login_task/state_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(create: (context) => AuthProvider(),),
        ChangeNotifierProvider(
          create: (context) => StateProvider(),
        )
      ],
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayWidgetBuilder: (progress) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: false,
          ),
          home: const LoginScreen(),
        ),
      ),
    );
  }
}
