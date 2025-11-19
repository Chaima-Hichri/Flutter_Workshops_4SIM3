import 'package:flutter/material.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String email;
  late String username;
  late String password;

  GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key:_globalKey ,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Image.asset("assets/images/logo.png"),
              Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.black26),
                  border: OutlineInputBorder()
                ),
                onSaved: (value){
                  username!=value;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "username cannot be empty";
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: OutlineInputBorder()
                ),
                onSaved: (value){
                  email!=value;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "email cannot be empty";
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: OutlineInputBorder()
                ),
                onSaved: (value){
                  password!=value;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "password cannot be empty";
                  }
                },
              ),
              Row(
                children: [
                  Text("Already have an account?"),
                  Icon(Icons.arrow_forward_rounded)
                ],
              ),
              Container(
                width: 400,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white
                  ),
                    onPressed: (){},
                    child: Text("SignUp")),
              )

            ],
          ),
        ),
      ),
    );
  }
}
