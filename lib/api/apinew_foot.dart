import 'package:appcsmju/APImodel/apinew.dart';
import 'package:http/http.dart';


class ApiService {
  
  final endPointUrl = "https://wwwdev.csmju.com/api/newsapp";


  Future<List<Apinew>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));


     if(res.statusCode == 200){
        return apinewFromJson(res.body);
      }
      return getArticle();
    /* if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> beody = json["data"]; //////////น่าจะเป็นอันนี้

     
      List<Article> data =
          beody.map((dynamic item) => Article.fromJson(item)).toList();

      return data; */
    
  }
}
