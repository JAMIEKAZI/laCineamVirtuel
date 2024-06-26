import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lecinemavirtuel/common/route_constants.dart';
import 'package:lecinemavirtuel/helpers/customColors.dart';
import 'package:lecinemavirtuel/services/auth_service.dart';
import 'package:lecinemavirtuel/services/localStorage.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  LocalStorage localStorage = LocalStorage();
  AuthService authService = AuthService();
  String token = '';
  bool isFetchingAccount = false;
  bool hasError = false;
  @override
  void initState() {
    super.initState();

    getSavedData();
    initialize();

    // new Future.delayed(const Duration(seconds: 3),
    //     () => Navigator.pushNamed(context, LoginRoute));
  }

  // check cache and route to appropraite screen
  initialize() async {
    new Future.delayed(
        const Duration(seconds: 3),
        () => token != ''
            ? fetchAccount()
            : Navigator.pushNamed(context, LoginRoute));
  }

  getSavedData() async {
    try {
      token = await localStorage.getData(name: 'token');
      // accountId = await localStorage.getData(name: 'accountId');
      print('token $token');
    } catch (e) {
      print('error $e');
    }
  }

  fetchAccount() async {
    try {
      setState(() {
        isFetchingAccount = true;
        hasError = false;
      });
      await authService.fetchProfile();
      // await authService.initFirebase(accountId);
      setState(() {
        isFetchingAccount = false;
      });
      Navigator.pushReplacementNamed(context, MoviePremiereRoute);
    } catch (e) {
      setState(() {
        isFetchingAccount = false;
        hasError = true;
      });

      await localStorage.removeData(name: 'token');

      Navigator.pushNamed(context, LoginRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff20262D),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Container(
          child: Container(
            child: !hasError
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: SvgPicture.asset("assets/cinemaappLogo.svg",
                              width: 80.0))
                    ],
                  )
                : InitError(onPressed: fetchAccount),
          ),
        ),
      ),
    );
  }
}

class InitError extends StatelessWidget {
  final Function onPressed;
  InitError({required this.onPressed});
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Lottie.asset(
            //   'assets/animations/error.json',
            // ),
            SizedBox(height: 5),
            Text("Something is not right!",
                style: TextStyle(fontSize: 18, color: Colors.white)),
            SizedBox(height: 5),
            TextButton(
                onPressed: () => onPressed(),
                child: Text('Retry',
                    style: TextStyle(
                        fontSize: 16, color: CustomColors.PrimaryColor)))
          ],
        ));
  }
}
