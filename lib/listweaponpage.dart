import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'detailweaponpage.dart';

class ListWeaponPage extends StatefulWidget {
  const ListWeaponPage({Key? key}) : super(key: key);

  @override
  State<ListWeaponPage> createState() => _ListWeaponPageState();
}

class _ListWeaponPageState extends State<ListWeaponPage> {
  @override
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
          "https://api.genshin.dev/weapons"));
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
        title: Text('List Weapon'),
      ),
      body: ListView.builder(
          itemCount: _get.length,
          itemBuilder:(context, index){
            return ListTile(
              leading: Container(
                color: Colors.grey[200],
                height: 100,
                width: 100,
                child: Image.network(
                  'https://api.genshin.dev/weapons/${_get[index]}/icon',
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                '${_get[index]}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) => DetailWeaponPage(
                      weapon: _get[index],

                    ),
                  ),
                );
              },
            );
          }
      )
    );
}
}
