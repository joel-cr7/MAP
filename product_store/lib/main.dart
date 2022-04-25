import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Display Page'),
      initialRoute: '/',
      routes: {'/menu': (context) => Menu()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Image.asset("assets/images/bookstore.jpg")],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/menu"),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Menu extends StatelessWidget {

  var myList = [["book1","assets/images/bookstore.jpg","50 Rs."],
    ["book2","assets/images/bookstore.jpg","100 Rs."],
    ["book3","assets/images/bookstore.jpg","150 Rs."],
    ["book4","assets/images/bookstore.jpg","70 Rs."],
    ["book5","assets/images/bookstore.jpg","500 Rs."],
    ["book6","assets/images/bookstore.jpg","100 Rs."],
    ["book7","assets/images/bookstore.jpg","50 Rs."]];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Page"),
      ),
      body: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
            height: 150,
            width: double.maxFinite,
            child: Card(
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(myList[index][0]),
                    const SizedBox(height: 10,),
                    Text(myList[index][2])
                  ],
                ),
                leading: Container(
                    height: 55,
                    width: 55,
                    child: Image.asset(myList[index][1])
                ),
              ),
              elevation: 5,
            ),
          );
        }),
    );
  }
}