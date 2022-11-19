import 'package:http/http.dart' as http;
import 'package:task_1_coc/Models/api_model.dart';
import 'dart:convert';

class AddApi {
  List<Sample> _postlist = [];
  Future<List<Sample>> getPostapi() async {
    final responce = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data = jsonDecode(responce.body.toString());
    if (responce.statusCode == 200) {
      for (Map i in data) {
        _postlist.add(Sample.fromJson(i));
      }
      return _postlist;
    } else {
      return _postlist;
    }
  }

  String getId(int index ){
    return _postlist[index].id.toString();
  }
  String getTitle(int index ){
    return _postlist[index].title.toString();
  }
  String getPrice(int index ){
    return _postlist[index].price.toString();
  }
  String getDiscription(int index ){
    return _postlist[index].description.toString();
  }
  String getCategoty(int index ){
    return _postlist[index].category.toString();
  }
  String getImage(int index ){
    return _postlist[index].image.toString();
  }
  String getRate(int index ){
    return _postlist[index].rating!.rate!.toString();
  }


  int getPostlistLength(){
    return _postlist.length;
  }

}