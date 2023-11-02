import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 238, 240),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          iconSize: 28,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.line_style_outlined), label: 'Drawer'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.verified_user), label: 'Profile'),
          ]),
      body: Column(children: [
        Align(
          alignment: Alignment.topLeft,
          child: CircleAvatar(
            radius: 70,
            backgroundColor: Color.fromARGB(255, 158, 204, 242),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios),
              SizedBox(
                width: 130,
              ),
              Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                Icons.photo_size_select_actual_rounded,
                size: 40,
                color: Colors.blue,
              ),
              SizedBox(
                width: 40,
              ),
              Column(
                children: [
                  Text(
                    'Roshan Kumar Khadka',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    'khadkaroshan@gmail.com',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 235, 154, 154)),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 100,
          width: 400,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 178, 220, 222),
              borderRadius: BorderRadius.circular(20)),
          child: Row(children: [
            Icon(
              Icons.picture_as_pdf_sharp,
              color: Colors.red,
              size: 80,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text(
                    'Upload your Resume',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Please make sure to upload \n your resume in PDF format',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 71, 130, 139)),
                ),
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Icon(
              Icons.edit,
              size: 40,
            )
          ]),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Agent Information',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 120,
          width: 400,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 178, 220, 222),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    'Company',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.arrow_right),
                  Text(
                    'Apple Inc',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(140, 0, 0, 0),
                      child: Icon(
                        Icons.edit,
                        size: 30,
                      ))
                ],
              ),
              Row(
                children: [
                  Text(
                    'Salary',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Icon(Icons.arrow_right),
                  Text(
                    '50K per Month',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'Address',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(Icons.arrow_right),
                  Text(
                    'Nepalgunj, Karkando',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ]),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Row(
            children: [
              Text(
                'Skills',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                width: 30,
              ),
              Icon(
                Icons.add,
                size: 30,
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 178, 220, 222),
                    borderRadius: BorderRadius.circular(20)),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Flutter',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 178, 220, 222),
                    borderRadius: BorderRadius.circular(20)),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'NodeJS',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                height: 35,
                width: 130,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 178, 220, 222),
                    borderRadius: BorderRadius.circular(20)),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Data Analyst',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 250, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, minimumSize: Size(150, 50)),
              onPressed: () {},
              child: Text(
                'Log Out',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ))
      ]),
    );
  }
}
