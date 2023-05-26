import '../../../features/main_home/data/models/query_params.dart';

class APiConstants {
  static const baseURL = "https://www.googleapis.com/";
  static const apiKey = 'AIzaSyBMzM83Ied5iHqO1tIuQnsD0sz_CZLgGCo';
  //////////////////////////
  static String getMostPopularVideo(QueryParams params) =>
      "youtube/v3/${params.endPoint}?part=${params.part}&chart=${params.chart}&maxResults=${params.maxResults}&key=$apiKey&pageToken=${params.pageToken}&fields=nextPageToken,items(id,snippet(title,description,thumbnails(medium)))&thumbnailTypes=medium&q=${params.q}";
}
