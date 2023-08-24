
import 'package:latest_news_app/repository/news_repository.dart';

import '../model/us_technology_news_model.dart';
import '../model/news_channel_headlines_model.dart';

class NewsViewModel{


  final _rep=NewsRepository();
  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi() async {
    final response= await _rep.fetchNewsChannelHeadlinesApi();
    return response;

  }
  Future<UsTechnologyNewsModel> fetchUsTechnologyNewsApi() async {
    final response= await _rep.fetchUsTechnologyNewsApi();
    return response;

  }
  Future<NewsChannelHeadlinesModel> fetchCategoryNews(String category) async {
    final response= await _rep.fetchCategoryNews(category);
    return response;

  }
}