

class AffectedCase {
  final String date;
  final String townshipname;
  final int effectedCount;

  AffectedCase({this.date, this.townshipname, this.effectedCount});

  factory AffectedCase.fromJson(Map<String, dynamic> json) {
    return new AffectedCase(
      date: json['date'] as String,
      townshipname: json['townshipname'] as String,
      effectedCount: json['effectedCount'] as int,
    );
  }
}