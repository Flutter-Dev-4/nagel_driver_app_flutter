import 'package:driver_app/data/data_sources/Colors/dark_colors_palate.dart';
import 'package:driver_app/export.dart';

class CommonDialogs {
  static showCommonDialogue({
    required BuildContext context,
    String? svgPath,
    double? iconHeight = 41,
    double? iconWidth,
    Color? iconColor,
    String? title,
    TextStyle? titleTextStyle,
    TextStyle? descriptionTextStyle,
    String? description,
    Widget? actions,
    double radius = 20,
    EdgeInsetsGeometry? padding,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  }) {
    showDialog(
      context: context,
      builder: (ctx) {
        final theme = Theme.of(context);
        return Dialog(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          insetPadding: EdgeInsets.symmetric(horizontal: 24.sp),
          shadowColor: theme.colorScheme.outline,
          clipBehavior: Clip.hardEdge,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
            decoration: decoration(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: crossAxisAlignment,
              mainAxisAlignment: mainAxisAlignment,
              children: [
                DynamicAppIcon(
                  svg: svgPath,
                  iconHeight: iconHeight,
                  iconColor: iconColor,
                ),
                if (title != null)
                  AppText(
                    title,
                    style: titleTextStyle ?? theme.textTheme.titleMedium,
                  ).padOnly(19.h, 8.h, 0, 0),
                if (description != null)
                  AppText(
                    description,
                    maxLines: 3,
                    style: descriptionTextStyle ??
                        theme.textTheme.bodyLarge!
                            .copyWith(color: theme.colorScheme.tertiary),
                  ),
                if (actions != null) actions
              ],
            ),
          ),
        );
      },
    );
  }

  // Customizible Dialog
  static showCustomDialogue({
    required BuildContext context,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    required Widget child,
    double elevation = 20,
    EdgeInsets? insetPadding,
    List<Widget>? actions,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    IconData? icon,
  }) {
    showDialog(
      context: context,
      builder: (ctx) {
        final theme = Theme.of(context);
        debugPrint("object");
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.symmetric(horizontal: 20.sp),
          shadowColor: theme.colorScheme.outline,
          clipBehavior: Clip.hardEdge,
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 19.sp),
              decoration: decoration(),
              child: child),
        );
      },
    );
  }

  static showSuccessDialogue({
    required BuildContext context,
    required String title,
    required String description,
    final String? svg,
    final TextStyle? titleTextStyle,
    final TextStyle? descriptionTextStyle,
    final Widget? actions,
    final double? iconHeight,
  }) {
    final theme = Theme.of(context);
    return showCommonDialogue(
      context: context,
      iconHeight: iconHeight,
      titleTextStyle: titleTextStyle,
      svgPath: svg,
      descriptionTextStyle: descriptionTextStyle,
      actions: actions,
      iconColor: theme.colorScheme.secondary,
      title: title,
      description: description,
    );
  }

  static BoxDecoration decoration() {
    return BoxDecoration(
        color: DarkColorsPalate.surfaceColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: DarkColorsPalate.boxOutlineDarkColor));
  }
}

class DynamicAppIcon extends StatelessWidget {
  const DynamicAppIcon({
    super.key,
    this.icon,
    this.svg,
    this.iconHeight,
    this.iconWidth,
    this.iconColor,
    this.fit,
    this.margins = EdgeInsets.zero,
  });

  final IconData? icon;
  final String? svg;
  final double? iconHeight;
  final double? iconWidth;
  final Color? iconColor;

  final BoxFit? fit;
  final EdgeInsetsGeometry margins;

  @override
  Widget build(BuildContext context) {
    if (svg != null) {
      return Padding(
        padding: margins,
        child: SvgPicture.asset(
          svg!,
          height: iconHeight,
          width: iconWidth,
          fit: fit ?? BoxFit.scaleDown,
          color: iconColor,
        ),
      );
    }
    return Padding(
      padding: margins,
      child: Icon(
        icon,
        size: iconHeight,
        color: iconColor,
      ),
    );
  }
}

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextScaler? scaleFactor;
  final void Function()? onTap;

  const AppText(
      this.text, {
        super.key,
        this.scaleFactor,
        this.onTap,
        this.style,
        this.textAlign,
        this.maxLines,
        this.overflow,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: style,
        softWrap: true,
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        textScaler: scaleFactor ?? const TextScaler.linear(1.0),
        overflow: overflow ?? TextOverflow.ellipsis,
      ),
    );
  }
}
