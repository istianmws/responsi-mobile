import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailKarakterPage extends StatefulWidget {
  final String karakter;
  const DetailKarakterPage({Key? key, required this.karakter}) : super(key: key);

  @override
  State<DetailKarakterPage> createState() => _DetailKarakterPageState();
}

class _DetailKarakterPageState extends State<DetailKarakterPage> {
  Map _get = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://api.genshin.dev/characters/${widget.karakter}"));
      // return jsonDecode(response.body);

      // untuk cek data
      if (response.statusCode == 200) {
        //print(response.body);
        final data = jsonDecode(response.body);
        debugPrint(response.body);
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
      //backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Detail" " ${widget.karakter}"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              child: Image.network("https://api.genshin.dev/characters/${widget.karakter}/gacha-splash"),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                    child: Image.network("https://api.genshin.dev/nations/${_get['nation'].toLowerCase()}/icon"),
                  ),
                  SizedBox(
                    child: Image.network(
                      "https://api.genshin.dev/elements/${_get['vision'].toLowerCase()}/icon",
                      height: 30,
                    ),
                  ),
                  Text(
                    widget.karakter.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
