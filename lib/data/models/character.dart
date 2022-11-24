class Character {
  int? charId;
  String? name;
  List<dynamic>? appearanceOfSeasons;
  late String img;
  String? statusIfDeadOrAlive;
  String? nickname;
  List<dynamic>? jobs;
  String? actorName;
  String? categoryForTowSeries;
  List<dynamic>? betterCallSaulAppearance;

  Character(
      {this.charId,
      this.name,
      this.appearanceOfSeasons,
      required this.img,
      this.statusIfDeadOrAlive,
      this.nickname,
      this.jobs,
      this.actorName,
      this.categoryForTowSeries,
      this.betterCallSaulAppearance});

  Character.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    appearanceOfSeasons = json['occupation'].cast<String>();
    img = json['img'];
    statusIfDeadOrAlive = json['status'];
    nickname = json['nickname'];
    jobs = json['appearance'].cast<int>();
    actorName = json['portrayed'];
    categoryForTowSeries = json['category'];
    betterCallSaulAppearance = json['better_call_saul_appearance'];

    // if (json['better_call_saul_appearance'] != null) {
    //   betterCallSaulAppearance = <Null>[];
    //   json['better_call_saul_appearance'].forEach((v) {
    //     betterCallSaulAppearance!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['char_id'] = this.charId;
    data['name'] = this.name;
    data['occupation'] = this.appearanceOfSeasons;
    data['img'] = this.img;
    data['status'] = this.statusIfDeadOrAlive;
    data['nickname'] = this.nickname;
    data['appearance'] = this.jobs;
    data['portrayed'] = this.actorName;
    data['category'] = this.categoryForTowSeries;
    if (this.betterCallSaulAppearance != null) {
      data['better_call_saul_appearance'] =
          this.betterCallSaulAppearance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
