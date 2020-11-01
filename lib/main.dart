import 'package:final_app/helper/authenticate.dart';
import 'package:final_app/helper/helperfunctions.dart';
import 'package:final_app/views/chatRoomsScreen.dart';
import 'package:final_app/views/conversation_screen.dart';
import 'package:final_app/views/search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn = false;
  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState()async{
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn = value;
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff145C9E),
        scaffoldBackgroundColor: Color(0xff1F1F1F),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: userIsLoggedIn? ChatRoom(): Authenticate(),
    );
  }
}
/*
ConversationScreen(getChatRoomId("name", "sendBy"))
 */