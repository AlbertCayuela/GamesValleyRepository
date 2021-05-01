import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:games_valley/screens/base.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:games_valley/screens/company/company_base_screen.dart';
import 'package:games_valley/screens/company/company_create_offer_screen.dart';
import 'package:games_valley/screens/company/company_profile_edit.dart';
import 'package:games_valley/screens/company/company_signup.dart';
import 'package:games_valley/screens/login.dart';
import 'package:games_valley/screens/offers.dart';
import 'package:games_valley/screens/profile/languages_edit/languages_edit.dart';
import 'package:games_valley/screens/profile/main_info_edit/main_info_edit.dart';
import 'package:games_valley/screens/profile/profile.dart';
import 'package:games_valley/screens/profile/studies_edit/studies_edit.dart';
import 'package:games_valley/screens/signup.dart';
import 'package:provider/provider.dart';
import 'package:games_valley/screens/profile/work_edit/edit_work.dart';

//*-----------------------------MAIN--------------------------------------------
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GamesValley());
}

class GamesValley extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserRepository>(
            create: (_) => UserRepository(FirebaseAuth.instance)),
        StreamProvider(
            create: (context) =>
                context.read<UserRepository>().authStateChanges),
      ],
      child: MaterialApp(
        title: 'GamesValley',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: 'OpenSans',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignUpScreen(),
          '/offers': (context) => BaseScreen(index: 0),
          '/profile': (context) => BaseScreen(index: 1),
          '/authwrapper': (context) => AuthWrapper(),
          '/editwork': (context) => EditWorkScreen(),
          '/editstudies': (context) => EditStudiesScreen(),
          '/editlanguages': (context) => EditLanguagesScreen(),
          '/companysignup': (context) => CompanySignUpScreen(),
          '/companyeditprofile': (context) => CompanyProfileEdit(),
          '/createjoboffer': (context) => CreateOfferScreen(),
        },
        home: MultiProvider(
          child: AuthWrapper(),
          providers: [
            Provider<UserRepository>(
                create: (_) => UserRepository(FirebaseAuth.instance)),
            StreamProvider(
                create: (context) =>
                    context.read<UserRepository>().authStateChanges),
          ],
        ),
      ),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({
    Key key,
  }) : super(key: key);

  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool isCompany;
  bool loading;
  bool isChecked;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading = true;
    isChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      if (!isChecked) {
        context.read<UserRepository>().getIsCompany().then((value) {
          setState(() {
            isCompany = value;
            loading = false;
            isChecked = true;
          });
        });
      }

      if (isChecked) {
        if (isCompany) {
          return CompanyBaseScreen();
        } else if (!isCompany) {
          return BaseScreen(index: 0);
        }
      }
      return Center(child: CircularProgressIndicator());
    }
    return LoginScreen();
  }
}
