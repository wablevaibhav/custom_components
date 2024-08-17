import 'dart:ui' as ui;

import 'package:custom_components/custom_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomTooltip extends StatefulWidget {
  static const toolTipAbove = 0;
  static const toolTipBelow = 1;
  static const toolTipRight = 2;
  static const toolTipLeft = 3;

  /// The text of the tooltip
  final String message;

  /// The message style of the tooltip
  final TextStyle messageTextStyle;

  /// The background color of the tooltip
  final Color backgroundColor;

  /// The width of the tooltip
  final double width;

  /// Whether tooltip prefers being above or below widget
  final bool? prefersAbove;

  /// The padding around tooltip and text
  final EdgeInsets messagePadding;

  /// The maximum number of lines for the message
  final int maxMessageLines;

  /// The child widget that will display the tooltip on tap
  final Widget child;

  /// The child widget to display when tooltip appears or is "active"
  final Widget activeChild;

  /// The minimum distance between left and right sides to tooltip
  final double minMargin;

  /// The TextOverflow for the message
  final TextOverflow messageTextOverflow;

  /// The maximum number of lines for the message
  final int? toolTipDirection;

  /// Should the text be centered in the bubble or not
  final TextAlign textAlign;

  /// auto size the bubble to match text width
  /// this will override width, textAlign and maxMessageLines parameters
  final bool autoSizeEnabled;

  /// Whether mobile
  final bool isMobile;

  /// Absolute X position
  final double? absoluteX;

  /// Absolute Y position
  final double? absoluteY;

  /// message widget child below the text
  final Widget? messageWidget;

  /// message widget extra amount of height
  final double messageWidgetHeight;

  ///disable tapping outside of message bubble dismiss the message
  final bool mobileBackgroundExitEnabled;

  /// Callback on cancel/close action
  final VoidCallback? closeCallback;

  CustomTooltip({
    super.key,
    required this.message,
    required this.child,
    TextStyle? textStyle,
    Color? backgroundColor,
    required this.width,
    this.prefersAbove,
    this.messagePadding = const EdgeInsets.all(16),
    this.maxMessageLines = 10,
    this.minMargin = 15.0,
    this.messageTextOverflow = TextOverflow.ellipsis,
    this.toolTipDirection,
    this.textAlign = TextAlign.left,
    this.autoSizeEnabled = false,
    Widget? activeChild,
    required this.isMobile,
    this.absoluteX,
    this.absoluteY,
    this.messageWidget,
    this.messageWidgetHeight = 20,
    this.mobileBackgroundExitEnabled = true,
    this.closeCallback,
  })  : messageTextStyle = textStyle ??
            CustomTextStyle.bodyText1.withColor(CustomColors.white),
        backgroundColor = backgroundColor ?? CustomColors.primary,
        activeChild = activeChild ?? child;

  @override
  State<CustomTooltip> createState() => _CustomTooltipState();
}

class _CustomTooltipState extends State<CustomTooltip> {
  OverlayEntry? _overlayEntry;
  int _toolTipDirection = 0;
  bool _isDisplayingTooltip = false;
  int _maxMessageLines = 1;
  bool _isMouseHover = false;
  GlobalKey widgetKey = GlobalKey();

