import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frank_and_joes/app/repositories/auth_repository.dart';
import 'package:frank_and_joes/app/utils/constants/resources.dart';
import 'package:frank_and_joes/app/utils/constants/theme.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _resetPasswordFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  AuthRepository authRepository = new AuthRepository.instance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
      ),
    );
  }
}
