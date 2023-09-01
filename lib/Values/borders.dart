part of values;

class Borders {
  static  BorderSide defaultPrimaryBorder = BorderSide(width: Sizes.WIDTH_0, style: BorderStyle.none);

  static  UnderlineInputBorder primaryInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: MyColor.whiteShade1,
      width: Sizes.WIDTH_1,
      style: BorderStyle.solid,
    ),
  );

  static  UnderlineInputBorder enabledBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: MyColor.whiteShade1,
      width: Sizes.WIDTH_1,
      style: BorderStyle.solid,
    ),
  );

  static  UnderlineInputBorder focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: MyColor.blackShade3,
      width: Sizes.WIDTH_2,
      style: BorderStyle.solid,
    ),
  );

  static  UnderlineInputBorder disabledBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: MyColor.grey,
      width: Sizes.WIDTH_1,
      style: BorderStyle.solid,
    ),
  );

  static  OutlineInputBorder outlineEnabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(Sizes.RADIUS_30)),
    borderSide: BorderSide(
      color: MyColor.grey,
      width: Sizes.WIDTH_1,
      style: BorderStyle.solid,
    ),
  );

  static  OutlineInputBorder outlineFocusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(Sizes.RADIUS_30)),
    borderSide: BorderSide(
      color: MyColor.grey,
      width: Sizes.WIDTH_1,
      style: BorderStyle.solid,
    ),
  );

  static  OutlineInputBorder outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(Sizes.RADIUS_30)),
    borderSide: BorderSide(
      color: MyColor.grey,
      width: Sizes.WIDTH_1,
      style: BorderStyle.solid,
    ),
  );

  static UnderlineInputBorder noBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      style: BorderStyle.none,
    ),
  );

  static customBorder({
    Color color = MyColor.blackShade10,
    double? width,
    BorderStyle style = BorderStyle.solid,
  }) {
    return BorderSide(
      color: color,
      width: width ?? Sizes.WIDTH_1,
      style: style,
    );
  }

  static customOutlineInputBorder({
    double? borderRadius,
    Color color = MyColor.grey,
    double? width,
    BorderStyle style = BorderStyle.solid,
  }) {

    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? Sizes.RADIUS_12)),
      borderSide: BorderSide(
        color: color,
        width: width ?? Sizes.WIDTH_1,
        style: style,
      ),
    );
  }

  static customUnderlineInputBorder({
    Color color = MyColor.grey,
    double? width,
    BorderStyle style = BorderStyle.solid,
  }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: width ?? Sizes.WIDTH_1,
        style: style,
      ),
    );
  }
}
