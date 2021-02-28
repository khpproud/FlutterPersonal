import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 100,
            child: Text('Item 1 - pretty big!'),
            color: Colors.green,
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 100,
              child: Text('Item 2'),
              color: Colors.amber,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              child: Text('Item 3'),
              color: Colors.purple,
            ),
          )
        ],
      ),
    );
  }
}
