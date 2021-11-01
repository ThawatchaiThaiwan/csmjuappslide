import 'package:appcsmju/controller/home_controller.dart';
import 'package:appcsmju/model/carousel_loading.dart';
import 'package:appcsmju/model/carousel_slider_data_found.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeCarousel extends StatefulWidget {
  HomeCarousel({
    Key? key,
  }) : super(key: key);
  @override
  GlobalKey key = new GlobalKey();
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: GetBuilder<HomeController>(
            builder: (_c) {
              if (_c.isLoading) if (_c.carouselData.length > 0)
                return CarouselSliderDataFound(_c.carouselData);
              else
                return CarouselLoading();
              else if (_c.carouselData.length > 0)
                return CarouselSliderDataFound(_c.carouselData);
              else
                return Container(
                  
                );
            },
          ),
          
        )
        );

    //child: Text(_dataFromAPI?.newsDetail ?? "loadind..."),
  }
}