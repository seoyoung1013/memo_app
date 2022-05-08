import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memomemo/database/db.dart';
import 'package:memomemo/database/memo.dart';
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
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: Text('MemoMemo',
                  style: TextStyle(fontSize: 36, color: Colors.blue))),
          Expanded(child: memoBulider())
        ],
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

  List<Widget> LoadMemo() {
    //반환값은 List<Widget>임
    List<Widget> memoList = [];
    memoList.add(Container(
      color: Colors.purpleAccent, //Accent는 원색보다 더 밝은것을 뜻함
      height: 100,
    ));

    return memoList;
  }

  Future<List<Memo>> loadMemo() async {
    DBHelper sd = DBHelper();
    return await sd.memos();
  }

  Widget memoBulider() {
    return FutureBuilder(
      builder: (context, Snap) {
        if ((Snap.data as List).isEmpty) {
          return Container(child: Text("메모를 지금 바로 추가해보세요!"));
        }
        return ListView.builder(
          itemCount: (Snap.data as List).length,
          itemBuilder: (context, index) {
            Memo memo = (Snap.data as List)[index];
            return Column(
              children: <Widget>[
                Text(memo.title),
                Text(memo.text),
                Text(memo.createTime),
                // Widget to display the list of project
              ],
            );
          },
        );
      },
      future: loadMemo(),
    );
  }
}
