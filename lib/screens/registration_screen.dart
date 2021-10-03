import 'package:flutter/material.dart';
import 'package:chatapp/components/components.dart';
import 'package:chatapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String emailid;
  late String userpassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'idd',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(keyboardType:TextInputType.emailAddress,
            textAlign:TextAlign.center ,
              onChanged: (value) {
                emailid = value;
              },
              decoration: kTextfieldDecoration.copyWith(
                  hintText: 'Enter the your emailid'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(obscureText: true  ,
            textAlign:TextAlign.center ,
              onChanged: (value) {
                userpassword = value;
              },
              decoration: kTextfieldDecoration.copyWith(
                  hintText: 'Enter your password.'),
            ),
            SizedBox(
              height: 24.0,
            ),
            Roundbutton(
                colour: Colors.blueAccent,
                title: 'Register',
                onpress: () async {
                  try {
                    final user = await _auth.createUserWithEmailAndPassword(
                        email: emailid, password: userpassword);
                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                })
          ],
        ),
      ),
    );
  }
}
