

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsDetailScreen extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;

  const NewsDetailScreen({super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return  Scaffold(
      appBar: AppBar(
        title: Text('News Detail Page'),
      ),
      body: Column(
        children: [
          Container(
            height: height*0.5,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Image.network(widget.imageUrl)),
          Padding(padding: EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            height: height*0.35,
            child: Column(
              children: [
                Text(widget.title,
              maxLines: 2,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,

                  fontSize: 20,
                  color: Colors.redAccent
                ),),
                SizedBox(width: 50,),

                Text(widget.description,style: GoogleFonts.poppins(

                    fontSize: 15,
                    color: Colors.black45)
                )
              ],
            ),
          ),)
        ],
      ),
    );
  }
}
