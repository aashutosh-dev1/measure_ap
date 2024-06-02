import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:measure_ap/presentation/resources/color_manager.dart';
import 'package:measure_ap/presentation/resources/custom_text_theme.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: _isExpanded ? null : 2,
          textAlign: TextAlign.center,
          overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: customTextStyle(
            fontSize: 14.0,
            color: ColorManager.lightGrey,
          ),
        ),
        const Gap(2.0),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Center(
            child: Text(_isExpanded ? "Hide" : "Show all",
                style: customTextStyle(
                  fontSize: 14.0,
                  color: ColorManager.orange,
                  fontWeight: FontWeight.w800,
                )),
          ),
        ),
      ],
    );
  }
}
