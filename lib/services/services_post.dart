

import 'package:dio/dio.dart';
import 'package:iti_flutter_task_http/model/model_post.dart';

class ServicesPost{
  String url = 'https://jsonplaceholder.typicode.com/' ,
  post = 'posts/';

  Future <List<Posts>> getAllPots()async{
List <Posts> listOfPost = [];
Response response = await Dio().get('${url}${post}');
var dataPosts = response.data;
dataPosts.forEach((e){
  Posts posts = Posts.fromJson(e);
  listOfPost.add(posts);

});
  return listOfPost ;
  }
}