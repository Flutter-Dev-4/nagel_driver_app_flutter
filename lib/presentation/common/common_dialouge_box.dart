import 'package:driver_app/presentation/common/custom_dialogues.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonDialogsBox {
  static showCommonDialogue({
    required BuildContext context,
    IconData? icon,
    String? svgPath,
    double iconHeight = 96,
    double? iconWidth,
    EdgeInsetsGeometry iconMargins = EdgeInsets.zero,
    Color? iconColor,
    String? title,
    Color? titleTextColor,
    double? titleTextSize,
    FontWeight? titleFontWeight,
    String? description,
    Color? descriptionTextColor,
    double? descriptionTextSize,
    FontWeight? descriptionFontWeight,
    List<Widget>? actions,
    double radius = 20,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    EdgeInsetsGeometry? titlePadding,
    EdgeInsetsGeometry? descriptionPadding,
  }) {
    showDialog(
      context: context,
      barrierColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
      builder: (ctx) {
        return Dialog(
          insetPadding: const EdgeInsets.all(24),
          elevation: 20,
          shadowColor: Theme.of(context).colorScheme.tertiary,
          clipBehavior: Clip.hardEdge,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: padding ?? const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color:
              backgroundColor ?? Theme.of(context).colorScheme.background,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: crossAxisAlignment,
              mainAxisAlignment: mainAxisAlignment,
              children: [
                // DynamicAppIconHandler.buildIcon(
                //   context: context,
                //   icon: icon,
                //   svg: svgPath,
                //   iconHeight: iconHeight,
                //   iconWidth: iconWidth,
                //   margins: iconMargins,
                //   iconColor: iconColor,
                // ),
                if (title != null)
                  Padding(
                    padding: titlePadding ??
                        const EdgeInsets.only(top: 24, bottom: 14),
                    child: AppText(
                      title,
                      textAlign: TextAlign.center,
                      style:
                      Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: titleTextColor ??
                            Theme.of(context).colorScheme.onBackground,
                        fontWeight: titleFontWeight,
                        fontSize: titleTextSize,
                      ),
                    ),
                  ),
                if (description != null)
                  Padding(
                    padding: descriptionPadding ??
                        EdgeInsets.only(
                            bottom: (actions != null && actions.isNotEmpty)
                                ? 36
                                : 0),
                    child: AppText(
                      description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: descriptionTextColor ??
                            Theme.of(context).colorScheme.onBackground,
                        fontWeight: descriptionFontWeight,
                        fontSize: descriptionTextSize,
                      ),
                    ),
                  ),
                if (actions != null && actions.isNotEmpty) ...actions
              ],
            ),
          ),
        );
      },
    );
  }

  static showCustomDialogue({
    required BuildContext context,
    double radius = 20,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    required Widget child,
    double elevation = 20,
    EdgeInsets? insetPadding,
  }) {
    showDialog(
      context: context,
      barrierColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
      builder: (ctx) {
        return Dialog(
          insetPadding: insetPadding ?? const EdgeInsets.all(24),
          elevation: elevation,
          shadowColor: Theme.of(ctx).colorScheme.tertiary,
          clipBehavior: Clip.hardEdge,
          backgroundColor: Colors.transparent,
          child: Container(
              padding: padding ?? const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color:
                backgroundColor ?? Theme.of(ctx).colorScheme.background,
              ),
              child: child),
        );
      },
    );
  }

  static showLoadingDialogue({required BuildContext context}) {
    return showCustomDialogue(
      backgroundColor: Colors.transparent,
      elevation: 0,
      padding: EdgeInsets.zero,
      context: context,
      child: const Center(
        child: CupertinoActivityIndicator(
          radius: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  static showSuccessDialogue({
    required BuildContext context,
    required String title,
    required String description,
    double titleFontSize = 22,
    double descriptionFontSize = 16,
    List<Widget>? actions,
  }) {
    return showCommonDialogue(
      context: context,
      svgPath: "assets/",
      title: title,
      description: description,
      titleTextSize: titleFontSize,
      descriptionTextSize: descriptionFontSize,
      actions: actions,
    );
  }

  // static showErrorDialogue({
  //   required BuildContext context,
  //   required String title,
  //   required String description,
  //   double titleFontSize = 22,
  //   double descriptionFontSize = 16,
  //   List<Widget>? actions,
  // }) {
  //   return showCommonDialogue(
  //     context: context,
  //     svgPath: Assets.icons.warning,
  //     title: title,
  //     description: description,
  //     titleTextSize: titleFontSize,
  //     descriptionTextSize: descriptionFontSize,
  //     actions: actions,
  //   );
  // }
}
