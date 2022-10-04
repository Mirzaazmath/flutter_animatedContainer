

import 'package:flutter/material.dart';
void main(){
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with TickerProviderStateMixin {
  late AnimationController _controller;
  bool isclicked=false;
  double turns=0.0;
  Color customcolor=Color.fromARGB(255,237,237,237);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(duration: Duration(milliseconds: 800),vsync: this);
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customcolor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: AnimatedRotation(
          turns: turns,
          curve: Curves.easeInExpo,
          duration: Duration(milliseconds: 700),
          child: GestureDetector(
            onTap: (){
              if(isclicked){
                setState(() {
                  turns -=1/4;
                  _controller.reverse();
                  isclicked=!isclicked;
                });
              }else{
                setState(() {
                  turns +=1/4;
                  _controller.forward();
                  isclicked=!isclicked;
                });


              }
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),

              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(20),
                boxShadow:  [
                  BoxShadow(
                    blurRadius: 30,
                    offset: isclicked? Offset(20,-20):Offset(20,20),
                    color: Colors.grey
                  ),
                  BoxShadow(
                      blurRadius: 30,
                      offset:isclicked? Offset(-20,20):Offset(-20,-20),
                      color:Theme.of(context).primaryColor
                  )
                ],


                color:customcolor
              ),
              child: SizedBox(
                height: 150,
                width: 150,
                child: Center(
                  child: AnimatedIcon(
                    progress: _controller,
                  size: 100,
                  icon: AnimatedIcons.menu_close,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
