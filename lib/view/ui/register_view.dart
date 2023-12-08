import 'package:flutter/material.dart';
import 'package:job_finder/view/ui/login_view.dart';
import 'package:job_finder/view/theme/app_constants.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _obsecuretext = true;

  final _key = GlobalKey<FormState>();

  final firstcontroller = TextEditingController();

  final secondcontroller = TextEditingController();

  final thirdcontroller = TextEditingController();

  final _gap = SizedBox(
    height: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login.png'), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(65),
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          image: DecorationImage(
                            image: AssetImage('assets/images/signup.png'),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Hello, Welcome!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  _gap,
                  Text(
                    'Fill the below fields for SignUp',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: firstcontroller,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.text_increase_outlined,
                          color: Color(kDark.value),
                        ),
                        labelText: 'Full Name',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your FullName';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: secondcontroller,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        labelText: 'Email',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your Email';
                      } else if (!value.contains('@')) {
                        return '@ is missing';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: thirdcontroller,
                    obscureText: _obsecuretext,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.password,
                          color: Color(kDark.value),
                        ),
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obsecuretext = !_obsecuretext;
                            });
                          },
                          child: Icon(
                            _obsecuretext
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(kDark.value),
                          ),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Password';
                      } else if (value.length < 6) {
                        return 'Password must containe 6 letters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(minimumSize: Size(200, 60)),
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginView()));
                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginView()));
                    },
                    child: Text(
                      'Already have an account? Login',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
