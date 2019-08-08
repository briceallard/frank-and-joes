import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frank_and_joes/app/repositories/auth_repository.dart';
import 'package:frank_and_joes/app/utils/constants/pages.dart';
import 'package:frank_and_joes/app/utils/constants/resources.dart';
import 'package:frank_and_joes/app/utils/constants/theme.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();

    _obscurePassword = true;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark),
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _pageTitle(context),
          _buildForm(context),
        ],
      ),
    );
  }

  Widget _pageTitle(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      child: Stack(
        children: <Widget>[
          Animator(
            tween: Tween<double>(begin: -250, end: 0),
            duration: Duration(milliseconds: 800),
            curve: Curves.easeOut,
            builder: (anim) => Positioned(
              top: anim.value,
              right: -70.0,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Image(
                  image: AssetImage(Resources.coffee_clipart),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Animator(
            tween: Tween<double>(begin: -200, end: 34.0),
            duration: Duration(milliseconds: 800),
            curve: Curves.easeOut,
            builder: (anim) => Positioned(
              top: 80.0,
              left: anim.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Welcome',
                    style: CustomTheme().pageTitle,
                  ),
                  Text(
                    'Sign in to continue',
                    style: CustomTheme().pageDescription,
                  ),
                ],
              ),
            ),
          ),
          Animator(
            tween: Tween<double>(begin: -150, end: 0.0),
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
            builder: (anim) => Positioned(
              bottom: anim.value,
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage(Resources.beans_clipart),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 4,
      left: 0.0,
      right: 0.0,
      child: Form(
        key: _loginFormKey,
        child: Container(
          margin: EdgeInsets.only(top: 16.0),
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _emailTextField(),
              _passwordTextField(),
              _forgotPasswordLink(),
              _signInButton(),
              _signUpLink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.email),
        Container(
          margin: EdgeInsets.only(bottom: 20.0),
          width: MediaQuery.of(context).size.width * .70,
          child: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              isDense: true,
              labelText: 'Email Address',
            ),
            style: CustomTheme().regText,
          ),
        ),
      ],
    );
  }

  Widget _passwordTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.vpn_key),
        Container(
          width: MediaQuery.of(context).size.width * .70,
          child: TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              isDense: true,
              labelText: 'Password',
              suffixIcon: GestureDetector(
                onTap: () => _toggleObscure(),
                child: Icon(
                  _obscurePassword
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  color: Colors.black,
                  size: 16.0,
                ),
              ),
            ),
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ],
    );
  }

  Widget _forgotPasswordLink() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(Pages.forgotPassword),
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _signInButton() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 60.0, bottom: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: CustomColors.teal,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              offset: Offset(0.0, 3.0),
            ),
          ],
        ),
        child: MaterialButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 100.0,
            ),
            child: Provider.of<AuthRepository>(context).status ==
                    Status.Authenticating
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    child: SizedBox(
                      height: 25.0,
                      width: 25.0,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        strokeWidth: 2.5,
                      ),
                    ),
                  )
                : Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontFamily: 'Oswald',
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w600),
                  ),
          ),
          onPressed: () =>
              Provider.of<AuthRepository>(context).signInWithEmailAndPassword(
            emailController.text,
            passwordController.text,
          ),
        ),
      ),
    );
  }

  Widget _signUpLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Don\'t have an account? ',
          style: TextStyle(color: Colors.grey),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Sign up',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }

  void _toggleObscure() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }
}