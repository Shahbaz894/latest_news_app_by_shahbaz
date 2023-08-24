import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latest_news_app/model/us_technology_news_model.dart';

import '../view_model/news_view_model.dart';
import 'news_screen.dart';

class WraNewsScreen extends StatefulWidget {
  const WraNewsScreen({super.key});

  @override
  State<WraNewsScreen> createState() => _WraNewsScreenState();
}

class _WraNewsScreenState extends State<WraNewsScreen> {
  NewsViewModel newsViewModel = NewsViewModel();
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.sizeOf(context).width*1;
    final height=MediaQuery.sizeOf(context).height*1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('War and Terrorism News'),
      ),
      body:  Container(
        height: height*0.8,
        width: 300,
        child: FutureBuilder<UsTechnologyNewsModel>(
          future: newsViewModel.fetchUsTechnologyNewsApi(),
          builder: (BuildContext context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(
                child: SpinKitDancingSquare(color: Colors.blue,size: 100,),
              );
            }else{
              return
                Column(
                  children: [
                    Expanded(
                      child:
                      ListView.builder(

                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.articles!.length,
                          itemBuilder: (context,index){
                            //DateTime dateTime=DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 1.0),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height:height*.6,
                                    width: width*0.4,
                                    child: ClipRRect(
                                      borderRadius:BorderRadius.circular(15),

                                      child:
                                      CachedNetworkImage(
                                        imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                                        fit: BoxFit.cover,
                                        placeholder: (context,url)=>Container(
                                          child: spinKt2,),
                                        errorWidget: (context,url ,error)=>const Icon(Icons.error,color: Colors.red,),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                      child: Container(
                                        height:height*0.6,
                                        width: width*0.4,
                                        child: Column(
                                          children: [
                                            Text(snapshot.data!.articles![index].title.toString(),
                                              maxLines: 3,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  color: Colors.black45,
                                                  fontWeight: FontWeight.w600
                                              ),


                                            ),
                                            Spacer(),
                                            Text(snapshot.data!.articles![index].source!.name.toString(),
                                              maxLines: 2,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  color: Colors.black45,
                                                  fontWeight: FontWeight.w600
                                              ),


                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            );
                          }),
                    ),

                  ],
                );
            }

          },
        ),

      ),
    );
  }
}
