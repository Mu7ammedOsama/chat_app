import 'package:flutter/material.dart';

// dependencies
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// widgets
import 'package:chat_app/widgets/customFormTextField.dart';
import 'package:chat_app/widgets/customButton.dart';

// screens
import 'package:chat_app/screens/chatScreen.dart';

// helpers
import 'package:chat_app/helper/showSnackBar.dart';

// cubits
import 'package:chat_app/cubits/authCubit/authCubit.dart';
import 'package:chat_app/cubits/authCubit/authState.dart';

// constants
import 'package:chat_app/constants.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static const String id = 'registerScreen';

  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          Navigator.pushNamed(context, ChatScreen.id);
          isLoading = false;
        } else if (state is RegisterFailure) {
          showSnackBar(context, state.errorMessage);
          isLoading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 64),
                  Image.asset(
                    kLogo,
                    height: 100,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scholar Chat',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 64),
                  const Row(
                    children: [
                      Text(
                        'REGISTER',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  CustomFormTextField(
                    onChange: (value) => email = value,
                    hintText: 'Enter your email....',
                  ),
                  const SizedBox(height: 16),
                  CustomFormTextField(
                    obscureText: true,
                    onChange: (value) => password = value,
                    hintText: 'Enter your password....',
                  ),
                  const SizedBox(height: 64),
                  CustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).registerUser(email: email!, password: password!);
                      }
                    },
                    text: 'Register',
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Color(0xFFC7EDE6)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
