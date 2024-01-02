
import 'image_constants.dart';

class ImageManager {
  static ImageManager? _instance;
  static ImageManager get instance => _instance ??= ImageManager._init();
  ImageManager._init();
  // String get introductionBg => toSvg(ImageConstants.INTRODUCTION_BG);
  String get introductionBg => toPng(ImageConstants.INTRODUCTION_BG);
  String get loginBg => toPng(ImageConstants.LOGIN_BG);
  String get settingsIcon => toSvg(ImageConstants.SETTING_ICON);
  String get mockProfile => toSvg(ImageConstants.MOCK_PROFILE);
  String get exitIcon => toPng(ImageConstants.EXIT_ICON);

  String toPng(String name) => 'assets/images/$name.png';
  String toSvg(String name) => 'assets/svg/$name.svg';
}
