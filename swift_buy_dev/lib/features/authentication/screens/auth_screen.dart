import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/common_widgets/customtextfield.dart';
import 'package:flutter/material.dart';

import '../../../services/auth_service.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String value = "login";
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: const [
                AppGlobalVariables.primaryColor,
                AppGlobalVariables.secondaryColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            )),
            child: Column(
              children: [
                SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        child: SizedBox(
                          width: 60,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              RotatedBox(
                                quarterTurns: 1,
                                child: Row(
                                  children: [
                                    Radio(
                                        activeColor: Colors.white,
                                        fillColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Colors.white),
                                        value: "login",
                                        groupValue: value,
                                        onChanged: (val) {
                                          setState(() {
                                            value = val!;
                                          });
                                        }),
                                    Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: "productSansReg"),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              RotatedBox(
                                quarterTurns: 1,
                                child: Row(
                                  children: [
                                    Radio(
                                        activeColor: Colors.white,
                                        fillColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Colors.white),
                                        value: "signup",
                                        groupValue: value,
                                        onChanged: (val) {
                                          setState(() {
                                            value = val!;
                                          });
                                        }),
                                    Text(
                                      "SignUp",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: "productSansReg"),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              RotatedBox(
                                quarterTurns: 1,
                                child: Row(
                                  children: [
                                    Radio(
                                        activeColor: Colors.white,
                                        fillColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Colors.white),
                                        value: "forgotPassword",
                                        groupValue: value,
                                        onChanged: (val) {
                                          setState(() {
                                            value = val!;
                                          });
                                        }),
                                    Text(
                                      "Forgot Password",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: "productSansReg"),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color: Colors.white,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height - 70,
                            child: authWidget(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  authWidget() {
    if (value == "login") {
      return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                "assets/logo without bg.png",
                scale: 1,
                height: 200,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Welcome Back To, ",
                  style: TextStyle(fontFamily: "productSansReg", fontSize: 18),
                ),
                Text(
                  "Swift Buy",
                  style: TextStyle(
                      fontFamily: "productSansReg",
                      fontSize: 18,
                      color: AppGlobalVariables.primaryColor),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/dot pattern.png"),
                          opacity: 120)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                              fontFamily: "productSansReg",
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customTextField(
                  editingController: emailController,
                  fieldTitle: "Email",
                  validator: (value) {
                    if (emailController.text.isEmpty) {
                      return "Email field can't be empty";
                    }
                    return null;
                  },
                  obscureText: false),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customTextField(
                  editingController: passwordController,
                  fieldTitle: "Password",
                  validator: (value) {
                    if (passwordController.text.isEmpty) {
                      return "password field can't be empty";
                    }
                    return null;
                  },
                  obscureText: true),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _authService.signInUser(
                        email: emailController.text,
                        password: passwordController.text,
                        context: context);
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: Text(
                    "Login",
                    style:
                        TextStyle(fontFamily: "productSansReg", fontSize: 18),
                  ),
                ))
          ],
        ),
      );
    } else if (value == "signup") {
      return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Hero(
              tag: 'logo',
              child: Image.asset(
                "assets/logo without bg.png",
                scale: 1,
                height: 150,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Welcome To, ",
                  style: TextStyle(fontFamily: "productSansReg", fontSize: 18),
                ),
                Text(
                  "Amazon",
                  style: TextStyle(
                      fontFamily: "productSansReg",
                      fontSize: 18,
                      color: Colors.red),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/dot pattern.png"),
                          opacity: 120)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Sign-Up",
                          style: TextStyle(
                              fontFamily: "productSansReg",
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customTextField(
                  editingController: nameController,
                  fieldTitle: "Name",
                  validator: (value) {
                    if (nameController.text.isEmpty) {
                      return "name field can't be empty";
                    }
                    return null;
                  },
                  obscureText: false),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customTextField(
                  editingController: emailController,
                  fieldTitle: "Email",
                  validator: (value) {
                    if (emailController.text.isEmpty) {
                      return "Email field can't be empty";
                    }
                    return null;
                  },
                  obscureText: false),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customTextField(
                  editingController: passwordController,
                  fieldTitle: "Password",
                  validator: (value) {
                    if (passwordController.text.isEmpty) {
                      return "Please enter password!!!";
                    }
                    return null;
                  },
                  obscureText: true),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customTextField(
                  editingController: addressController,
                  fieldTitle: "Address",
                  validator: null,
                  obscureText: false),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _authService.signUpUser(
                        email: emailController.text,
                        name: nameController.text,
                        password: passwordController.text,
                        address: addressController.text,
                        context: context);
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: Text(
                    "SignUp",
                    style:
                        TextStyle(fontFamily: "productSansReg", fontSize: 18),
                  ),
                ))
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
