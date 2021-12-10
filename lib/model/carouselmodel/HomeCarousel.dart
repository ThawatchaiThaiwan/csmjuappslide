import 'package:appcsmju/api/apinew.dart';
import 'package:appcsmju/controller/apinew_foot.dart';

import 'package:appcsmju/model/carouselmodel/carousel.dart';

import 'package:appcsmju/model/carouselmodel/fetchUsingApi.dart';
import 'package:appcsmju/model/carouselmodel/reship.api.dart';
import 'package:appcsmju/model/carouselmodel/reship.dart';
import 'package:appcsmju/model/carouselmodel/reship_card.dart';
import 'package:appcsmju/model/newsmodel/customListTile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

//animals.reversed.toList();
class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  ////////////////////////////////////////////////////////////////////////////////
  APi pro = APi.instance;
  final List<String> imgList = [];
  late List<Apinews> news = [];
  late Future<Apinews> futureAlbum;
  /* late final Apinew article;
   _HomePageState({required this.article}); */

  void getiii() async {
    var a = await pro.GetNews(context);
    int i = 0;
    // for(i=0;i<pro.li.length;++i){
    //   imgList[i]=pro.li[i].newsPicture;
    // }
    a.forEach((value) {
      Apinew order = new Apinew.fromJson(value);
      imgList.add(order.newsPicture);
    });
    setState(() {
      news = pro.li;
      //futureAlbum = pro.GetNews(context);
    });
    //print(a);
    // print(" image  of newssss isss ${imgList[0]}");
  }

  @override
  Widget build(BuildContext context) {
    getiii();

    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.person),
          color: Colors.black, //ยังไม่ได้เชื่อปุ่ม icons
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_active),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Column(children: <Widget>[
          SizedBox(
            child: Text(
              "ข่าวประชาสัมพันธ์",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
          Container(
            /* padding: const EdgeInsets.fromLTRB(7, 10, 7, 10), */
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 2000)),
                  items: imgList
                      .map((item) => Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: SafeArea(
                              child: Center(
                                  child: Image.network(item,
                                      fit: BoxFit.cover, width: 1000)),
                            ),
                          ))
                      .toList(),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'กิจกรรมที่น่าสนใจ',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    /* padding: const EdgeInsets.all(3.0), */
                    itemCount: _recipes.length,
                    itemBuilder: (context, index) {
                      return RecipeCard(
                          thumbnailUrl: _recipes[index].activityDetail);
                    },
                  ),
          ),
        ]),
      ),
    );
  }
}
