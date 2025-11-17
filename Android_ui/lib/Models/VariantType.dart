class VariantType {
  String? sId;
  String? name;
  String? createdAt;

  VariantType({this.sId, this.name});

  VariantType.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['name'] = name;
    data['createdAt'] = createdAt;
    return data;
  }
}