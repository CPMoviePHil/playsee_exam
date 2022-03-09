class Exam {
  List<P>? p;

  Exam({this.p});

  Exam.fromJson(Map<String, dynamic> json) {
    if (json['p'] != null) {
      p = <P>[];
      json['p'].forEach((v) { p!.add(P.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (p != null) {
      data['p'] = p!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class P {
  int? at;
  Att? att;
  List<int>? count;
  String? desc;
  String? id;
  bool? isFavorite;
  String? isPrv;
  List<String>? plc;
  List<int>? private;
  List<String>? source;

  P({this.at, this.att, this.count, this.desc, this.id, this.isFavorite, this.isPrv, this.plc, this.private, this.source});

  P.fromJson(Map<String, dynamic> json) {
    at = json['at'];
    att = json['att'] != null ? Att.fromJson(json['att']) : null;
    count = json['count'].cast<int>();
    desc = json['desc'];
    id = json['id'];
    isFavorite = json['is_favorite'];
    isPrv = json['is_prv'];
    plc = json['plc'].cast<String>();
    private = json['private'].cast<int>();
    source = json['source'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['at'] = at;
    if (att != null) {
      data['att'] = att!.toJson();
    }
    data['count'] = count;
    data['desc'] = desc;
    data['id'] = id;
    data['is_favorite'] = isFavorite;
    data['is_prv'] = isPrv;
    data['plc'] = plc;
    data['private'] = private;
    data['source'] = source;
    return data;
  }
}

class Att {
  String? id;
  int? l;
  String? pIds;
  String? type;

  Att({this.id, this.l, this.pIds, this.type});

  Att.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    l = json['l'];
    pIds = json['p_ids'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['l'] = l;
    data['p_ids'] = pIds;
    data['type'] = type;
    return data;
  }
}
