// filter_button.dart

import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final Function(bool) onPressed;
  final bool isActive;
  final Color? color; // 색상 정보 추가
  final IconData? iconData; // 아이콘 정보 추가

  FilterButton({
    required this.label,
    required this.onPressed,
    required this.isActive,
    this.color,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isActive ? Colors.grey : Colors.transparent,
          width: 2.0,
        ),
        borderRadius: BorderRadius.zero,
      ),
      child: ElevatedButton(
        onPressed: () {
          onPressed(!isActive);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(isActive ? Colors.white : Colors.white),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          minimumSize: MaterialStateProperty.all(Size(100, 40)),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
          //contentPadding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconData != null) // 아이콘이 전달된 경우에만 표시
                Icon(iconData, color: color, size: 16.0),
              //if (iconData == null) // 아이콘이 전달되지 않은 경우 원 아이콘 표시
              //  Icon(Icons.circle, color: color, size: 16.0),
              if (iconData != null) // 아이콘이 전달된 경우 뒤에 간격 추가
                SizedBox(width: 1),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
