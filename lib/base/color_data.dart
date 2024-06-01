import 'dart:ui';
//Colors.teal[300]
//bluecolor #23408F
Color tealColor = "#FF4DB6AC".toColor();
Color backGroundColor = "#F9FAFC".toColor();
Color whiteGroundColor = "#FFFFFF".toColor();
Color blueColor = "2092ef".toColor();
Color intro1Color = "#FFC8CF".toColor();
Color intro2Color = "#E5ECFF".toColor();
Color intro3Color = "#F7FBCD".toColor();
Color dividerColor = "#E5E8F1".toColor();
Color textColor = "#7F889E".toColor();
Color deatilColor = "#D3DFFF".toColor();
Color listColor = "#EEF1F9".toColor();
Color procced = "#E2EAFF".toColor();
Color success = "#04B155".toColor();
Color completed = "#0085FF".toColor();
Color error = "#FF2323".toColor();
Color greyColor="e6e8f6".toColor();

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
