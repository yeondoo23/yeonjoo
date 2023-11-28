import 'package:flutter/material.dart';

class SearchResultsPage extends StatelessWidget {
  final List<String> selectedFilters;

  SearchResultsPage({required this.selectedFilters});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filterImages = [
      {"url": "http://dh.aks.ac.kr/Edu/wiki/images/thumb/b/b6/Sc.jpg/600px-Sc.jpg", "tags": ["신촌", "분위기1", "레드", "스타일1"]},
      // ... (이미지 데이터 계속 추가)
      // @ 이미지 데이터 베이스 연동
    ];

    List<Map<String, dynamic>> filteredResults = filterImages.where((image) {
      for (var filter in selectedFilters) {
        if (!image["tags"].contains(filter)) {
          return false;
        }
      }
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Search Results"),
      ),
      body: Column(
        children: [
          // 선택된 필터 임시 출력
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Selected Filters: ${selectedFilters.join(', ')}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: filteredResults.length,
              itemBuilder: (context, index) {
                return Image.network(filteredResults[index]["url"], fit: BoxFit.cover);
              },
            ),
          ),
        ],
      ),
    );
  }
}
