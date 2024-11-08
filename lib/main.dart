import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ministry_health/core/navigation/screen_names.dart';
import 'package:ministry_health/features/add_hala_screen/presentation/view/add_hala_screen.dart';
import 'package:ministry_health/features/add_hala_screen/presentation/view_model/cubit/add_hala_cubit.dart';
import 'package:ministry_health/features/home_screen/presentation/view/home_screen.dart';
import 'package:ministry_health/features/register_screen/presentation/view/register_screen.dart';
import 'package:ministry_health/features/register_screen/presentation/view_model/cubit/registration_cubit.dart';
import 'package:ministry_health/features/sign_in_screen/presentation/view/sign_in_screen.dart';
import 'package:ministry_health/features/sign_in_screen/presentation/view_model/cubit/sign_in_cubit.dart';
import 'package:ministry_health/generated/l10n.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        locale: const Locale("ar"),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        routes: {
          ScreenNames.regScreen: (context) => BlocProvider(
                create: (context) => RegistrationCubit(),
                child: const RegisterScreen(),
              ),
          ScreenNames.loginScreen: (context) => BlocProvider(
                create: (context) => SignInCubit(),
                child: const SignInScreen(),
              ),
          ScreenNames.homeScreen: (context) => const HomeScreen(),
          ScreenNames.addHalaScreen: (context) => BlocProvider(
                create: (context) => AddHalaCubit(),
                child: const AddHalaScreen(),
              )
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: ScreenNames.regScreen,
      ),
    );
  }
}
