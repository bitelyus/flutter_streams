import 'package:flutter/material.dart';
import 'package:streams/bloc/ContadoresBLoC.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  ContadoresBLoC _contadoresBLoC;

  @override
  void initState() {
    _contadoresBLoC = ContadoresBLoC();
    super.initState();
  }

  @override
  void dispose() {
    _contadoresBLoC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                _contadoresBLoC.embudoString.add("SOOOOME DATA!!");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.teal,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'FLUTTER STREAMS',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.green[50],
                  elevation: 5.0,
                  child: Column(
                    children: [
                      Text("STREAM DE INTS"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                _contadoresBLoC.agregarEntero();
                              },
                              icon: Icon(Icons.exposure_plus_1)),
                          IconButton(
                              onPressed: () {
                                _contadoresBLoC.restarEntero();
                              },
                              icon: Icon(Icons.exposure_minus_1)),
                        ],
                      ),
                      Text("AQUI STREAM DE INT"),
                      StreamBuilder<int>(
                          initialData: 0,
                          stream: _contadoresBLoC.enterosStream,
                          builder: (context, snapshotInt) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${snapshotInt.data.toString()}"),
                            );
                          }),
                    ],
                  ),
                ),
                Card(
                  color: Colors.red[50],
                  elevation: 5.0,
                  child: Column(
                    children: [
                      Text("STREAM DE INTS IMPARES"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                _contadoresBLoC.agregarEnteroImpar();
                              },
                              icon: Icon(Icons.exposure_plus_2)),
                          IconButton(
                              onPressed: () {
                                _contadoresBLoC.restarEnteroImpar();
                              },
                              icon: Icon(Icons.exposure_minus_2)),
                        ],
                      ),
                      Text("AQUI STREAM DE INT IMPARES"),
                      StreamBuilder<int>(
                          initialData: 1,
                          stream: _contadoresBLoC.enterosStreamImpar,
                          builder: (context, snapshotOdd) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${snapshotOdd.data.toString()}"),
                            );
                          }),
                    ],
                  ),
                ),
                Card(
                  color: Colors.blue[100],
                  elevation: 5.0,
                  child: Column(
                    children: [
                      Text("STREAM DE INTS PARES"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                _contadoresBLoC.agregarEnteroPar();
                              },
                              icon: Icon(Icons.exposure_plus_2)),
                          IconButton(
                              onPressed: () {
                                _contadoresBLoC.restarEnteroPar();
                              },
                              icon: Icon(Icons.exposure_minus_2)),
                        ],
                      ),
                      Text("AQUI STREAM DE INT PARES"),
                      StreamBuilder<int>(
                          initialData: 2,
                          stream: _contadoresBLoC.enterosStreamPar,
                          builder: (context, snapshotOdd) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${snapshotOdd.data.toString()}"),
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
            Divider(indent: 50,endIndent: 50,),
            Container(
              child: StreamBuilder<String>(
                initialData: "no data :(",
                stream: _contadoresBLoC.stringStream,
                builder: (context,snapshot) {
                  return Text("${snapshot.data}");
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: reset,
        tooltip: 'RESET',
        child: Icon(Icons.clear),
      ),
    );
  }

  void reset() {
    _contadoresBLoC.reset();
  }
}
