import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inspector/models/player.dart';
import 'package:inspector/screens/player_screen/player_screen.dart';
import 'package:inspector/screens/signup_screen.dart';
import 'package:inspector/services/firebase_auth_service.dart';
import 'package:inspector/widgets/form_container_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FireBaseAuthService _auth = FireBaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var _isSigningIn = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                controller: _emailController,
                hintText: 'Email',
                isPasswordField: false,
              ),
              const SizedBox(height: 10),
              FormContainerWidget(
                controller: _passwordController,
                hintText: 'Password',
                isPasswordField: true,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _signIn,
                    child: _isSigningIn
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(),
                          )
                        : const Text('Login'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () => {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                        (route) => false,
                      )
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigningIn = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigningIn = false;
    });

    if (user != null) {
      final FirebaseFirestore db = FirebaseFirestore.instance;
      var snapshot = await db.collection('players').doc(user.uid).get();
      if (snapshot.exists == false) {
        await db.collection('players').doc(user.uid).set(Player().toJson());
      }
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PlayerScreen(id: Provider.of<User>(context).uid)),
        (route) => false,
      );
    }
  }
}
