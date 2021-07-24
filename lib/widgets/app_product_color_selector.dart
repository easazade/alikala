import 'package:alikala/core/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppProductColorSelector extends StatefulWidget {
  final Map<String, Color> namesToColors;
  final void Function(String name, Color color) onChange;

  const AppProductColorSelector({required this.namesToColors, required this.onChange}) : super();

  @override
  State<StatefulWidget> createState() => _State(namesToColors);
}

class _State extends State<AppProductColorSelector> {
  late String _selectedColorName;

  _State(Map<String, Color> namesToColors) {
    if (namesToColors.isNotEmpty) {
      _selectedColorName = namesToColors.keys.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('رنگ: ' + _selectedColorName, style: TextStyles.dark_18_w500),
        SizedBox(height: 10),
        Row(
          children: List.generate(
            widget.namesToColors.length,
            (index) {
              var name = widget.namesToColors.keys.toList()[index];
              var color = widget.namesToColors.values.toList()[index];
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    _selectedColorName = name;
                  });
                  widget.onChange(name, color);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    border:
                        Border.all(color: (_selectedColorName == name) ? Colors.blue.shade200 : Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: (_selectedColorName == name) ? Colors.blue.shade200 : Colors.grey.shade200,
                        blurRadius: 0.6,
                        spreadRadius: 0.6,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: ShapeDecoration(shape: CircleBorder(), color: color),
                        child: (_selectedColorName == name) ? Icon(Icons.done, size: 16, color: Colors.white) : null,
                      ),
                      SizedBox(width: 8),
                      Text(name),
                      SizedBox(width: 12),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
