import 'package:flutter/material.dart';

class DetailWeaponPage extends StatefulWidget {
  final String weapon;
  const DetailWeaponPage({Key? key, required this.weapon}) : super(key: key);

  @override
  State<DetailWeaponPage> createState() => _DetailWeaponPageState();
}

class _DetailWeaponPageState extends State<DetailWeaponPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail " " ${widget.weapon}"),
      ),
    );
  }
}
