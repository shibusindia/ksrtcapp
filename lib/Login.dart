
import 'package:ksrtcapp/collapisingbar.dart';
import 'package:ksrtcapp/tab.dart';

import 'theme.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget{ 
  final Key key;
  const Login({  this.key }):super( key:key);
  State<StatefulWidget>createState()=>_LoginState();
}
class _LoginState extends State<Login>
with SingleTickerProviderStateMixin{
  TabController _tabController;
  
  final _ktabp =<Widget>[
  Center(child:Tabs()),
  Center(child:Icon(Icons.notifications,size:55.0,color:Colors.blue)),
  Center(child:Icon(Icons.person,size:55.0,color:Colors.blue)),
  ];
  static const _ktabs=<Tab>[
    Tab(icon:Icon(Icons.home),text:'Home'),
    Tab(icon:Icon(Icons.notifications),text:'Notifications'),
    Tab(icon:Icon(Icons.person),text:'Profile'),
  ];
  @override
  void initState(){
    super.initState();
    _tabController=TabController(
      length: _ktabp.length,
      vsync: this,
    );
  }
  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 80.0,
        backgroundColor: selectedColor,
        title: Text("                      KSRTC",)
        ),
        endDrawer:CollapsingNavigationDrawer(),
      body:TabBarView(
        children:_ktabp,
        controller: _tabController,
      ),
      bottomNavigationBar:Material(
        color: selectedColor,
        child: TabBar(
          tabs:_ktabs,
          controller: _tabController,
        ),
      ),
    );
  }
}