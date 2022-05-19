import 'package:custom_top_navigator/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wordpress_api_get_post/screens/categorypost.dart';
import 'package:flutter_wordpress_api_get_post/screens/latestpost.dart';
import 'package:flutter_wordpress_api_get_post/screens/photos.dart';
import 'package:flutter_wordpress_api_get_post/screens/catalog.dart';


class MainTab extends StatefulWidget {
  MainTab({Key? key}) : super(key: key);

  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {

  final List<Widget> _widgetOptions = [
    LatestPost(),
    CategoryPost(),
    Catalog(),
    Search()
  ];
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  void _onItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScaffold(
        children: _widgetOptions,
        onItemTap: _onItemSelected,
        scaffold: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          body: Center(
            child: _widgetOptions.elementAt(_currentIndex),
          ),
          bottomNavigationBar: bottomNavigationBar(),
        ),
      ),
    );
  }
  Widget bottomNavigationBar(){
    return BottomNavigationBar(
      unselectedItemColor: Colors.grey,
      selectedItemColor: Theme.of(context).iconTheme.color,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: _onItemSelected,
      backgroundColor: Theme.of(context).primaryColor,
      iconSize: 27,
      items: iconLabels.map((iconLabel) => item(iconLabel,iconLabels.indexOf(iconLabel)==_currentIndex)).toList(),
    );
  }

  BottomNavigationBarItem item(IconLabel iconLabel,bool selected){
    return BottomNavigationBarItem(
      backgroundColor: Theme.of(context).primaryColor,
      activeIcon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          indicator(selected),
          Icon(iconLabel.icon1)
        ],
      ),
      icon: Icon(iconLabel.icon),
      title: Text(iconLabel.label),
    );
  }

  Widget indicator(bool selected){
    Color color = selected? Colors.deepPurple: Colors.transparent;
    return Container(
      margin: const EdgeInsets.only(top: 0,bottom: 0),
      height: 2.5, // selected? 2.5:0, let us keep it as fixed
      width: selected? 60:0,
      decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: color,
              blurRadius: 2.25,
              spreadRadius:0,
            ),
          ]
      ),
    );
  }
  static   List<IconLabel> iconLabels = [
    IconLabel( Icons.home_outlined, "Home",Icons.home),
    IconLabel( Icons.flare_outlined, "Life Style",Icons.flare),
    IconLabel( Icons.widgets_outlined, "Categories",Icons.widgets),
    IconLabel( Icons.search_rounded, "Search",Icons.search),
  ];
}
class IconLabel {
  final IconData icon;
  final String label;
  final IconData icon1;

  IconLabel(this.icon, this.label, this.icon1);
}