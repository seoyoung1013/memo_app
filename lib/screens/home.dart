import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'edit.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times: '),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          //.extended = 확장된 기능을 불러옴
          onPressed: () {
            Navigator.push(
                //Navigator 란 길을 안내해주는 역할, push = 이동
                context, //관련된 것을 함께 넘겨줘야함
                CupertinoPageRoute(
                    builder: (context) =>
                        EditPage()) //어디에서 어디로 넘어갈지 경로 설정 (현재 페이지에서 edit.dart의 EditPage()로 이동)
                );
          },
          tooltip: '노트를 추가하려면 클릭하세요',
          label: Text('메모 추가'), //그림에 글자 추가
          icon: Icon(Icons.add) //+ 그림 추가
          ),
    );
  }
}
