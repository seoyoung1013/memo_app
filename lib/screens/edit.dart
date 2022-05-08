import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memomemo/database/db.dart';
import '../database/memo.dart';

import 'package:crypto/crypto.dart';
import 'dart:convert'; //for the utf8.encode method

class EditPage extends StatelessWidget {
  String title = '';
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          IconButton(onPressed: saveDB, icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10), //양 쪽 간격 설정
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (String title) {
                this.title = title;
              },
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              keyboardType: TextInputType.multiline, //아래 주석과 동일
              maxLines: null, // 글자 칸을 일정하게 주고, 넘어가면 그 다음줄로 내려가게 설정해줌
              // obscureText: true, => 글을 쓰면 * 으로 나타남
              decoration: InputDecoration(
                //border: OutlineInputBorder(), -> 박스 그려줌
                hintText: '메모의 제목을 적어주세요.',
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              onChanged: (String text) {
                this.text = text;
              },
              keyboardType: TextInputType.multiline,
              maxLines: null,
              // obscureText: true, => 글을 쓰면 * 으로 나타남
              decoration: InputDecoration(
                //border: OutlineInputBorder(), -> 박스 그려줌
                hintText: '메모의 내용을 적어주세요.',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveDB() async {
    DBHelper sd = DBHelper();

    var fido = Memo(
      id: Str2sha512(DateTime.now().toString()),
      title: this.title,
      text: this.text,
      createTime: DateTime.now().toString(),
      editTime: DateTime.now().toString(),
    );

    await sd.insertMemo(fido);

    print(await sd.memos());
  }

  String Str2sha512(String text) {
    var bytes = utf8.encode(text); // data being hashed
    var digest = sha512.convert(bytes);

    return digest.toString();
  }
}
