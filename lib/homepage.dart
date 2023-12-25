import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'navbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// list of (assetpath, label)
  final List<(String, String)> categories = const [
    ("assets/images/trainer_club_set.png", "Juggling"),
    ("assets/images/poi.png", "Poi"),
    ("assets/images/lightsaber.png", "Sabers"),
    ("assets/images/triads.png", "Triads"),
  ];
  final List<String> featuredProductsPoiAssets = const [
    "assets/images/podpoi_1.png",
    "assets/images/podpoi_2.png",
  ];
  final List<String> featuredProductsTriadAssets = const [
    "assets/images/triad_1.jpeg",
    "assets/images/triad_2.jpeg",
  ];
  final List<String> featuredProductsDapostarAssets = const [
    "assets/images/dapostar_1.jpeg",
    "assets/images/dapostar_2.jpeg",
  ];
  final List<String> newArrivalAssets = const [
    "assets/images/new_arrival_1.jpeg",
    "assets/images/new_arrival_2.jpeg",
  ];
  final List<String> bestSellingAssets = const [
    "assets/images/bestselling_1.jpeg",
    "assets/images/bestselling_2.jpeg",
  ];

  int _current1 = 0;
  int _current2 = 0;

  final CarouselController _controller1 = CarouselController();
  final CarouselController _controller2 = CarouselController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            SafeArea(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 12.h),
                    child: Text(
                      "Flow It",
                      style: GoogleFonts.mogra(
                          fontSize: 23.12.sp,
                          fontWeight: FontWeight.w400,
                          height: 0,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
                    child: searchField(),
                  ),
                  SizedBox(height: 24.h),
                  categoriesWidget(),
                  SizedBox(height: 23.h),
                  ...productsCarousel(),
                  SizedBox(height: 55.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 30.h,
                          width: 30.h,
                          child:
                              Image.asset("assets/images/discount_coupon.png")),
                      Text(
                        'Deals for you',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 21.h),
                  ...dealsCarousel(),
                  SizedBox(height: 40.h),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
                    child: Text(
                      'Featured Products by category',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  ...featuredProductsByCategoryWidget(
                      "Poi", featuredProductsPoiAssets),
                  SizedBox(height: 24.h),
                  ...featuredProductsByCategoryWidget(
                      "Triad", featuredProductsTriadAssets),
                  SizedBox(height: 24.h),
                  ...featuredProductsByCategoryWidget(
                      "Dapostar", featuredProductsDapostarAssets),
                  SizedBox(height: 40.h),
                  newArrivalsSection(),
                  SizedBox(height: 40.h),
                  bestSellingSection(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/icons/next.svg"),
                        label: Text(
                          'See all products',
                          style: GoogleFonts.montserrat(
                            color: const Color(0xFFD83790),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 96.h),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: NavbarWidget(),
            )
          ],
        ),
      ),
    );
  }

  Container newArrivalsSection() {
    return Container(
      height: 285.h,
      width: double.infinity,
      color: const Color(0xFF212122),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 55.h,
              width: 154.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/ellipse.png"),
                      fit: BoxFit.cover)),
              alignment: Alignment(-0.5.sp, -0.3.sp),
              child: Text(
                'New Arrivals',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          scrollableSectionContent(newArrivalAssets),
        ],
      ),
    );
  }

  Container bestSellingSection() {
    return Container(
      height: 315.h,
      width: double.infinity,
      color: const Color(0xFF212122),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                  width: double.infinity,
                  height: 69.h,
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset("assets/icons/crown.svg")),
              Positioned(
                bottom: 17.h,
                left: 15.w,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Best',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' Selling',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          scrollableSectionContent(bestSellingAssets),
        ],
      ),
    );
  }

  SingleChildScrollView scrollableSectionContent(List<String> assetPaths) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 16.w),
          ...assetPaths.map(
            (e) => Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Stack(
                    children: [
                      Container(
                        height: 182.h,
                        width: 296.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          image: DecorationImage(
                              image: AssetImage(e), fit: BoxFit.cover),
                        ),
                        foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0),
                              Colors.black.withOpacity(0.9),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.h,
                        left: 8.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'podpoi® v2 - Rechargeable\nLED glow poi',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "\u20b9 10,466",
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
    );
  }

  Iterable<Widget> featuredProductsByCategoryWidget(
      String category, List<String> assetPaths) {
    return [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
        child: Text(
          category,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
      SizedBox(height: 21.h),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 16.w),
            ...assetPaths.map(
              (e) => InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Stack(
                    children: [
                      Container(
                        height: 220.h,
                        width: 204.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          image: DecorationImage(
                              image: AssetImage(e), fit: BoxFit.cover),
                        ),
                        foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0),
                              Colors.black.withOpacity(0.9),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.h,
                        left: 8.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'podpoi® v2 - Rechargeable\nLED glow poi',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFF949494),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "\u20b9 11,466",
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/next.svg"),
            label: Text(
              'View all $category',
              style: GoogleFonts.montserrat(
                color: const Color(0xFFD83790),
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      )
    ];
  }

  SingleChildScrollView categoriesWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 16.w),
          ...categories.map(
            (e) => InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 64.h,
                      width: 64.w,
                      decoration: ShapeDecoration(
                          shape: const CircleBorder(),
                          color: Colors.pink,
                          image: DecorationImage(image: AssetImage(e.$1))),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      e.$2,
                      style: GoogleFonts.montserrat(
                        color: const Color(0xFFE2E2E2),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 64.h,
                    width: 64.w,
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(),
                      color: Color(0xFF383838),
                    ),
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/icons/category_active.svg"),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Categories',
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFFE2E2E2),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField searchField() {
    return TextFormField(
      decoration: InputDecoration(
          isDense: true,
          hintText: "Search for Products",
          prefixIcon: Padding(
            padding: EdgeInsets.all(12.sp),
            child: SvgPicture.asset("assets/icons/search.svg"),
          ),
          hintStyle: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            height: 0,
          ),
          fillColor: const Color(0xFF383838),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.sp),
          )
          // border: OutlineInputBorder(),
          ),
    );
  }

  Iterable<Widget> productsCarousel() => [
        CarouselSlider(
          carouselController: _controller1,
          items: List.generate(
            5,
            (_) => SizedBox(
                width: 373.w,
                child: Image.asset("assets/images/fire_fans_image.png")),
          ),
          options: CarouselOptions(
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            height: 188.h,
            padEnds: true,
            disableCenter: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current1 = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => GestureDetector(
              onTap: () => _controller1.animateToPage(index),
              child: Container(
                width: 4.w,
                height: 4.h,
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 3.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current1 == index
                      ? Colors.white
                      : const Color(0xFF393939),
                ),
              ),
            ),
          ),
        ),
      ];
  Iterable<Widget> dealsCarousel() => [
        CarouselSlider(
          carouselController: _controller2,
          items: List.generate(
            5,
            (_) => SizedBox(
              width: 373.w,
              child: Image.asset("assets/images/podpoi.png"),
            ),
          ),
          options: CarouselOptions(
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            height: 174.h,
            padEnds: true,
            disableCenter: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current2 = index;
              });
            },
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => GestureDetector(
              onTap: () => _controller2.animateToPage(index),
              child: Container(
                width: 4.w,
                height: 4.h,
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 3.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current2 == index
                      ? Colors.white
                      : const Color(0xFF393939),
                ),
              ),
            ),
          ),
        )
      ];
}
