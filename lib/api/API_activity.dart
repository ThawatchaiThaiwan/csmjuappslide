import 'package:appcsmju/APImodel/Activity.dart';
import 'package:http/http.dart';


class ActivityApiService {
  
  /* final endPointUrl = "https://wwwdev.csmju.com/api/activitypic"; */


 static Future<List<Activity>> getsActivity() async {
    Response res = await get(Uri.parse("https://wwwdev.csmju.com/api/activitypic"));


     if(res.statusCode == 200){
        return activityFromJson(res.body);
      }
      return getsActivity();
    /* if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> beody = json["data"]; //////////น่าจะเป็นอันนี้

     
      List<Article> data =
          beody.map((dynamic item) => Article.fromJson(item)).toList();

      return data; */
    
  }
}
