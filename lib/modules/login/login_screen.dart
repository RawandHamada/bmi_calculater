import 'package:bmi_calculater/shared/components/apptextfiled.dart';
import 'package:bmi_calculater/shared/components/compontes.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
var emailcontroller =TextEditingController();
var passwordcontroller =TextEditingController();
var formkey =GlobalKey<FormState>();
bool obscureText=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40.00),),
                    SizedBox(height: 40.00,),
                    AppTextFiled(
                        controller: emailcontroller,
                      labelText: 'Email Address',
                        prefix: Icons.email,
                      textInputType: TextInputType.visiblePassword,

                        /*validate:(String value){
                          if(value.isEmpty){
                            return 'Email address not be empty';
                          }
                        }*/
                    ),
                    SizedBox(height: 15.00,),
                    AppTextFiled(
                        controller: passwordcontroller,
                        obscureText: obscureText,
                        functionSuffixPressed:(){
                          setState(() {
                            obscureText=!obscureText;
                          });
                        } ,
                        prefix: Icons.lock,
                        suffix: obscureText ?Icons.visibility :Icons.visibility_off,
                      textInputType: TextInputType.visiblePassword,
                      // onTap:( value){
                      //     if(value.isEmpty){
                      //       return 'password not be empty';
                      //     }
                      //   }
                          labelText: 'Password',
                        ),
                    SizedBox(height: 20.00,),
                    defaultButton(
                      isUseUpr: false,
                      text: 'LOgin',
                      background: Colors.blue,
                      width: double.infinity,
                        onPressed: (){
                        if(formkey.currentState!.validate()){
                          print(emailcontroller.text);
                          print(passwordcontroller.text);

                        }

                        }
                    ),
                    SizedBox(height: 10.00,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?',),
                       TextButton(onPressed: (){}, child: Text('Register Now'),),

                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
