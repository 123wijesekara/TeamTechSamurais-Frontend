import 'dart:async';
import 'package:flutter/material.dart';
import 'package:panchikawatta/global/common/toast.dart';
import 'package:panchikawatta/main.dart';
import 'package:panchikawatta/rest/rest_api.dart';
import 'package:panchikawatta/screens/forgetpassword1.dart';
import 'package:panchikawatta/screens/sign_up1.dart';
import 'package:panchikawatta/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<login> {
  bool _isSigning = false;
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  // TextEditingController _email = TextEditingController();    //shashini
  // TextEditingController _password = TextEditingController();
  // bool isLoading = false;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xFFFF5C01),
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Image.asset(
                  'lib/src/img/orange logo 1.png',
                  height: 150,
                  width: 200,
                ),
              ),
              SizedBox(height: 2),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Text(
                  "Welcome to Panchikawatta",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15, // Adjust the font size here
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFieldContainer(
                child: TextField(
                  controller: usernameController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Username",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  controller: emailController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassword1()),
                      );
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(29),
                ),
                child: ElevatedButton(
                  onPressed: _signIn,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    backgroundColor: const Color(0xFFFF5C01),
                  ),
                  child: _isSigning
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      "Don't have an Account?",
                      style: TextStyle(
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => sign_up1()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xFFFF8000),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  //  void _signIn() async {
  //   setState(() {
  //     _isSigning = true;
  //   });

  //   String email = emailController.text.trim();
  //   String password = passwordController.text.trim();

  //   User? user = await _auth.signInWithEmailAndPassword(email, password);

  //   setState(() {
  //     _isSigning = false;
  //   });

  //   if (user != null) {
  //     if (user.emailVerified) {
        
  //       showToast(message: "You are successfully signed in");
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => MyHomePage(),
  //         ),
  //       );
  //     } else {
  //       showToast(message: "Please verify your email before login");
  //     }
  //   } else {
  //     showToast(message: "Invalid email or password");
  //   }
  // }

   void _signIn() async {
  setState(() {
    _isSigning = true;
  });

  String email = emailController.text.trim();
  String password = passwordController.text.trim();

  try {
    // Sign in with email and password
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      // Check if the user's email is verified
      if (user.emailVerified) {
        // Retrieve the ID token for the authenticated user
        String? token = await _auth.getIdToken(user);

      bool loginSuccess = await loginWithToken(token);
           

        if (token != null) {
          // Pass the token to your REST API login function
            
            showToast(message: "You are successfully signed in");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
            );
           
        } else {
          showToast(message: "Failed to retrieve token");
        }
      } else {
        showToast(message: "Please verify your email before login");
      }
    } else {
      showToast(message: "Invalid email or password");
    }
  } catch (e) {
    setState(() {
      _isSigning = false;
    });
    print("Error signing in: $e");
    showToast(message: "Failed to sign in. Check your credentials.");
  }
}

//   void _signIn() async {
//   setState(() {
//     _isSigning = true;
//   });

//   String email = emailController.text.trim();
//   String password = passwordController.text.trim();

  
//       User? user  = await _auth.signInWithEmailAndPassword(email, password);
     

//     setState(() {
//       _isSigning = false;
//     });

//  if (user != null) {
//       if (user.emailVerified) {
//         showToast(message: "You are successfully signed in");
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => MyHomePage(),
//           ),
//         );
//       } else {
//         showToast(message: "Please verify your email before login");
//       }
//     } else {
//       showToast(message: "Invalid email or password");
//     }
}



class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Color.fromRGBO(246, 243, 243, 0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: login(),
  ));
}