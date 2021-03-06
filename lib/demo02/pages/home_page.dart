import 'package:flutter/material.dart';
import 'package:flutter_app/demo02/pages/TabPage1.dart';
import 'package:flutter_app/demo02/pages/TabPage2.dart';
import 'package:flutter_app/demo02/pages/TabPage3.dart';
import 'package:flutter_app/demo02/pages/other_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();

}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{


//定义底部导航Tab
  TabController _bottomNavigation;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Danny"),
        backgroundColor: Colors.lightBlue,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text('Danny'),
                accountEmail: new Text('user@qq.com'),
              currentAccountPicture: new GestureDetector(
                onTap: () => debugPrint('current user'),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage('https://upload.jianshu.io/users/upload_avatars/7700793/dbcf94ba-9e63-4fcf-aa77-361644dd5a87?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
                ),
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  onTap: () => debugPrint('other user'),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage('https://upload.jianshu.io/users/upload_avatars/10878817/240ab127-e41b-496b-80d6-fc6c0c99f291?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
                  ),
                ),
                new GestureDetector(
                  onTap: () => debugPrint('other user'),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage('https://upload.jianshu.io/users/upload_avatars/8346438/e3e45f12-b3c2-45a1-95ac-a608fa3b8960?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
                  ),
                )
              ],
              decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new NetworkImage('https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg')
//                    image: new ExactAssetImage('images/lake.jpg')
                )
              ),
            ),
            new ListTile(
              title: new Text('First Page'),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new OtherPage('First Page')
                    )
                ) ;
              },
            ),
            new ListTile(
              title: new Text('Second Page'),
              trailing: new Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
//                  Navigator.of(context).pushNamed('/a');
                  Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new OtherPage('Second Page')
                      )
                  ) ;
                }
            ),
            new Divider(),
            new ListTile(
              title: new Text('Close'),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
//      body: new Center(
//        child:  new Text('HomePage',style: new TextStyle(fontSize: 35.0),),
//      ),
    body: new TabBarView(
      controller: _bottomNavigation,
        children: [
          new TabPage1(data: '参数值'),
          new TabPage2(),
          new TabPage3(),
    ]),
      bottomNavigationBar:  new Material(
        color: Colors.deepOrange,
        child: new TabBar(
            tabs: _bottomTabs,
          controller: _bottomNavigation,
          indicatorColor: Colors.white,
        ),
      ),
    );
  }

  //定义底部导航项目
  final List<Tab> _bottomTabs = <Tab>[
    new Tab(text: 'Home',icon: new Icon(Icons.home),),
    //icon和text的显示顺序已经内定，如需自定义，到child属性里面加吧
    new Tab(icon: new Icon(Icons.history),text: 'History',),
    new Tab(icon: new Icon(Icons.book),text: 'Book',),
  ];

  @override
  void initState() {
    super.initState();
    _bottomNavigation = new TabController(length: 3, vsync: this) ;
  }

  @override
  void dispose() {
    _bottomNavigation.dispose();
    super.dispose() ;
  }
}