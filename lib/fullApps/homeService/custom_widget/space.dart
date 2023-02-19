import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Space extends LeafRenderObjectWidget {
  final double mainAxisExtent;

  Space(this.mainAxisExtent, {Key? key}) : assert(mainAxisExtent >= 0 && mainAxisExtent <= double.infinity), super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderSpace(mainAxisExtent: mainAxisExtent);
  }

  @override
  void updateRenderObject(BuildContext context, RenderSpace renderObject) {
    renderObject.mainAxisExtent = mainAxisExtent;
  }
}


class RenderSpace extends RenderBox {
  double _mainAxisExtent;

  RenderSpace({double? mainAxisExtent}) : _mainAxisExtent = mainAxisExtent!;

  double get mainAxisExtent => _mainAxisExtent;

  set mainAxisExtent(double value) {
    if (_mainAxisExtent != value) {
      _mainAxisExtent = value;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {

    final AbstractNode flex = parent!;

    if (flex is RenderFlex) {
      if (flex.direction == Axis.horizontal) {
        size = constraints.constrain(Size(mainAxisExtent, 0));
      } else {
        size = constraints.constrain(Size(0, mainAxisExtent));
      }
    } else {
      throw 'Space widget is not inside flex parent';
    }
  }
}
