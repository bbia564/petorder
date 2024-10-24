class PSRecordModel {
  int? id;
  String? type;
  double? amount;
  String? petName;
  int? petAge;
  int? gender;
  String? phone;
  String? iconname;
  int? finished;
  int? createTime;

  String? realAmount;

  bool get isFinish => finished == 1;

  PSRecordModel(
      {this.id,
      this.type,
      this.amount,
      this.petName,
      this.petAge,
      this.gender,
      this.phone,
      this.iconname,
      this.finished,
      this.realAmount,
      this.createTime});

  PSRecordModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    amount = json['amount'];
    petName = json['petName'];
    petAge = json['petAge'];
    gender = json["gender"];
    phone = json['phone'];
    finished = json['finished'];
    iconname = json['iconname'];
    realAmount = json['realAmount'];
    createTime = json["createTime"];
  }
}
