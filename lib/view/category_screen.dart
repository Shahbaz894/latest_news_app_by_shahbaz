
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latest_news_app/model/news_channel_headlines_model.dart';
import 'package:latest_news_app/view/news_detail_screen.dart';

import '../view_model/news_view_model.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  NewsViewModel newsViewModel = NewsViewModel();
  String categoryName = 'general';
  List<String> categoryList = [
    'general',
    'entertainment',
    'sports',
    'health',
    'ary news',
    'business',
    'technology',
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('News Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        categoryName = categoryList[index];
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: categoryName == categoryList[index]
                              ? Colors.blue
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Center(
                            child: Text(
                              categoryList[index],
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Colors.greenAccent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SizedBox(
                height: 500,
                width: 566,
                child: FutureBuilder<NewsChannelHeadlinesModel>(
                  future: newsViewModel.fetchCategoryNews(categoryName),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: SpinKitDancingSquare(
                          color: Colors.blue,
                          size: 20,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (snapshot.hasData && snapshot.data != null) {
                      return SizedBox(
                        height: 50,
                        width: double.infinity,
                        child:
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.articles!.length,
                          itemBuilder: (context, index) {
                            final article = snapshot.data!.articles![index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child:
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  NewsDetailScreen(
                                    imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                                    title: snapshot.data!.articles![index].title.toString(),
                                    description: snapshot.data!.articles![index].description.toString(),


                                  )
                                  )
                                  );
                                },
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child:
                                      article.urlToImage != null && (article.urlToImage!.startsWith('http://') || article.urlToImage!.startsWith('https://'))
                                          ? CachedNetworkImage(
                                        imageUrl: article.urlToImage!,
                                        height: height * 0.18,
                                        width: width * 0.3,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                        const SpinKitFadingCube(
                                          color: Colors.blue,
                                          size: 40,
                                        ),
                                        errorWidget: (context, url, error) =>
                                        const Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        ),
                                      )
                                          : Container(
                                        width: width * 0.3,
                                        height: height * 0.18,
                                        color: Colors.grey, // Placeholder color
                                        child: const Icon(
                                          Icons.image_not_supported,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 10),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            article.title ?? '',
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            article.description ?? '',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                         ),
                      );
                    } else {
                      return Center(child: Text('No data available'));
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}