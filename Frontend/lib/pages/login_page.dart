import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/api/api_service.dart';
import 'package:grocery_app/config.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAsyncCallProcess = false;
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ProgressHUD(
          child: Form(
            key: globalKey,
            child: _loginUI(),
          ),
          inAsyncCall: isAsyncCallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _loginUI() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Image.asset(
              "assets/images/shopping-bag.png",
              width: 150,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "Grocery App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FormHelper.inputFieldWidget(
            context,
            "Email",
            "E-Mail",
            (onValidate) {
              if (onValidate.isEmpty) {
                return "* Required";
              }

              bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(onValidate);

              if (!emailValid) {
                return "Invalid Email";
              }
            },
            (onSaved) {
              email = onSaved.toString().trim();
            },
            showPrefixIcon: true,
            prefixIcon: Icon(Icons.email_outlined),
            borderRadius: 10,
            contentPadding: 14,
            fontSize: 14,
            prefixIconPaddingLeft: 10,
            borderColor: Colors.grey.shade200,
            prefixIconColor: Colors.black,
            hintFontSize: 14,
            hintColor: Colors.black.withOpacity(.6),
            backgroundColor: Colors.grey.shade100,
            borderFocusColor: Colors.grey.shade200,
          ),
          const SizedBox(
            height: 10,
          ),
          FormHelper.inputFieldWidget(
            context,
            "Password",
            "Password",
            (onValidate) {
              if (onValidate.isEmpty) {
                return "* Required";
              }
            },
            (onSaved) {
              password = onSaved.toString().trim();
            },
            showPrefixIcon: true,
            prefixIcon: Icon(Icons.lock_open),
            borderRadius: 10,
            contentPadding: 14,
            fontSize: 14,
            prefixIconPaddingLeft: 10,
            borderColor: Colors.grey.shade200,
            prefixIconColor: Colors.black,
            hintFontSize: 14,
            hintColor: Colors.black.withOpacity(.6),
            backgroundColor: Colors.grey.shade100,
            borderFocusColor: Colors.grey.shade200,
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: FormHelper.submitButton(
              "Sign In",
              () {
                if (validateAndSave()) {
                  // api call
                  setState(() {
                    isAsyncCallProcess = true;
                  });
                  ApiService.loginUser(email!, password!).then(
                    (response) {
                      setState(() {
                        isAsyncCallProcess = true;
                      });

                      if (response) {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          Config.app_name,
                          "User Logged-In Successfuly",
                          "ok",
                          () {
                            Navigator.of(context).pop();
                            Navigator.pushNamedAndRemoveUntil(
                                context, "/home", (route) => false);
                          },
                        );
                      } else {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          Config.app_name,
                          "Invalid Email or Password",
                          "Ok",
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      }
                    },
                  );
                }
              },
              btnColor: Colors.deepOrangeAccent,
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Dont have anaccount?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "Dont have anaccount?",
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          "/register",
                          (route) => false,
                        );
                      },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
