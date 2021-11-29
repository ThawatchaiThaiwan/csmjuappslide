import 'package:appcsmju/model/carouselmodel/carousel.dart';

import 'package:appcsmju/model/carouselmodel/fetchUsingApi.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

//animals.reversed.toList();
class _HomePageState extends State<HomePage> {
  APi pro = APi.instance;
  final List<String> imgList = [];
  late List<Apinew> news = [];
  late Future<Apinew> futureAlbum;

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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SafeArea(
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
    );
    
  }
}
