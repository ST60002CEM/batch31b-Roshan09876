import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Align(
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Color.fromARGB(255, 158, 204, 242),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(
                  Icons.line_style_outlined,
                  size: 45,
                ),
                SizedBox(
                  width: 280,
                ),
                Icon(
                  Icons.supervised_user_circle_outlined,
                  size: 45,
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Search \n Find & Apply',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.red),
              )),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 200, 216, 217),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
                hintText: 'Search for Job'),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'Popular Jobs',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red),
              ),
              SizedBox(
                width: 220,
              ),
              Icon(
                Icons.add_box,
                size: 30,
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height: 200,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 178, 220, 222),
                      borderRadius: BorderRadius.circular(18)),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(children: [
                      Row(
                        children: [
                          Icon(
                            Icons.apple,
                            size: 50,
                            color: Color.fromARGB(255, 52, 69, 112),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Apple',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        ' Flutter Full - Stack \n          Developer',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            '  50K per month',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.next_plan,
                            size: 30,
                          )
                        ],
                      )
                    ]),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 200,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 178, 220, 222),
                      borderRadius: BorderRadius.circular(18)),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(children: [
                      Row(
                        children: [
                          Icon(
                            Icons.window,
                            size: 50,
                            color: Color.fromARGB(255, 52, 69, 112),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 130,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Windows',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        ' Java Backend \n     Developer',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            '  80K per month',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.next_plan,
                            size: 30,
                          )
                        ],
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'Recently Posted',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red),
              ),
              SizedBox(
                width: 180,
              ),
              Icon(
                Icons.recommend,
                size: 40,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 280,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 178, 220, 222),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.telegram,
                        color: Colors.blue,
                        size: 60,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '   Telegram \n Backend Developer',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 80,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 178, 220, 222),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.photo_album,
                        color: Colors.red,
                        size: 60,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '   Unsplash \n Data Scientist',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}