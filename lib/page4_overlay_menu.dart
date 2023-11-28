import 'package:flutter/material.dart';
import 'filter_button.dart';
import 'page5_search_results.dart';

class OverlayMenu extends StatefulWidget {
  final Function(List<String>) onApplyFilters;

  OverlayMenu({required this.onApplyFilters});

  @override
  _OverlayMenuState createState() => _OverlayMenuState();
}

class _OverlayMenuState extends State<OverlayMenu> {
  List<String> selectedFilters = [];

  List<Map<String, dynamic>> filterOptions = [
    {"name": "위치", "isUnique": false, "tags": ["신촌", "홍대", "강남", "신림"]},
    {"name": "분위기", "isUnique": false, "tags": ["단정한", "화려한", "귀여운", "힙한"]},
    {"name": "색상", "isUnique": false, "tags": ["레드", "오렌지", "옐로우", "그린", "블루", "퍼플", "핑크", "베이지", "화이트", "블랙", "골드", "실버"]},
    {"name": "스타일", "isUnique": false, "tags": ["그라데이션", "글리터", "시럽", "프렌치", "마블", "파츠", "체크", "캐릭터", "하트", "형광", "니트", "드로잉", "도트", "야광", "엠보", "리본"]},
  ];

  void _toggleFilter(String filter, bool isUnique) {
    setState(() {
      if (isUnique) {
        selectedFilters.clear();
      }

      if (selectedFilters.contains(filter)) {
        selectedFilters.remove(filter);
      } else {
        selectedFilters.add(filter);
      }
    });
  }

  void _applyFilters() {
    int numberOfProducts = _getFilteredProductsCount(selectedFilters);
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsPage(selectedFilters: selectedFilters),
      ),
    );
  }

  void _resetChoices() {
    setState(() {
      selectedFilters.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final menuWidth = 500.0;
    final menuHeight = 800.0;
    final buttonWidth = menuWidth * 0.23;
    final spacingWidth = menuWidth * 0.015;

    return Positioned(
      top: 50,
      right: 0,
      child: Container(
        width: menuWidth,
        height: menuHeight,//MediaQuery.of(context).size.height,
        color: Colors.white,
        padding: EdgeInsets.all(2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (var optionGroup in filterOptions)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      optionGroup["name"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Wrap(
                      spacing: spacingWidth,
                      runSpacing: 10,
                      children: List.generate(
                        (optionGroup["tags"] as List<String>).length,
                        (index) {
                          return MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              width: buttonWidth,
                              child: FilterButton(
                                label: (optionGroup["tags"] as List<String>)[index],
                                onPressed: (isActive) {
                                  _toggleFilter((optionGroup["tags"] as List<String>)[index], optionGroup["isUnique"]);
                                },
                                isActive: selectedFilters.contains((optionGroup["tags"] as List<String>)[index]),
                                color: optionGroup["name"] == "색상" ? _getTagColor((optionGroup["tags"] as List<String>)[index]) : null,
                                iconData: optionGroup["name"] == "색상" ? _getTagIcon((optionGroup["tags"] as List<String>)[index]) : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 12),
                  ],
                ),
                SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _resetChoices,
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(130, 60)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // 모서리 둥근 형태로 변경
                          side: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.cached),
                        SizedBox(width: 8),
                        Text("선택 초기화", style: TextStyle(fontSize: 18, color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _applyFilters,
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(130, 60)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // 모서리 둥근 형태로 변경
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child: Text("N개 상품보기", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getTagColor(String tagName) {
    switch (tagName) {
      case "레드":
        return Colors.red;
      case "오렌지":
        return Colors.orange;
      case "옐로우":
        return Colors.yellow;
      case "그린":
        return Colors.green;
      case "블루":
        return Colors.blue;
      case "퍼플":
        return Colors.purple;
      case "핑크":
        return Colors.pink;
      case "베이지":
        return Colors.brown;
      case "화이트":
        return Colors.white;
      case "블랙":
        return Colors.black;
      case "골드":
        return Colors.yellowAccent;
      case "실버":
        return Colors.grey;
      default:
        return Colors.transparent;
    }
  }

  IconData? _getTagIcon(String tagName) {
    switch (tagName) {
      case "그라데이션":
        return Icons.palette;
      case "글리터":
        return Icons.stars;
      case "시럽":
        return Icons.local_drink;
      case "레드":
        return Icons.circle;
      case "오렌지":
        return Icons.circle;
      case "옐로우":
        return Icons.circle;
      case "그린":
        return Icons.circle;
      case "블루":
        return Icons.circle;
      case "퍼플":
        return Icons.circle;
      case "핑크":
        return Icons.circle;
      case "베이지":
        return Icons.circle;
      case "화이트":
        return Icons.circle;
      case "블랙":
        return Icons.circle;
      case "골드":
        return Icons.circle;
      case "실버":
        return Icons.circle;
      default:
        return null;
    }
  }

  int _getFilteredProductsCount(List<String> filters) {
    // 실제 데이터 검색 및 개수 반환 로직을 구현해야 함
    // 이 부분은 실제 데이터 검색을 수행하는 부분으로 수정이 필요함
    return 42; // 예시로 임의의 숫자인 42를 반환
  }
}
