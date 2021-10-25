/* child: GetBuilder<HomeController>(
            builder: (_c) {
              if (_c.isLoading) if (_c.carouselData.length > 0)
                return CarouselSliderDataFound(_c.carouselData);
              else
                return CarouselLoading();
              else if (_c.carouselData.length > 0)
                return CarouselSliderDataFound(_c.carouselData);
              else
                return Container();
            },
          ), */