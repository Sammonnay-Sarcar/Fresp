import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fresp/common/widgets/custom_button.dart';
import 'package:fresp/common/widgets/custom_textField.dart';
import 'package:fresp/constants/global_variables.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signupFormKey = GlobalKey<FormState>();
  final _signinFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalVariables.greyBackgroundCOlor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Welcome',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text('Create Account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
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
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signupFormKey,
                    child: Column(children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _nameController,
                        hintText: 'Name',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                          text: 'Connect with Google',
                          backgroundColour: Color.fromARGB(255, 36, 83, 203),
                          onTap: () async {
                            final GoogleSignInAccount? googleUser =
                                await GoogleSignIn().signIn();

                            // Obtain the auth details from the request
                            final GoogleSignInAuthentication? googleAuth =
                                await googleUser?.authentication;

                            // Create a new credential
                            final credential = GoogleAuthProvider.credential(
                              accessToken: googleAuth?.accessToken,
                              idToken: googleAuth?.idToken,
                            );
                          }),
                      const SizedBox(height: 10),
                      CustomButton(
                          text: 'Sign Up',
                          backgroundColour: GlobalVariables.secondaryColor,
                          onTap: () async {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                print(
                                    'The account already exists for that email.');
                              }
                            } catch (e) {
                              print(e);
                            }
                          })
                    ]),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text('Sign in',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
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
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signinFormKey,
                    child: Column(children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                          text: 'Connect with Google',
                          backgroundColour: Color.fromARGB(255, 36, 83, 203),
                          onTap: () async {
                            final GoogleSignInAccount? googleUser =
                                await GoogleSignIn().signIn();

                            // Obtain the auth details from the request
                            final GoogleSignInAuthentication? googleAuth =
                                await googleUser?.authentication;

                            // Create a new credential
                            final credential = GoogleAuthProvider.credential(
                              accessToken: googleAuth?.accessToken,
                              idToken: googleAuth?.idToken,
                            );
                          }),
                      const SizedBox(height: 10),
                      CustomButton(
                          text: 'Sign in',
                          backgroundColour: GlobalVariables.secondaryColor,
                          onTap: () async {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                              }
                            }
                          })
                    ]),
                  ),
                ),
            ],
          ),
        )));
  }
}
