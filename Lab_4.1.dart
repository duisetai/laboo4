import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lab Work',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Lab'),
          bottom: TabBar(
            tabs: [
              Tab(text: "ListView"),
              Tab(text: "GridView"),
            ],
          ),
        ),
        drawer: MyDrawer(),
        body: TabBarView(
          children: [
            // Первый таб с ListView
            buildListView(),
            // Второй таб с GridView
            buildGridView(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showCustomSnackBar(context),
          child: Icon(Icons.message),
        ),
      ),
    );
  }

  // Метод для ListView
  Widget buildListView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item ${index + 1}'),
          subtitle: Text('Subtitle ${index + 1}'),
        );
      },
    );
  }

  // Метод для GridView
  Widget buildGridView() {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8),
          color: Colors.primaries[index % Colors.primaries.length],
          child: Center(
            child: Text(
              '${index + 1}',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // Метод для показа SnackBar
  void showCustomSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Hello, Flutter!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

// Виджет для Drawer
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Menu',
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
