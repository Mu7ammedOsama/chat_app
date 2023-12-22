import 'package:flutter/material.dart';

// firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_app/firebase_options.dart';

// cubits
import 'package:chat_app/cubits/authCubit/authCubit.dart';
import 'package:chat_app/cubits/chatCubit/chatCubit.dart';

// blocs
import 'package:chat_app/blocs/authBloc/AuthBloc.dart';
import 'package:chat_app/simpleBlocObserver.dart';

// dependencies
import 'package:flutter_bloc/flutter_bloc.dart';

// screens
import 'package:chat_app/screens/loginScreen.dart';
import 'package:chat_app/screens/registerScreen.dart';
import 'package:chat_app/screens/chatScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  BlocOverrides.runZoned(
    () => runApp(const ChatApp()),
    blocObserver: SimpleBlocObserver(),
  );
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          ChatScreen.id: (context) => ChatScreen(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        initialRoute: LoginScreen.id,
      ),
    );
  }
}
