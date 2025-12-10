import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshops_flutter_4sim3/providers/AuthProvider.dart';
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
    final authProvider =Provider.of<Authprovider>(context);
    return Scaffold(
      body: Form(
        key:_globalKey ,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Center(child: Image.asset("assets/images/logo.png",width: 200,)),
              SizedBox(height: 20,),
              Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
              SizedBox(height: 20,),

              TextFormField(
                decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.black26),
                  border: OutlineInputBorder()
                ),
                onSaved: (value){
                  username=value!;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "username cannot be empty";
                  }
                },
              ),
              SizedBox(height: 20,),

              TextFormField(
                decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: OutlineInputBorder()
                ),
                onSaved: (value){
                  email=value!;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "email cannot be empty";
                  }
                },
              ),
              SizedBox(height: 20,),

              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: OutlineInputBorder()
                ),
                onSaved: (value){
                  password=value!;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "password cannot be empty";
                  }
                },
              ),
              SizedBox(height: 20,),

              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, "/");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(width: 10,),
                    Icon(Icons.arrow_forward_rounded,color: Colors.deepOrange,)
                  ],
                ),
              ),
              SizedBox(height: 20,),

              Container(
                width: 400,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white
                  ),
                    onPressed: () async{
                    if(_globalKey.currentState!.validate()){
                      _globalKey.currentState!.save();
                      bool success = await authProvider.signUp(username, email, password);
                      print(success);

                      if(success){
                        Navigator.pushNamed(context, "/");
                      }

                      else{
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text("Failed to sign up"),
                          );
                        });
                      }

                    }

                    },
                    child:authProvider.isLoading

                    ?CircularProgressIndicator(color: Colors.white,)

                    :Text("SIGN UP")),
              )

            ],
          ),
        ),
      ),
    );
  }
}
