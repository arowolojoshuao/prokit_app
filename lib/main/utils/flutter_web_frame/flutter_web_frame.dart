library flutter_web_frame;

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

import '../../../fullApps/appetit/utils/ACommon.dart';
import 'src/frame_content.dart';
import 'src/media_query_observer.dart';

class FlutterWebFrame extends StatefulWidget {
  /// If not [enabled], the [child] is used directly.
  final bool enabled;

  /// The previewed widget.
  ///
  /// It is common to give the root application widget.
  final WidgetBuilder builder;

  /// Background color in white space
  final Color? backgroundColor;

  /// Maximum size
  final Size maximumSize;

  /// Clip behavior
  final Clip clipBehavior;

  const FlutterWebFrame({
    Key? key,
    required this.builder,
    this.enabled = true,
    this.backgroundColor,
    required this.maximumSize,
    this.clipBehavior = Clip.none,
  }) : super(key: key);

  /// A global builder that should be inserted into [WidgetApp]'s builder
  /// to simulated the simulated device screen and platform properties.
  static Widget appBuilder(
    BuildContext context,
    Widget? widget,
  ) {
    if (!_isEnabled(context)) {
      return widget ?? SizedBox();
    }

    if (!_isEnabled(context)) return widget ?? SizedBox();

    return MediaQuery(
      data: _mediaQuery(context),
      child: Theme(
        data: Theme.of(context).copyWith(
          visualDensity: _isEnabled(context) ? VisualDensity.standard : null,
        ),
        child: widget ?? SizedBox(),
      ),
    );
  }

  static MediaQueryData _mediaQuery(BuildContext context) {
    return FrameContent.mediaQuery(
      context,
      context.findAncestorStateOfType<_FlutterWebFrameState>()?.widget.maximumSize ?? Size(375.0, 812.0),
    );
  }

  static bool _isEnabled(BuildContext context) {
    final state = context.findAncestorStateOfType<_FlutterWebFrameState>();
    return state != null && state.widget.enabled;
  }

  @override
  _FlutterWebFrameState createState() => _FlutterWebFrameState();
}

class _FlutterWebFrameState extends State<FlutterWebFrame> {
  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return Builder(
        builder: widget.builder,
      );
    }

    return Container(
      color: widget.backgroundColor ?? Theme.of(context).dividerColor,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 400),
        child: MediaQueryObserver(
          child: Builder(
            builder: (context) => Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: widget.enabled ? Builder(builder: _buildPreview) : Builder(builder: widget.builder),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPreview(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: RepaintBoundary(
        child: FrameContent(
          size: widget.maximumSize,
          clipBehavior: widget.clipBehavior,
          footerSection: Container(
            alignment: Alignment.center,
            decoration: boxDecorationWithShadow(backgroundColor: context.cardColor),
            width: context.width(),
            child: Column(
              children: [
                Divider(height: 0, color: context.dividerColor),
                Text(copyRightText, style: secondaryTextStyle(size: 12), textDirection: TextDirection.ltr).paddingAll(12),
              ],
            ),
          ),
          child: Builder(builder: widget.builder),
          headerSection: Container(
            width: context.width(),
            color: context.cardColor,
            child: Column(
              children: [
                8.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: [
                    commonCachedNetworkImage('images/app/app_icon-removebg.png', height: 60, width: 60, color: Colors.red, fit: BoxFit.cover),
                    16.width,
                    Text(mainAppName, style: boldTextStyle(size: 16), textDirection: TextDirection.ltr),
                  ],
                ).paddingOnly(left: 16),
                Divider(height: 0, color: context.dividerColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
