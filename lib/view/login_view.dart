import 'package:flutter/material.dart';
import 'package:job_finder/app/routes/bottom_nav.dart';
import 'package:job_finder/view/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _obsecuretext = true;

  final key = GlobalKey<FormState>();
  final firstcontroller = TextEditingController();
  final secondcotroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 238, 240),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: key,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(50),
                child: Container(
                  height: 95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/images/loginimg.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              Text(
                'Welcome ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Fill the below fields for Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: firstcontroller,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    labelText: 'E-mail',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter your Email';
                  } else if (value.length < 6) {
                    return 'Please Enter at lease 6 character';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: secondcotroller,
                obscureText: _obsecuretext,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.black,
                    ),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obsecuretext = !_obsecuretext;
                        });
                      },
                      child: Icon(
                        _obsecuretext ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                      ),
                    )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Plaser Enter you Password';
                  } else if (value.length < 6) {
                    return 'Please enter at lease six character';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 60),
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BottomNav()));
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpView())),
                child: Text(
                  "Don't have an account? SignUp",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
