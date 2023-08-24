import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latest_news_app/model/news_channel_headlines_model.dart';

import 'package:latest_news_app/view/drawer_screen_components.dart';
import 'package:latest_news_app/view_model/news_view_model.dart';

import 'news_detail_screen.dart';




class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  NewsViewModel newsViewModel=NewsViewModel();

  DraweScreen draweScreen=DraweScreen();

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.sizeOf(context).width*1;
    final height=MediaQuery.sizeOf(context).height*1;


    return  Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('News Headlines',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),

      ),

      drawer: draweScreen,

      body:Column(
        children: [

          SizedBox(
            height: height*.60,
            width: width,
            child:
            FutureBuilder<NewsChannelHeadlinesModel>(
              future: newsViewModel.fetchNewsChannelHeadlinesApi(),
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

                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.articles!.length,
                              itemBuilder: (context,index){
                                return SizedBox(
                                  height: height*1,
                                  width: width,

                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsDetailScreen(
                                        imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                                        title: snapshot.data!.articles![index].title.toString(),
                                        description: snapshot.data!.articles![index].description.toString(),
                                      ))


                                      );
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,

                                      children: [
                                        Container(
                                          height:height*0.55,
                                          width: width*0.9,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: height*0.01,
                                              vertical: width*0.01),
                                          child:
                                          ClipRRect(
                                            borderRadius:BorderRadius.circular(10),

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
                                        Positioned(
                                          bottom: 60,

                                          child: Card(
                                            elevation:5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12),

                                            ),
                                            child: Container(
                                              alignment: Alignment.bottomCenter,
                                              height: height*0.12,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: width*0.7,
                                                    child: Text(snapshot.data!.articles![index].title.toString(),style: GoogleFonts.poppins(fontSize:17,fontWeight: FontWeight.w700),
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,),
                                                  ),
                                                  Spacer(),
                                                  Container(
                                                    width: width*0.7,
                                                    child: Row(
                                                      children: [
                                                        Text(snapshot.data!.articles![index].source!.name.toString(),style: GoogleFonts.poppins(fontSize:12,fontWeight: FontWeight.w500),
                                                          maxLines: 2,
                                                          overflow: TextOverflow.ellipsis,),
                                                        // Text(dateTime as String,style: GoogleFonts.poppins(fontSize:12,fontWeight: FontWeight.w600),
                                                        //    maxLines: 2,
                                                        //    overflow: TextOverflow.ellipsis,),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
          SizedBox(
            height: height*0.3,
            width: 300,
            child: FutureBuilder<NewsChannelHeadlinesModel>(
              future: newsViewModel.fetchNewsChannelHeadlinesApi(),
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
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsDetailScreen(
                                        imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                                        title: snapshot.data!.articles![index].title.toString(),
                                        description: snapshot.data!.articles![index].description.toString(),
                                      ))


                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height:height*0.18,
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
                                              height:height*0.18,
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
                                  ),
                                );
                              }),
                        ),

                      ],
                    );
                }

              },
            ),

          )
        ],
      )

    );
  }


}
const spinKt2 =SpinKitFadingCircle(
color: Colors.amber,
size: 200,
);
