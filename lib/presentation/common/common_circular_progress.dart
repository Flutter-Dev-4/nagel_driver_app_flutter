import 'package:driver_app/export.dart';
import 'package:driver_app/presentation/common/custom_dialogues.dart';

class CommonCircularProgress extends StatelessWidget {
  const CommonCircularProgress({
    super.key,
    required this.progressVal,
    required this.title,
    required this.value,
    this.titleStyle,
    this.valueStyle,
    this.heightWidth = 130,
    this.thickness = 8,
  });
  final double progressVal;
  final String title;
  final String value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final double heightWidth;
  final double thickness;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: heightWidth,
      width: heightWidth,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 43,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  title,
                  style: titleStyle ?? theme.textTheme.titleLarge,
                ),
                AppText(
                  value,
                  style: valueStyle ??
                      theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: heightWidth,
            width: heightWidth,
            child: Transform.rotate(
              angle: 29.2,
              child: CircularProgressIndicator(
                strokeAlign: BorderSide.strokeAlignInside,
                value: .7,
                color: theme.colorScheme.onSurface,
                strokeWidth: thickness,
                strokeCap: StrokeCap.round,
              ),
            ),
          ),
          SizedBox(
            height: heightWidth,
            width: heightWidth,
            child: Transform.rotate(
              angle: 29.2,
              child: CircularProgressIndicator(
                strokeAlign: BorderSide.strokeAlignInside,
                value: progressVal / 100 * 0.7,
                color: theme.colorScheme.secondary,
                strokeWidth: thickness,
                strokeCap: StrokeCap.round,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
