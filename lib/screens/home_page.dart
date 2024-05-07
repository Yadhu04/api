import 'package:api/Provider/user_provider.dart';
import 'package:api/screens/chat_screen.dart';
import 'package:api/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> body = [ChatPage(), const ProfilePage()];
  int Selectedindex = 0;
  changeIndex(int index) {
    setState(() {
      Selectedindex = index;
    });

    print(Selectedindex);
  }

  @override
  void initState() {
    var data = Provider.of<UserProvider>(context, listen: false);
    // TODO: implement initState
    super.initState();
    data.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // var data = Provider.of<UserProvider>(  context, );
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chats'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            )
          ],
          currentIndex: Selectedindex,
          onTap: (value) {
            changeIndex(value);
          },
        ),
        body: body[Selectedindex],
      ),
    );
  }
}
