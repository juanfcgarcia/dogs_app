import 'package:flutter/material.dart';
import 'package:dogs/services/auth_services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final tabs = [
    Center(child: Text('Adopta')),
    Center(child: Text('Reportes')),
    Center(child: Text('Publicar')),
    Center(child: Text('Fundaciones')),
    Center(child: Text('Tips'))
  ];

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final user = authService.user;

    return Scaffold(
      appBar: AppBar(
        title: Text(user.nombre, style: TextStyle(color: Colors.black87)),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app, color: Colors.black87),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'login');
            AuthService.deleteToken();
          },
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.blue[400]),
            // child: Icon( Icons.offline_bolt, color: Colors.red ),
          )
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 15,
        unselectedFontSize: 13,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.format_align_center),
            title: Text('Adopta'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text('Reportes'),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            title: Text('Publicar'),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Fundaciones'),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            title: Text('Tips'),
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
