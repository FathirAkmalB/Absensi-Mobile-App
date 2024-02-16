import 'package:flutter/material.dart';

class StarInfo extends StatefulWidget {
  const StarInfo({super.key});

  @override
  State<StarInfo> createState() => _StarInfoState();
}

class _StarInfoState extends State<StarInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
             children: [
               Text('Starbhak ',
                style: TextStyle(
                  fontSize: 16
                )
          ),
               Text('Info',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue
                )
          ),
             ],
           ),
          Row(children:[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('images/berita.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover
              )
            ),
             Column(children:[
              Container(
                margin: EdgeInsets.only(left:10),
                width: 200,
                child: Text('Lorem ipsum dolor sit amet consectetur. Non pharetra diam amet mi.',
                style: TextStyle(fontSize: 12)
                )),
              Container(
                width: 200,
                margin: EdgeInsets.only(top:5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Created At',
                        style: TextStyle(
                          fontSize: 8
                        )
                        ),
                        Text('12 Januari',
                        style: TextStyle(
                          color:Colors.blue,
                          fontSize: 8
                        )
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Updated At',
                        style: TextStyle(
                          fontSize: 8
                        )
                        ),
                        Text('16 Januari',
                        style: TextStyle(
                          color:Colors.blue,
                          fontSize: 8
                        )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ])
          ])
        ],
      ),
    );
  }
}