  @override
  void initState() {
    if (widget.prefersAbove == null || widget.prefersAbove == true) {
      _toolTipDirection = CustomTooltip.toolTipAbove;
    } else if (widget.prefersAbove != null && widget.prefersAbove == false) {
      _toolTipDirection = CustomTooltip.toolTipBelow;
    }
    if (widget.toolTipDirection != null &&
        widget.toolTipDirection! >= 0 &&
        widget.toolTipDirection! <= 3) {
      _toolTipDirection = widget.toolTipDirection!;
    }

    _maxMessageLines = widget.maxMessageLines;

    super.initState();
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomTooltip oldWidget) {
    if (widget.prefersAbove == null || widget.prefersAbove == true) {
      _toolTipDirection = CustomTooltip.toolTipAbove;
    } else if (widget.prefersAbove != null && widget.prefersAbove == false) {
      _toolTipDirection = CustomTooltip.toolTipBelow;
    }
    if (widget.toolTipDirection != null &&
        widget.toolTipDirection! >= 0 &&
        widget.toolTipDirection! <= 3) {
      _toolTipDirection = widget.toolTipDirection!;
    }
    _maxMessageLines = widget.maxMessageLines;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _onMouseHover,
      onExit: _onMouseExit,
      child: GestureDetector(
        onTap: _onPressed,
        child: _isDisplayingTooltip && (!kIsWeb || widget.isMobile)
            ? widget.activeChild
            : widget.child,
      ),
    );
  }

  void _onMouseHover(PointerHoverEvent? onHover) {
    if (!kIsWeb || widget.isMobile) return;

    if (_isDisplayingTooltip) {
      return;
    }
    _isMouseHover = true;
    _addOverlay();
  }

  void _onMouseExit(PointerExitEvent? onHover) {
    if (!kIsWeb || widget.isMobile) return;

    if (!_isDisplayingTooltip) {
      return;
    }
    _isMouseHover = false;
    _removeOverlay();
  }

  void _onPressed() {
    if (_isMouseHover) return;

    if (_isDisplayingTooltip) {
      _removeOverlay();
    } else {
      _addOverlay();
    }
  }

  void _addOverlay() {
    _overlayEntry = _createOverlayEntry();
    if (_overlayEntry != null) {
      Overlay.of(context).insert(_overlayEntry!);
      setState(() {
        _isDisplayingTooltip = true;
      });
    }
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      setState(() {
        _isDisplayingTooltip = false;
        if (widget.closeCallback != null) {
          widget.closeCallback!();
        }
      });
    }
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    widgetKey = GlobalKey();

    final box = context.findRenderObject()! as RenderBox;
    final size = box.size;

    final parentOffset = box.localToGlobal(Offset.zero);
    final offsetX = widget.absoluteX ?? parentOffset.dx;
    final offsetY = widget.absoluteY ?? parentOffset.dy;

    Offset offset = Offset(offsetX, offsetY);

    var width = widget.width;
    //minimum width to avoid rendering errors is 50 px
    if (width < 50) {
      width = 50;
    }
    var textAlign = widget.textAlign;
    if (widget.autoSizeEnabled && widget.messageWidget == null) {
      width = getTextWidth(
          widget.message, widget.messageTextStyle, widget.messagePadding);
      textAlign = TextAlign.center;
    }

    var infoDialogKnotchWidth = 0.0;
    if (_toolTipDirection == CustomTooltip.toolTipRight ||
        _toolTipDirection == CustomTooltip.toolTipLeft) {
      infoDialogKnotchWidth = 10;
    }
    const infoDialogKnotchHeight = 10.0;
    final messageWidth = width -
        widget.messagePadding.left -
        widget.messagePadding.right -
        infoDialogKnotchWidth;

    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.message,
        style: widget.messageTextStyle,
      ),
      maxLines: _maxMessageLines,
      textAlign: TextAlign.left,
      textDirection: ui.TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: messageWidth);

    final infoDialogWidth =
        messageWidth + widget.messagePadding.left + widget.messagePadding.right;
    var infoDialogHeight = textPainter.size.height +
        widget.messagePadding.top +
        widget.messagePadding.bottom;

    if (widget.messageWidget != null) {
      infoDialogHeight += widget.messageWidgetHeight;
    }

    double infoDialogX = _getInfoDialogX(
      toolTipDirection: _toolTipDirection,
      offset: offset,
      size: size,
      infoDialogWidth: infoDialogWidth,
      knotchHeight: infoDialogKnotchWidth,
    );

    double infoDialogY = _getInfoDialogY(
      offset: offset,
      knotchHeight: infoDialogKnotchHeight,
      dialogHeight: infoDialogHeight,
      parentHeight: size.height,
    );

    var knotchOffset = 0.0;

    return OverlayEntry(
      opaque: false,
      builder: (context) {
        return GestureDetector(
          key: widgetKey,
          onTap: () {
            if (widget.mobileBackgroundExitEnabled) {
              _removeOverlay();
            }
          },
          child: Material(
            color: Colors.transparent,
            type: (!kIsWeb || widget.isMobile)
                ? MaterialType.card
                : MaterialType.transparency,
            child: GestureDetector(
              onTap: () => {_removeOverlay()},
              child: LayoutBuilder(
                builder: (_, constraints) {
                  if (_toolTipDirection == CustomTooltip.toolTipAbove) {
                    if (infoDialogY < 0) {
                      _toolTipDirection = CustomTooltip.toolTipBelow;
                      infoDialogY = _getInfoDialogY(
                        offset: offset,
                        dialogHeight: infoDialogHeight,
                        knotchHeight: infoDialogKnotchHeight,
                        parentHeight: size.height,
                      );
                    }
                  } else if (_toolTipDirection == CustomTooltip.toolTipRight) {
                    if (infoDialogX + infoDialogWidth > constraints.maxWidth) {
                      _toolTipDirection = CustomTooltip.toolTipAbove;
                      infoDialogX = _getInfoDialogX(
                        toolTipDirection: _toolTipDirection,
                        offset: offset,
                        size: size,
                        infoDialogWidth: infoDialogWidth,
                        knotchHeight: infoDialogKnotchWidth,
                      );
                      infoDialogY = _getInfoDialogY(
                        offset: offset,
                        dialogHeight: infoDialogHeight,
                        knotchHeight: infoDialogKnotchHeight,
                        parentHeight: size.height,
                      );
                    }
                  } else if (_toolTipDirection == CustomTooltip.toolTipLeft) {
                    if (infoDialogX < 0) {
                      _toolTipDirection = CustomTooltip.toolTipAbove;
                      infoDialogX = _getInfoDialogX(
                        toolTipDirection: _toolTipDirection,
                        offset: offset,
                        size: size,
                        infoDialogWidth: infoDialogWidth,
                        knotchHeight: infoDialogKnotchWidth,
                      );
                      infoDialogY = _getInfoDialogY(
                        offset: offset,
                        dialogHeight: infoDialogHeight,
                        knotchHeight: infoDialogKnotchHeight,
                        parentHeight: size.height,
                      );
                    }
                  } else {
                    if (infoDialogY + infoDialogHeight >
                        constraints.maxHeight) {
                      _toolTipDirection = CustomTooltip.toolTipAbove;
                      infoDialogY = _getInfoDialogY(
                        offset: offset,
                        dialogHeight: infoDialogHeight,
                        knotchHeight: infoDialogKnotchHeight,
                        parentHeight: size.height,
                      );
                    }
                  }

                  final minimumX = widget.minMargin;
                  final maximumX = constraints.maxWidth - widget.minMargin;

                  if (infoDialogX + infoDialogWidth > maximumX) {
                    knotchOffset = -(maximumX - infoDialogX - infoDialogWidth);
                    infoDialogX = maximumX - infoDialogWidth;
                  } else if (infoDialogX < minimumX) {
                    knotchOffset = infoDialogX - widget.minMargin;
                    infoDialogX = minimumX;
                  }

                  final RenderBox widgetBox =
                      widgetKey.currentContext?.findRenderObject() as RenderBox;
                  Offset localOffset = widgetBox.localToGlobal(Offset.zero);

                  infoDialogY -= localOffset.dy;

                  return Stack(
                    children: [
                      Positioned(
                        top: infoDialogY,
                        left: infoDialogX,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: width,
                          ),
                          child: _InfoDialog(
                            backgroundColor: widget.backgroundColor,
                            knotchOffsetPercentage: 0.5,
                            textStyle: widget.messageTextStyle,
                            message: widget.message,
                            messageWidget: widget.messageWidget,
                            textPadding: widget.messagePadding,
                            knotchHeight: infoDialogKnotchHeight,
                            messageWidth: infoDialogWidth,
                            messageHeight: infoDialogHeight,
                            toolTipDirection: _toolTipDirection,
                            overflowKnotchOffset: knotchOffset,
                            textOverflow: widget.messageTextOverflow,
                            maxLines: _maxMessageLines,
                            textAlign: textAlign,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  double _getInfoDialogY({
    required Offset offset,
    required double dialogHeight,
    required double knotchHeight,
    required double parentHeight,
  }) {
    if (_toolTipDirection == CustomTooltip.toolTipAbove) {
      return offset.dy - dialogHeight - knotchHeight;
    } else if (_toolTipDirection == CustomTooltip.toolTipRight) {
      return offset.dy - (dialogHeight / 2) + parentHeight / 2;
    } else if (_toolTipDirection == CustomTooltip.toolTipLeft) {
      return offset.dy - (dialogHeight / 2) + parentHeight / 2;
    } else {
      return offset.dy + parentHeight;
    }
  }
}

double getTextWidth(
    String text, TextStyle textStyle, EdgeInsets messagePadding) {
  TextSpan span = TextSpan(
    text: text,
    style: textStyle,
  );
  TextPainter painter = TextPainter(
    text: span,
    textAlign: TextAlign.left,
    textDirection: TextDirection.ltr,
  );
  painter.layout();
  double width = painter.width;
  return width + messagePadding.right + messagePadding.left;
}

double _getInfoDialogX({
  required int toolTipDirection,
  required Offset offset,
  required double infoDialogWidth,
  required Size size,
  required double knotchHeight,
}) {
  if (toolTipDirection == CustomTooltip.toolTipAbove) {
    return offset.dx + (size.width / 2.0) - (infoDialogWidth / 2.0);
  } else if (toolTipDirection == CustomTooltip.toolTipRight) {
    return offset.dx + size.width;
  } else if (toolTipDirection == CustomTooltip.toolTipLeft) {
    return offset.dx - infoDialogWidth - knotchHeight;
  } else {
    return offset.dx + (size.width / 2.0) - (infoDialogWidth / 2.0);
  }
}

class _InfoDialog extends StatelessWidget {
  final knotchWidth = 10.0;

  final TextStyle textStyle;
  final String message;
  final Widget? messageWidget;
  final double
      knotchOffsetPercentage; // The % offset of knotch center wrt the start of frame
  final Color backgroundColor;
  final EdgeInsets textPadding;
  final double knotchHeight;
  final double messageWidth;
  final double messageHeight;
  final int toolTipDirection;
  final double overflowKnotchOffset;
  final TextOverflow textOverflow;
  final int maxLines;
  final TextAlign textAlign;

  const _InfoDialog({
    required this.textStyle,
    required this.message,
    required this.messageWidget,
    required this.knotchOffsetPercentage,
    required this.backgroundColor,
    required this.textPadding,
    required this.knotchHeight,
    required this.messageWidth,
    required this.messageHeight,
    required this.toolTipDirection,
    required this.overflowKnotchOffset,
    required this.textOverflow,
    required this.maxLines,
    required this.textAlign,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final knotchOffsetX =
        messageWidth * knotchOffsetPercentage - knotchWidth / 2.0;

    var widgets = [_messageBubble()];
    if (toolTipDirection == CustomTooltip.toolTipAbove) {
      widgets.add(_triangle(messageWidth, knotchOffsetX));
      return Column(
        children: widgets,
      );
    } else if (toolTipDirection == CustomTooltip.toolTipRight) {
      widgets.insert(0, _triangle(messageWidth, knotchOffsetX));
      return Row(
        children: widgets,
      );
    } else if (toolTipDirection == CustomTooltip.toolTipLeft) {
      widgets.add(_triangle(messageWidth, knotchOffsetX));
      return Row(
        children: widgets,
      );
    } else {
      widgets.insert(0, _triangle(messageWidth, knotchOffsetX));
      return Column(
        children: widgets,
      );
    }
  }

  Widget _triangle(double totalWidth, double knotchOffsetX) {
    var sizeBoxWidth = totalWidth;
    var positionedLeft = knotchOffsetX + overflowKnotchOffset;
    if (toolTipDirection == CustomTooltip.toolTipRight ||
        toolTipDirection == CustomTooltip.toolTipLeft) {
      sizeBoxWidth = knotchWidth;
      positionedLeft = 0;
    }
    return SizedBox(
      width: sizeBoxWidth,
      height: knotchHeight,
      child: Stack(
        children: [
          Positioned(
            left: positionedLeft,
            child: _trianglePaint(),
          ),
        ],
      ),
    );
  }

  Widget _messageBubble() {
    Widget childText = Text(
      message,
      style: textStyle,
      overflow: textOverflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );
    Widget child = childText;
    if (messageWidget != null) {
      child = SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            childText,
            const SizedBox(height: 16),
            messageWidget!,
          ],
        ),
      );
    }

    return Container(
      width: messageWidth,
      height: messageHeight,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      padding: textPadding,
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: child,
    );
  }

  Widget _trianglePaint() {
    return CustomPaint(
      painter: _TrianglePainter(
        color: backgroundColor,
        direction: toolTipDirection,
      ),
      child: SizedBox(
        height: knotchHeight,
        width: knotchWidth,
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;
  final paintingStyle = PaintingStyle.fill;
  final int direction;

  _TrianglePainter({
    required this.color,
    required this.direction,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    if (direction == CustomTooltip.toolTipAbove) {
      return Path()
        ..moveTo(0, 0)
        ..lineTo(x / 2, y)
        ..lineTo(x, 0)
        ..lineTo(0, 0);
    } else if (direction == CustomTooltip.toolTipRight) {
      return Path()
        ..moveTo(x, y)
        ..lineTo(x, 0)
        ..lineTo(0, y / 2)
        ..lineTo(x, y);
    } else if (direction == CustomTooltip.toolTipLeft) {
      return Path()
        ..moveTo(0, 0)
        ..lineTo(x, y / 2)
        ..lineTo(0, y)
        ..lineTo(0, 0);
    } else {
      return Path()
        ..moveTo(0, y)
        ..lineTo(x, y)
        ..lineTo(x / 2, 0)
        ..lineTo(0, y);
    }
  }

  @override
  bool shouldRepaint(_TrianglePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.paintingStyle != paintingStyle;
  }
}
