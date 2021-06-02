import 'package:Vevico/design_course/home_design_course.dart';
import 'package:Vevico/mechanic/home_design_course.dart';
import 'package:Vevico/Firstaid/home_design_course.dart';
import 'package:Vevico/navigation_home_screen.dart';
import 'package:Vevico/towing/home_design_course.dart';

class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.link,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  var link;
  List<String> meals;
  int kacl;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath: 'assets/fitness_app/breakfast.png',
      titleTxt: 'Find Best Mechanic',
      link: MechanicHomeScreen(),
      startColor: '#000000',
      endColor: '#FF0000',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/lunch.png',
      titleTxt: 'Find Towing Service',
      link: towingHomeScreen(),
      startColor: '#000000',
      endColor: '#FF0000',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/snack.png',
      titleTxt: 'First aid & Rescue Squard',
      link: FirstaidHomeScreen(),
      startColor: '#000000',
      endColor: '#FF0000',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/dinner.png',
      titleTxt: 'Parts & Sales',
      link: PartsHomeScreen(),
      startColor: '#000000',
      endColor: '#FF0000',
    ),
  ];
}
