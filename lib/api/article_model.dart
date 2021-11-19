//Now let's create the article model
// for that we just need to copy the property from the json structure
// and make a dart object

class Article {
  String News_Detail;
  String News_Date;
  String News_Time;
  String News_Picture;
  String News_Title;
  String News_links;
  String News_File;
  String News_Type;

  /* String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content; */

  Article(
      {required this.News_Detail,
      required this.News_Date,
      required this.News_Time,
      required this.News_Picture,
      required this.News_Title,
      required this.News_links,
      required this.News_File,
      required this.News_Type});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      News_Detail: json["News_Detail"] as String,
      News_Date: DateTime.parse(json["News_Date"]) as String,
      News_Time: json["News_Time"] as String,
      News_Picture: json["News_Picture"] /* as String */,
      News_Title: json["News_Title"] as String,
      News_File: json["News_File"] as String,
      News_links: json["News_links"] as String,
      News_Type: json["News_Type"] as String,
    );
  }

  //Now let's create the constructor
  /* Article(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  //And now let's create the function that will map the json into a list
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json["author"] as String,
      title: json["title"] as String,
      description: json["description"] as String,
      url: json["url"] as String,
      urlToImage: json["urlToImage"] as String,
      publishedAt: json["publishedAt"] as String,
      content: json["content"] as String,
    );
  } */
}
