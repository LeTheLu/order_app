import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_app/utils/text_styte.dart';
String text = 'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.';

class WidgetProductDetail extends StatefulWidget{
  const WidgetProductDetail({Key? key}) : super(key: key);

  @override
  State<WidgetProductDetail> createState() => _WidgetProductDetail();
}

class _WidgetProductDetail extends State<WidgetProductDetail> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ExpansionPanelList(
      elevation: 0,
      animationDuration: const Duration(milliseconds: 1000),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return Container(
              alignment: Alignment.centerLeft,
              child: const Text('Product Detail', style: StyleUtils.H2),
            );
          },
          body: ListTile(
            title: Text(text,style: StyleUtils.H3),
          ),
          canTapOnHeader: true,
          isExpanded: _expanded,
        ),
      ],
      dividerColor: Colors.grey,
      expansionCallback: (panelIndex, isExpanded) {
        _expanded = !_expanded;
        setState(() {
        });
      },
    );
  }
}

class WidgetNutrition extends StatefulWidget{
  const WidgetNutrition({Key? key}) : super(key: key);

  @override
  State<WidgetNutrition> createState() => _WidgetNutrition();
}

class _WidgetNutrition extends State<WidgetNutrition> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ExpansionPanelList(
      elevation: 0,
      animationDuration: const Duration(milliseconds: 1000),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nutritions', style: StyleUtils.H2),
                SvgPicture.asset("assets/icons/100g.svg")
              ],
            );
          },
          body: ListTile(
            title: Text(text,style: StyleUtils.H3),
          ),
          canTapOnHeader: true,
          isExpanded: _expanded,
        ),
      ],
      dividerColor: Colors.grey,
      expansionCallback: (panelIndex, isExpanded) {
        _expanded = !_expanded;
        setState(() {
        });
      },
    );
  }
}

class WidgetReview extends StatefulWidget{
  const WidgetReview({Key? key}) : super(key: key);

  @override
  State<WidgetReview> createState() => _WidgetReview();
}

class _WidgetReview extends State<WidgetReview> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ExpansionPanelList(
      elevation: 0,
      animationDuration: const Duration(milliseconds: 1000),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Review', style: StyleUtils.H2),
                SvgPicture.asset("assets/icons/reviewStar.svg")
              ],
            );
          },
          body: ListTile(
            title: Text(text,style: StyleUtils.H3),
          ),
          canTapOnHeader: true,
          isExpanded: _expanded,
        ),
      ],
      dividerColor: Colors.grey,
      expansionCallback: (panelIndex, isExpanded) {
        _expanded = !_expanded;
        setState(() {
        });
      },
    );
  }
}