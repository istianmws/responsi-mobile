import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:untitled1/detailkarakter.dart';

class ListKarakterPage extends StatefulWidget {
  const ListKarakterPage({Key? key}) : super(key: key);

  @override
  State<ListKarakterPage> createState() => _ListKarakterPageState();
}

class _ListKarakterPageState extends State<ListKarakterPage> {
  List _get = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://api.genshin.dev/characters/"));
      // return jsonDecode(response.body);

      // untuk cek data
      if (response.statusCode == 200) {
        //print(response.body);
        final data = jsonDecode(response.body);
        setState(() {
          _get = data;

        });
      }
    } catch (e) {
      print(e);
    }
  }
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Karakter'),
      ),
      body:ListView.builder(
        padding: EdgeInsets.all(10),
          itemCount: _get.length,
          itemBuilder:(context, index){

            return Card(
              margin: EdgeInsets.only(top: 10),
              child: ListTile(
                leading: Container(
                  //color: Colors.grey[200],
                  child: Container(
                    //margin: EdgeInsets.only(right: 10, left: 10),
                    child: Image.network(

                      'https://api.genshin.dev/characters/${_get[index]}/icon',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                title: Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    '${_get[index]}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) => DetailKarakterPage(
                        karakter: _get[index],

                      ),
                    ),
                  );
                },
              ),
            );
          }
      )
    );
  }
}

