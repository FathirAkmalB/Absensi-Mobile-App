import 'dart:convert';
import 'package:absensi_mobile/methods/api.dart';


class Portal {
  String? judul;
  String? content;
  String? image;
  String? pokja;

  Portal({this.judul, this.content, this.image, this.pokja});

  Portal.fromJson(Map<String, dynamic> json) {
    judul = json['judul'];
    content = json['content'];
    image = json['image'];
    pokja = json['pokja'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['judul'] = this.judul;
    data['content'] = this.content;
    data['image'] = this.image;
    data['pokja'] = this.pokja;
    return data;
  }
}

Future<List<Portal>> getLatestNews() async {
  var response = await API().getRequest(route: '/portal/show-latest');

  if(response.statusCode != 200){
    return [];
  }

  List<dynamic> jsonData = jsonDecode(response.body);

  List<Portal> datas = jsonData.map((elem) {
    return Portal.fromJson(elem);
  }).toList();

  return datas;

}

Future<List<Portal>> getAllNews() async {
  var response = await API().getRequest(route: '/portal/get-all');

  if(response.statusCode != 200){
    return [];
  }

  List<dynamic> jsonData = jsonDecode(response.body);

  List<Portal> datas = jsonData.map((elem) {
    return Portal.fromJson(elem);
  }).toList();

  return datas;

}
