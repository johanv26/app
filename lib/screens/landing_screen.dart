import 'package:app_login_ui/screens/get_rss.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Container(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text('Hola  ',
                            style: TextStyle(
                            fontFamily: 'Monserrat',
                            fontStyle: FontStyle.normal,
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      Text('Juan',
                        style: TextStyle(
                          fontFamily: 'Monserrat',
                          fontStyle: FontStyle.normal,
                          color: Color(0xff1d976c),
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
        ),
        leading: Container(
          margin: EdgeInsets.only(left: 10.0, top:10.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://cdn.techinasia.com/wp-content/uploads/2016/02/pawel-netreba-bfab.jpg'),
          ),
        ),
      ),
      //body: ,

      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.accessibility),
                        title: Text('Perfil'),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.school),
                        title: Text('Mentorías'),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.description),
                        title: Text('Mis Ofertas'),
                      ),
                      ],
                      currentIndex: _selectedIndex,
                      selectedItemColor: Color(0xff1d976c),
                      onTap: _onItemTapped,
    ),
    );
  }
}


