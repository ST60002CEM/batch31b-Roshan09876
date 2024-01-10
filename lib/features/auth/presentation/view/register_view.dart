import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_finder/config/constant/height_spacer.dart';
import 'package:job_finder/config/constant/reusable_text.dart';
import 'package:job_finder/features/auth/domain/entity/auth_entity.dart';
import 'package:job_finder/features/auth/presentation/view/login_view.dart';
import 'package:job_finder/config/constant/app_constants.dart';
import 'package:job_finder/features/auth/presentation/view_model/auth_view_model.dart';

class RegisterView extends ConsumerStatefulWidget {
  RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  bool _obsecuretext = true;

  final _key = GlobalKey<FormState>();

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final emailController = TextEditingController();

  final password = TextEditingController();

  final _gap = HeightSpacer(size: 10.h);

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
              child: SingleChildScrollView(
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
                    _gap,
                    ReusableText(
                        text: 'Hello, Welcome',
                        fontSize: 40,
                        color: Color(kDark.value)),
                    _gap,
                    ReusableText(
                        text: 'Fill the below fields for SignUp',
                        fontSize: 25,
                        color: Color(kDark.value)),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.text_increase_outlined,
                            color: Color(kDark.value),
                          ),
                          labelText: 'FirstName',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your FirstName';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.text_increase_outlined,
                            color: Color(kDark.value),
                          ),
                          labelText: 'LastName',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your LastName';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: emailController,
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
                      controller: password,
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
                                  ? Icons.visibility_off
                                  : Icons.visibility,
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
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(kDarkPurple.value),
                            minimumSize: Size(200, 60)),
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            final userData = AuthEntity(
                                firstName: firstNameController.text.trim(),
                                lastName: lastNameController.text.trim(),
                                email: emailController.text.trim(),
                                password: password.text.trim());
                            ref
                                .read(authViewModelProvider.notifier)
                                .signUpFreelancer(userData);
                          }
                        },
                        child: ReusableText(
                          text: 'Sign Up',
                          fontSize: 20,
                          color: Color(kLight.value),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginView()));
                        },
                        child: ReusableText(
                          color: Color(kDark.value),
                          fontSize: 15,
                          text: 'Already have an account? Login',
                        )),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
