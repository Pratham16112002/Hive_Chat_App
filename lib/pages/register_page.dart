import 'package:flutter/material.dart';
import 'package:hive_chat/constants.dart';
import 'package:hive_chat/components/button_custom.dart';
import 'package:hive_chat/components/text_field_custom.dart';
import 'package:hive_chat/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    void signUp() async {
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password\'s do not match'),
          ),
        );
        return;
      }
      final authService = Provider.of<AuthService>(context, listen: false);

      try {
        await authService.signUpWithEmailandPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.message,
                  size: 100,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Lets create an account for you , ',
                      style: kMainHeadingStyle,
                    ),
                    const Icon(Icons.emoji_emotions)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldCustom(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false),
                const SizedBox(
                  height: 9,
                ),
                TextFieldCustom(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),
                const SizedBox(
                  height: 9,
                ),
                TextFieldCustom(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true),
                const SizedBox(
                  height: 25,
                ),
                ButtonCustom(onTap: signUp, text: 'Sign Up'),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already a Member ? '),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login Now',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
