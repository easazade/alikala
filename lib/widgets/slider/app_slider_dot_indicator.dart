import 'package:flutter/material.dart';

class AppCarouselDotIndicator extends StatelessWidget {
  List<int> _indexes;
  final int _selectedIndex;

  AppCarouselDotIndicator(this._selectedIndex, int itemCount) {
    _indexes = List<int>();
    for (int i = 0; i < itemCount; i++) {
      _indexes.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _indexes.map((index) {
        return _createIndicator(index == _selectedIndex);
      }).toList(),
    );
  }

  Widget _createIndicator(bool isSelected) {
    return Container(
      height: 8.0,
      width: 8.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.black.withAlpha(210) : Colors.black.withAlpha(120),
      ),
    );
  }
}
