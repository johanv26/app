import 'package:app_login_ui/User/bloc/bloc_user.dart';
import 'package:app_login_ui/screens/get_rss.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_login_ui/User/widgets/profile_account_settings.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:app_login_ui/User/widgets/user_appbar.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _selectedIndex = 0;
  UserBloc userBloc; //OBject with the user info
  final List<Widget> widgetsChildren = [
    BlocProvider<UserBloc>(child: AccountSettings(), bloc: UserBloc()),
    AccountSettings2(),
    AccountSettings2(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      body: widgetsChildren[_selectedIndex],
      appBar: PreferredSize(
        child: BlocProvider<UserBloc>(child: UserAppBar(), bloc: UserBloc()),
        preferredSize: Size.fromHeight(100),
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
