import 'package:Vevico/design_course/home_design_course.dart';
import 'package:Vevico/fitness_app/fitness_app_home_screen.dart';
import 'package:Vevico/hotel_booking/hotel_home_screen.dart';
import 'package:Vevico/mechanic/home_design_course.dart';
import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/fitness_app/fitness_app.png',
      navigateScreen: FitnessAppHomeScreen(),
    ),
    HomeList(
      imagePath: 'assets/hotel/hotel_booking.png',
      navigateScreen: HotelHomeScreen(),
    ),
    HomeList(
      imagePath: 'assets/design_course/design_course.png',
      navigateScreen: MechanicHomeScreen(),
    ),
  ];
}
