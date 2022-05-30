class Faq {
  String? id;
  String? question;
  String? answer;

  Faq({this.id, this.question, this.answer});

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['question'] = question;
    _data['answer'] = answer;
    return _data;
  }

  // ignore: non_constant_identifier_names
  factory Faq.fromJson(Map<String, dynamic> Json) {
    Faq newFilter =
        Faq(id: Json['id'], question: Json['question'], answer: Json['answer']);
    return newFilter;
  }
}
