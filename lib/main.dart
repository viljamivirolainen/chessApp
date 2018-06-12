import 'package:flutter/material.dart';
import "package:chess/chess.dart" as chessModel;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Chess',
      home: new ChessBoard(title: 'Chess'),
    );
  }
}

class ChessBoard extends StatefulWidget {
  ChessBoard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChessBoardState createState() => new _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  chessModel.Chess _chess = chessModel.Chess();

  Widget _buildBoard() {
    return Text(_chess.generate_fen());
  }

  void _makeMove() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // so that the display can reflect the updated values. If we changed
      // _chess without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      var moves = _chess.moves();
      moves.shuffle();
      var move = moves[0];
      _chess.move(move);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the ChessBoard object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _buildBoard(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _makeMove,
        tooltip: 'Make a move',
        child: new Icon(Icons.play_arrow),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
