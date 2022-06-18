import 'package:flutter/material.dart';

class DetailKarakterPage extends StatefulWidget {
  final String karakter;
  const DetailKarakterPage({Key? key, required this.karakter}) : super(key: key);

  @override
  State<DetailKarakterPage> createState() => _DetailKarakterPageState();
}

class _DetailKarakterPageState extends State<DetailKarakterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail" " ${widget.karakter}"),
      ),
    );
  }
}
