import 'package:flutter/material.dart';
import 'listweaponpage.dart';
import 'listkarakterpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("https://4.bp.blogspot.com/-iz7Z_jLPL6E/XQ8eHVZTlnI/AAAAAAAAHtA/rDn9sYH174ovD4rbxsC8RSBeanFvfy75QCKgBGAs/w1440-h2560-c/genshin-impact-characters-uhdpaper.com-4K-2.jpg ",

              ),
              fit: BoxFit.cover,
             // colorFilter: ColorFilter.mode(Colors.white.withOpacity(1.0), BlendMode.modulate,)
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            Container(
              child: Image(image: AssetImage("logo.png")),
            ),
            Container(
              child: ElevatedButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        primary: Colors.white,
                        //onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListKarakterPage()   )
                        );
                      },
                      child:
                      Text("Karakter"),
                  ),
              ),
            Container(
              child: ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.only(left: 20, right: 20),

                    primary: Colors.white,
                    //onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => ListWeaponPage())
                    );
                  },
                  child:
                  Text("Weapon")
              ),
            )
          ]
          ,
        )
    );
  }
}
