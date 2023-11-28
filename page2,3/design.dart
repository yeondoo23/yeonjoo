/*네일아트 디자인 클래스*/
class Design {
  int? designNo; //디자인 번호
  String? designImageUrl; //디자인 url


  Design({
    this.designNo,
    this.designImageUrl,
  });

  Design.fromJson(Map<String, dynamic> json) {
    designNo = int.parse(json['productNo']);
    designImageUrl = json['productImageUrl'];
  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = {};

    data['designNo'] = designNo;
    data['designImageUrl'] = designImageUrl;

    return data;

  }
}