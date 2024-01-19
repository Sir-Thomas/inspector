import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:inspector/firebase_options.dart';
import 'package:inspector/screens/character_creation_screen/character_creation_screen.dart';
import 'package:inspector/screens/login_screen.dart';
import 'package:inspector/screens/player_list_screen.dart';
import 'package:inspector/screens/splash_screen.dart';
import 'package:inspector/services/firestore_service.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const InspectorApp());
}

class InspectorApp extends StatelessWidget {
  const InspectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>.value(
          value: FirebaseAuth.instance.authStateChanges(),
          initialData: null,
        ),
      ],
      child: MaterialApp(routes: {
        '/': (context) => const SplashScreen(child: LoginScreen()),
        LoginScreen.routeName: (context) => const LoginScreen(),
        CharacterCreationScreen.routeName: (context) =>
            CharacterCreationScreen(),
      }),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirestoreService firestoreService =
        Provider.of<FirestoreService>(context, listen: false);
    () async {
      await firestoreService.getCharactersFromFirebase("tommy");
      name = firestoreService.getName();
    };
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: Text(name),
          ),
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome!',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
