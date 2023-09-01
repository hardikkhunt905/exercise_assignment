import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:exercise_assignment/Elements/Widgets/spaces.dart';
import 'package:exercise_assignment/Values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToastContext {
  BuildContext? context;
  MethodChannel? _channel;

  static final ToastContext _instance = ToastContext._internal();

  /// Prmary Constructor for FToast
  factory ToastContext() {
    return _instance;
  }

  /// Take users Context and saves to avariable
  ToastContext init(BuildContext context) {
    _instance.context = context;
    return _instance;
  }

  ToastContext._internal();
}

class Toast {
  static const int lengthShort = 2;
  static const int lengthLong = 3;
  static const int bottom = 0;
  static const int center = 1;
  static const int top = 2;

  static void show(String msg,
      {int? duration = 1,
      int? gravity = 0,
      Color backgroundColor = const Color(0xAA000000),
      textStyle = const TextStyle(fontSize: 15, color: Colors.white),
      double backgroundRadius = 20,
      bool? rootNavigator,
      Border? border,
      bool webShowClose = false,
      Color webTexColor = const Color(0xFFffffff)}) {
    if (ToastContext().context == null) {
      throw Exception(
          'Context is null, please call ToastContext.init(context) first');
    }
    if (kIsWeb == true) {
      if (ToastContext()._channel == null) {
        ToastContext()._channel = const MethodChannel('appdev/FlutterToast');
      }
      String toastGravity = "bottom";
      if (gravity == Toast.top) {
        toastGravity = "top";
      } else if (gravity == Toast.center) {
        toastGravity = "center";
      } else {
        toastGravity = "bottom";
      }

      final Map<String, dynamic> params = <String, dynamic>{
        'msg': msg,
        'duration': (duration ?? 1) * 1000,
        'gravity': toastGravity,
        'bgcolor': backgroundColor.toString(),
        'textcolor': webTexColor.value.toRadixString(16),
        'webShowClose': webShowClose,
      };
      ToastContext()._channel?.invokeMethod("showToast", params);
    } else {
      ToastView.dismiss();
      ToastView.createView(msg, ToastContext().context!, duration, gravity,
          backgroundColor, textStyle, backgroundRadius, border, rootNavigator);
    }
  }
}

class ToastView {
  static final ToastView _singleton = ToastView._internal();

  factory ToastView() {
    return _singleton;
  }

  ToastView._internal();

  static OverlayState? overlayState;
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;

  static void createView(
      String msg,
      BuildContext context,
      int? duration,
      int? gravity,
      Color background,
      TextStyle textStyle,
      double backgroundRadius,
      Border? border,
      bool? rootNavigator) async {
    overlayState = Overlay.of(context, rootOverlay: rootNavigator ?? false);

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => ToastWidget(
          widget: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(backgroundRadius),
                    border: border,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Image.asset(
                        ImagePath.appLogo,
                        height: 25.w,
                        width: 25.w,
                      ),
                      const SpaceW12(),
                      Text(msg, softWrap: true, style: textStyle),
                    ],
                  ),
                )),
          ),
          gravity: gravity),
    );
    _isVisible = true;
    overlayState!.insert(_overlayEntry!);
    await Future.delayed(Duration(seconds: duration ?? Toast.lengthShort));
    dismiss();
  }

  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}

class ToastWidget extends StatelessWidget {
  const ToastWidget({
    Key? key,
    required this.widget,
    required this.gravity,
  }) : super(key: key);

  final Widget widget;
  final int? gravity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: gravity == 2 ? MediaQuery.of(context).viewInsets.top + 50 : null,
        bottom:
            gravity == 0 ? MediaQuery.of(context).viewInsets.bottom + 50 : null,
        child: IgnorePointer(
          child: Material(
            color: Colors.transparent,
            child: widget,
          ),
        ));
  }
}

// import 'package:flutter/material.dart';
//
// enum ToastGravity { bottom, center, top }
//
// class ToastDecorator extends StatelessWidget {
//   final Widget widget;
//   final Color backgroundColor;
//   final Border border;
//   final EdgeInsets margin;
//   final EdgeInsets padding;
//   final BorderRadius borderRadius;
//
//   const ToastDecorator(
//       {super.key,
//       required this.widget,
//       this.backgroundColor = Colors.black,
//       this.border = const Border(),
//       this.margin = const EdgeInsets.symmetric(horizontal: 20),
//       this.padding = const EdgeInsets.fromLTRB(16, 10, 16, 10),
//       this.borderRadius = const BorderRadius.all(Radius.circular(20.0))});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         width: MediaQuery.of(context).size.width,
//         child: Container(
//             alignment: Alignment.center,
//             width: MediaQuery.of(context).size.width,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: backgroundColor,
//                 borderRadius: borderRadius,
//                 border: border,
//               ),
//               margin: margin,
//               padding: padding,
//               child: widget,
//             )));
//   }
// }
//
// class ToastUtil {
//   static void show(
//     Widget widget,
//     BuildContext context, {
//     int duration = 2,
//     ToastGravity gravity = ToastGravity.bottom,
//   }) {
//     _ToastView.dismiss();
//     _ToastView.createViewToast(context, duration, gravity, widget);
//   }
// }
//
// class _ToastView {
//   static final _ToastView _singleton = _ToastView._internal(); //singleton
//
//   factory _ToastView() {
//     return _singleton;
//   }
//
//   _ToastView._internal();
//
//   static OverlayState? overlayState;
//   static OverlayEntry? _overlayEntry;
//   static bool _isVisible = false;
//
//   static void createViewToast(
//     BuildContext context,
//     int duration,
//     ToastGravity gravity,
//     Widget widget,
//   ) async {
//     overlayState = Overlay.of(context)!;
//
//     _overlayEntry = OverlayEntry(
//         builder: (BuildContext context) => _ToastWidget(
//           widget: widget,
//           gravity: gravity,
//         )
//     );
//     _isVisible = true;
//     overlayState?.insert(_overlayEntry!);
//     await Future.delayed(Duration(seconds: duration));
//     dismiss();
//   }
//
//   static dismiss() async {
//     if (!_isVisible) {
//       return;
//     }
//     _isVisible = false;
//     _overlayEntry?.remove();
//   }
// }
//
// class _ToastWidget extends StatelessWidget {
//   const _ToastWidget({
//     Key? key,
//     required this.widget,
//     required this.gravity,
//   }) : super(key: key);
//
//   final Widget widget;
//   final ToastGravity gravity;
//
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//         top: gravity == ToastGravity.top
//             ? MediaQuery.of(context).viewInsets.top + 50
//             : null,
//         bottom: gravity == ToastGravity.bottom
//             ? MediaQuery.of(context).viewInsets.bottom + 50
//             : null,
//         child: Material(
//           color: Colors.transparent,
//           child: widget,
//         ));
//   }
// }
