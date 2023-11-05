import 'package:flutter/material.dart';
import 'package:job_finder/app/routes/bottom_nav.dart';
import 'package:job_finder/view/login_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool _obsecuretext = true;

  final key = GlobalKey<FormState>();
  final firstcontroller = TextEditingController();
  final secondcontroller = TextEditingController();
  final thirdcontroller = TextEditingController();

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
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      image: DecorationImage(
                        image: AssetImage('assets/images/signup.png'),
                      )),
                ),
              ),
              Text(
                'Hello, Welcome!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Fill the below fields for SignUp',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: firstcontroller,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.text_increase_outlined,
                      color: Colors.black,
                    ),
                    labelText: 'Full Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Full Name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: secondcontroller,
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
                    return 'Please enter your Email';
                  } else if (!value.contains('@')) {
                    return '@ is missing in email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: thirdcontroller,
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
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must containe at least 6 letter';
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
                    'SignUp',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginView())),
                child: Text(
                  'Already have an account? Login',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
