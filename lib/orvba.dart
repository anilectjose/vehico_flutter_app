import 'package:flutter/cupertino.dart';

class Orvba {
  static const String name = "VEHICO App";
  static const String BaseURL = "https://192.168.43.128./orvba/api/";
  static const String Desc = "Let us take care \n on your vehicle.";
  String imageAssetPath;
  String title;
  String desc;

  static const Color themecolor = Color(0xFFF00000);
  static Image background_image = Image.asset("assets/backgrounds/mc7.jpg");

  Orvba({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}
