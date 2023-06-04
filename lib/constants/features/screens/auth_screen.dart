// ignore: unused_import
import 'package:amazonclone/common/widgets/custom_button.dart';
import 'package:amazonclone/common/widgets/custom_textfiled.dart';
import 'package:amazonclone/constants/features/services/auth_service.dart';
import 'package:amazonclone/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signupFormKey = GlobalKey<FormState>();
  // ignore: unused_field
  final _signinFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailcontroler = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroler.dispose();
    _passwordcontroller.dispose();
    _namecontroller.dispose();
  }

  void SignUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailcontroler.text,
        password: _passwordcontroller.text,
        name: _namecontroller.text);
  }

  void SignInUser() {
    authService.signInUser(
      context: context,
      email: _emailcontroler.text,
      password: _passwordcontroller.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: GlobalVariables.backgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 22),
                        ),
                        ListTile(
                          // textColor: _auth == Auth.signup
                          //     ? Color.fromARGB(255, 255, 255, 255)
                          //     : const Color.fromARGB(117, 235, 236, 238),
                          title: const Text(
                            'Create Account',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          leading: Radio(
                            activeColor: GlobalVariables.secondaryColor,
                            value: Auth.signup,
                            groupValue: _auth,
                            onChanged: (Auth? val) {
                              setState(() {
                                _auth = val!;
                              });
                            },
                          ),
                        ),
                        if (_auth == Auth.signup)
                          Form(
                            key: _signupFormKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                    controller: _namecontroller, text: 'Name'),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                    controller: _emailcontroler, text: 'Email'),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                    controller: _passwordcontroller,
                                    text: 'Password'),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                  text: 'SignUp',
                                  ontap: () {
                                    if (_signupFormKey.currentState!
                                        .validate()) {
                                      SignUpUser();
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ListTile(
                          title: const Text(
                            'Sign-In',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          leading: Radio(
                            activeColor: GlobalVariables.secondaryColor,
                            value: Auth.signin,
                            groupValue: _auth,
                            onChanged: (Auth? val) {
                              setState(() {
                                _auth = val!;
                              });
                            },
                          ),
                        ),
                        if (_auth == Auth.signin)
                          Form(
                            key: _signinFormKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                    controller: _emailcontroler, text: 'Email'),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                    controller: _passwordcontroller,
                                    text: 'Password'),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                  text: 'SignIn',
                                  ontap: () {
                                    if (_signinFormKey.currentState!
                                        .validate()) {
                                      SignInUser();
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                      ]))),
        ));
  }
}
