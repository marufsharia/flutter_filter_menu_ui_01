import 'package:flutter/material.dart';
import 'package:flutter_filter_menu_ui_01/dialogonal_clipper.dart';
import 'package:flutter_filter_menu_ui_01/list_model.dart';
import 'package:flutter_filter_menu_ui_01/task.dart';
import 'package:flutter_filter_menu_ui_01/task_row.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _imageHeight = 256.0;
  final GlobalKey<AnimatedListState> _listKey =new GlobalKey<AnimatedListState>();
  ListModel listModel;

  List<Task> tasks = [
    new Task(
        name: "Catch up with Brian",
        category: "Mobile Project",
        time: "5pm",
        color: Colors.orange,
        completed: false),
    new Task(
        name: "Make new icons",
        category: "Web App",
        time: "3pm",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Design explorations",
        category: "Company Website",
        time: "2pm",
        color: Colors.pink,
        completed: false),
    new Task(
        name: "Lunch with Mary",
        category: "Grill House",
        time: "12pm",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Teem Meeting",
        category: "Hangouts",
        time: "10am",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Teem Meeting",
        category: "Hangouts",
        time: "10am",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Teem Meeting",
        category: "Hangouts",
        time: "10am",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Teem Meeting",
        category: "Hangouts",
        time: "10am",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Teem Meeting",
        category: "Hangouts",
        time: "10am",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Teem Meeting",
        category: "Hangouts",
        time: "10am",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Teem Meeting",
        category: "Hangouts",
        time: "10am",
        color: Colors.cyan,
        completed: true),
  ];

  void initState() {
    super.initState();
    listModel = new ListModel(_listKey, tasks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildTimeline(),
          _buildImage(),
          _buildTopHeader(),
          _buildProfileRow(),
          _bulidBottomPart(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Positioned.fill(
      bottom: null,
      child: ClipPath(
        clipper: DialogonalClipper(),
        child: Image.asset('images/bg.jpg',
            fit: BoxFit.cover,
            height: _imageHeight,
            colorBlendMode: BlendMode.srcOver,
            color: Color.fromARGB(120, 20, 10, 40)),
      ),
    );
  }

  Widget _buildTopHeader() {
    return new Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 32.0,
      ),
      child: new Row(
        children: <Widget>[
          new Icon(
            Icons.menu,
            size: 32.0,
            color: Colors.white,
          ),
          new Expanded(
            child: new Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
              ),
              child: new Text(
                "Timeline",
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          new Icon(
            Icons.linear_scale,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileRow() {
    return Padding(
      padding: new EdgeInsets.only(
        left: 16.0,
        top: _imageHeight / 2.5,
      ),
      child: Row(children: <Widget>[
        CircleAvatar(
          minRadius: 28.0,
          maxRadius: 28.0,
          backgroundImage: AssetImage('images/profile.jpeg'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Parvez Islam",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Managing Director",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _bulidBottomPart() {
    return Padding(
      padding: new EdgeInsets.only(top: _imageHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulidMyTasksHeader(),
          _bulidTaskList(),
        ],
      ),
    );
  }

  Widget _bulidTaskList() {
    return Expanded(
      child: new AnimatedList(
          initialItemCount: tasks.length,
          key: _listKey,
          itemBuilder: (context, index, animation) {
            return new TaskRow(
              task: listModel[index],
            );
          }),
    );
  }

  Widget _bulidMyTasksHeader() {
    return Padding(
      padding: new EdgeInsets.only(left: 64.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "My Task List",
            style: TextStyle(
              color: Colors.black,
              fontSize: 32.0,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            "Fer-20-2020",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    return Positioned(
      top: 0.0,
      bottom: 0.0,
      left: 32.0,
      child: Container(
        width: 1.0,
        color: Colors.grey[300],
      ),
    );
  }
}
