import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Detail" " ${widget.karakter.toCapitalized()}"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              child: Image.network("https://api.genshin.dev/characters/${widget.karakter}/gacha-splash"),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    child: Image.network("https://api.genshin.dev/nations/${_get['nation'].toLowerCase()}/icon"),
                  ),
                  SizedBox(
                    child: Image.network(
                      "https://api.genshin.dev/elements/${_get['vision'].toLowerCase()}/icon",
                      height: 50,
                    ),
                  ),
                  Text(
                    widget.karakter.toCapitalized(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(var i=0; i<_get['rarity']; i++)
                  //const IconStar(),
                    const Icon(Icons.star, color: Colors.white,),
                ],
              ),
            ),
            Center(
              child: Text(
                '${_get['affiliation']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                )
              ),
            ),
            Container(
              padding: EdgeInsets.all(7),
              child: Center(
                child: Text(
                  '${_get['description']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.network(
                      'https://api.genshin.dev/characters/${widget.karakter}/talent-na'
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    width: 300,
                    child: Text(
                      '${_get['skillTalents']['description']}'
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
