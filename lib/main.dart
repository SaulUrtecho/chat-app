import 'package:firebase_chat/app_const.dart';
import 'package:firebase_chat/firebase_options.dart';
import 'package:firebase_chat/presentation/cubit/chat/chat_cubit.dart';
import 'package:firebase_chat/presentation/cubit/user/user_cubit.dart';
import 'package:firebase_chat/presentation/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart' as di;
import 'on_generate_route.dart';
import 'presentation/cubit/auth/auth_cubit.dart';
import 'presentation/cubit/credential/credential_cubit.dart';
import 'presentation/cubit/group/group_cubit.dart';
import 'presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider<CredentialCubit>(
          create: (_) => di.sl<CredentialCubit>(),
        ),
        BlocProvider<UserCubit>(
          create: (_) => di.sl<UserCubit>()..getUsers(),
        ),
        BlocProvider<GroupCubit>(
          create: (_) => di.sl<GroupCubit>()..getGroups(),
        ),
        BlocProvider<ChatCubit>(
          create: (_) => di.sl<ChatCubit>(),
        ),
      ],
      child: MaterialApp(
        title: AppConst.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/',
        onGenerateRoute: OnGenerateRoute.route,
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return HomePage(uid: authState.uid);
                } else
                  return LoginPage();
              },
            );
          }
        },
      ),
    );
  }
}
