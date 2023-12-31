import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:uwallet/Main_Pages/my_QR.dart';
import 'package:uwallet/contacts.dart';

import '../utils/Shared_preferences.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final String? sharedValue = SharedPreferenceHelper().getValue();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Stack(
              children:[Container(
                padding: EdgeInsets.only(top: 45, left: 15, right: 15),
                height: 400,
                decoration: BoxDecoration(
                    color: sharedValue=="Adult"?Color(0xFFFFAE58):Color(0xFF2ECC71),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft:Radius.circular(30))
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("My Profile",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22 , color: Colors.white),),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: sharedValue=="Adult"?Color(0xFFFFAE58):Color(0xFF2ECC71),
                              border: Border.all(width: 1, color: Colors.white60),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: InkWell(
                              onTap: (){
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => MyQR()));
                              },
                              child: Icon(Icons.qr_code, color: Colors.white,)),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Image.asset("assets/images/Avatar.png", fit: BoxFit.cover,)
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Turza Podder", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 22 ),),
                            Text("018 710 38 150", style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
                Positioned(
                  bottom: -30,
                  right: 65,
                  child: Container(
                    height: 200,
                    width: 260,
                    decoration: BoxDecoration(
                      color: Color(0xFFCD8C4B),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                Positioned(
                    bottom: -45,
                    right: 40,
                    child: Container(
                      height: 200,
                      width: 310,
                      decoration: BoxDecoration(
                        color: sharedValue=="Adult"?Color(0xFF2ECC71):Color(0xFFFFAE58),
                        borderRadius: BorderRadius.circular(25),
                      ),
                ),
                ),
                Positioned(
                  bottom: -60,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFF00373E),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Balance", style: TextStyle(color: Colors.white, fontSize: 16),),
                        SizedBox(height: 8,),
                        Text("৳26,968.00", style: TextStyle(color: Colors.deepOrange, fontSize: 22, fontWeight: FontWeight.bold)),
                        SizedBox(height: 18,),
                        Row(
                          children: [
                            Icon(Icons.sim_card, color: Colors.white60, size: 30,),
                            Text("**** **** *** 3765",style: TextStyle(color: Colors.deepOrange, fontSize: 18))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 40),
                color: Colors.white,
                  child: bwTiles()),
            ),
          ],
        ),
      ),

    );
  }




  Widget bwTiles() {
    return Column(
      children: [
        bwTile(Icons.person, "Add or invite family", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactsPage()),
          );
        }),
        bwTile(Icons.lock, "Privacy & Security", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactsPage()),
          );
        }),
        bwTile(
          CupertinoIcons.gift,
          "Offers & Rewards",
              () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactsPage(

                ),
              ),
            );
          },
        ),
        bwTile(Icons.help_rounded, "Help", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactsPage()),
          );
        }),
        bwTile(Icons.logout, "Logout", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactsPage()),
          );
        }),
      ],
    );
  }



  Widget bwTile(IconData icon, String text, VoidCallback onTap) {
    Color pickedColor = Color(0xfff3f4fe);
    return ListTile(
      leading: Container(
        child: Icon(icon, color: sharedValue=="Adult"?Color(0xFFFFAE58):Color(0xFF2ECC71)),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      title: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black38, size: 20),
      onTap: () {},
    );
  }


}