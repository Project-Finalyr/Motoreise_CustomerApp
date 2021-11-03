//import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motoreise_app/BookingScreen.dart';
import 'package:motoreise_app/MessageScreen.dart';
import 'package:motoreise_app/ProfileScreen.dart';
import 'package:motoreise_app/authentications.dart';
import 'package:motoreise_app/main.dart';

class HomePage extends StatefulWidget {
  final String uid;
  final String mail;

  HomePage({Key key, @required this.uid,@required this.mail}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState(uid,mail);
}

class _HomePageState extends State<HomePage> {

  final String uid;
  final String mail;
  _HomePageState(this.uid,this.mail);


   int selectedPage = 0;

  final _pageOptions = [
    HomeScreen(),
    BookingScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,

      appBar: AppBar(
          backgroundColor: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.orange),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.notifications,color: Colors.orange,size: 25.0,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //builder: (context) => LoginPage(),
                  ),
                );
              }
          )
        ],
      ),
      drawer:Drawer(child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new Container(
              height: 280.0,

              child: Column(
                children: <Widget>[
                  new DrawerHeader(

                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: FlatButton(
                          onPressed: () {

                          },

                          child: new Icon(
                            Icons.account_box,
                            color: Colors.white,
                            size: 150.0,
                          ),
                          shape: new CircleBorder(),
                          color: Colors.orangeAccent,

                        ),
                      ),

                  ),
                  SizedBox(height: 15,),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),

                        child: Text('Email :-  '+mail.toString(),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        ),

                    ),
                  )
                ],
              ),
              color:Colors.orangeAccent),
          SizedBox(height: 4.0),

          ListTile(
            leading: Icon(Icons.contact_mail,color: Colors.black,size: 25.0,),
            title: Text('Contact us',
              style: TextStyle(
                fontSize: 18.0,
              ),),
            onTap: () {

            },
          ),

          SizedBox(height: 6.0),
          ListTile(
            leading: Icon(Icons.power_settings_new,color: Colors.black,size: 25.0,),
            title: Text('Log Out',
              style: TextStyle(
                fontSize: 18.0,
              ),),
            onTap: () =>signOutUser().then((value) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage1()),
                      (Route<dynamic> route) => false);
            }),
          ),


        ],
      ),
      ),
      body: _pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(

        elevation: 1.0,
        backgroundColor: Colors.orangeAccent,
        type: BottomNavigationBarType.fixed,

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            
            icon: Icon(Icons.home,color: Colors.white,),
            title: Text('Home',
            style: TextStyle(
              color: Colors.white,
            ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book,color: Colors.white,),
            title: Text('Bookings',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message,color: Colors.white,),
            title: Text('Message',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,color: Colors.white,),
            title: Text('Profile',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
//        selectedItemColor: Colors.black,
//        unselectedItemColor: Colors.white,
        currentIndex: selectedPage,
        onTap: (index){
          setState(() {
            selectedPage = index;
          });
        },
      ),








    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> options = <String>['FC road - Pune,1135, Maharashtra, India', 'Two', 'Free', 'Four'];
  String dropdownValue = 'FC road - Pune,1135, Maharashtra, India';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,1.0,8.0,8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width* 1.00,

                  child: DropdownButtonFormField<String>(
                    isExpanded: true,

                    iconEnabledColor: Colors.white,

                    decoration: InputDecoration(

                      prefixIcon:  Icon(Icons.location_on,color: Colors.white,size: 30.0),

                    ),

                    value: dropdownValue,
                    onChanged:(String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    style: const TextStyle(color: Colors.orange),
                    selectedItemBuilder: (BuildContext context) {
                      return options.map((String value) {
                        return Center(
                          child: Text(
                            dropdownValue,
                            style: const TextStyle(color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        );
                      }).toList();
                    },
                    items: options.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0,5.0,15.0,8.0),
                child: Container(
                    width: MediaQuery.of(context).size.width* 1.00,
                    height: 50,
                    child: TextField(
                      //onChanged: onTextChange,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(Icons.search, color: Colors.black,size: 25,),
                            hintText: 'Search for Activities and packages',
                            hintStyle: TextStyle(
                              fontSize: 12.0,

                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.zero
                        )
                    )
                ),
              ),

              SizedBox(height: 200,),
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,

                  ),
                  children: [
                    Center(
                      child: ListTile(
                        title: FaIcon(FontAwesomeIcons.biking,color: Colors.orange,size: 25),

                        subtitle: Text('Biking in India',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                          ),),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //builder: (context) => Aboutus(),
                            ),
                          );
                        },
                      ),
                    ),
                    Center(
                      child: ListTile(
                        title: FaIcon(FontAwesomeIcons.car,color: Colors.orange,size: 25),
                        subtitle: Text('Car trips in India',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                          ),),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //builder: (context) => Aboutus(),
                            ),
                          );
                        },
                      ),
                    ),
                    Center(
                      child: ListTile(
                        title: FaIcon(FontAwesomeIcons.biking,color: Colors.orange,size: 25),
                        subtitle: Text('International Biking',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                          ),),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //builder: (context) => Aboutus(),
                            ),
                          );
                        },
                      ),
                    ),Center(
                      child: ListTile(
                        title: FaIcon(FontAwesomeIcons.car,color: Colors.orange,size: 25),
                        subtitle: Text('International Car trips',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                          ),),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //builder: (context) => Aboutus(),
                            ),
                          );
                        },
                      ),
                    ),Center(
                      child: ListTile(
                        title: FaIcon(FontAwesomeIcons.water,color: Colors.orange,size: 25),
                        subtitle: Text('Rafting',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                          ),),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //builder: (context) => Aboutus(),
                            ),
                          );
                        },
                      ),
                    ),Center(
                      child: ListTile(
                        title: FaIcon(FontAwesomeIcons.bicycle,color: Colors.orange,size: 25),
                        subtitle: Text('Cycling',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                          ),),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //builder: (context) => Aboutus(),
                            ),
                          );
                        },
                      ),
                    ),Center(
                      child: ListTile(
                        title: FaIcon(FontAwesomeIcons.mountain,color: Colors.orange,size: 25),
                        subtitle: Text('Trekking',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                          ),),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //builder: (context) => Aboutus(),
                            ),
                          );
                        },
                      ),
                    ),Center(
                      child: ListTile(
                        title: FaIcon(FontAwesomeIcons.parachuteBox,color: Colors.orange,size: 25),
                        subtitle: Text('Paragliding',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                          ),),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //builder: (context) => Aboutus(),
                            ),
                          );
                        },
                      ),
                    ),Center(
                      child: ListTile(
                        title: FaIcon(FontAwesomeIcons.tripadvisor,color: Colors.orange,size: 25),
                        subtitle: Text('Customized Trips',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                          ),),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //builder: (context) => Aboutus(),
                            ),
                          );
                        },
                      ),
                    ),Center(
                      child: ListTile(
                        title: FaIcon(FontAwesomeIcons.tree,color: Colors.orange,size: 25),
                        subtitle: Text('Wildlife Trips',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                          ),),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //builder: (context) => Aboutus(),
                            ),
                          );
                        },
                      ),
                    ),Center(
                      child: ListTile(
                        title: FaIcon(FontAwesomeIcons.planeDeparture,color: Colors.orange,size: 25),
                        subtitle: Text('Gliding & Flying',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                          ),),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //builder: (context) => Aboutus(),
                            ),
                          );
                        },
                      ),
                    ),Center(
                      child: ListTile(
                        title: FaIcon(FontAwesomeIcons.skyatlas,color: Colors.orange,size: 25),
                        subtitle: Text('Skydiving',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                          ),),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //builder: (context) => Aboutus(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),



            ],


          ),

        ),

      ),
    );
  }
}

