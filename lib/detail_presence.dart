import 'package:flutter/material.dart';

class DetailPresence extends StatefulWidget {
  const DetailPresence({Key? key}) : super(key: key);

  @override
  State<DetailPresence> createState() => _DetailPresenceState();
}

class _DetailPresenceState extends State<DetailPresence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Detail Presence',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'images/detailAbsen.png', // Replace with the actual path to your image
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 400,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              padding: EdgeInsets.only(top:110, left:20,right:25),
              decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/f11.png'), // Replace with your image path
              fit: BoxFit.fill,
            ),
              ),
              child:Column(children:[
                Container(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('TIme in',style: TextStyle(color: Colors.white)),
                      Text('06:25',style: TextStyle(color: Colors.white))
                    ],
                  )
                ),
                SizedBox(height:30),
                Container(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Day',style: TextStyle(color: Colors.white)),
                      Text('Monday',style: TextStyle(color: Colors.white))
                    ],
                  )
                ),
                SizedBox(height:30),
                Container(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Date',style: TextStyle(color: Colors.white)),
                      Text('12',style: TextStyle(color: Colors.white))
                    ],
                  )
                ),
                SizedBox(height:30),
                Container(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Month',style: TextStyle(color: Colors.white)),
                      Text('January',style: TextStyle(color: Colors.white))
                    ],
                  )
                ),
                SizedBox(height:30),
                Container(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Years',style: TextStyle(color: Colors.white)),
                      Text('2024',style: TextStyle(color: Colors.white))
                    ],
                  )
                ),
              ])
            ),
            
          ],
        ),
      ),
    );
  }
}
