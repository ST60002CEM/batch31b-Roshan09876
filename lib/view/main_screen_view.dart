import 'package:flutter/material.dart';
import 'package:job_finder/view/theme/app_constants.dart';

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 250),
      color: Color(kLight.value),
      child: Column(children: [
        SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.00),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                ClipOval(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/image3.jpeg'),
                            fit: BoxFit.cover)),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
