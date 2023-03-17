class ItemsModel {
  int? id;
  String? title;
  String? desc;
  int? quantity;
  ItemsModel({this.id, this.title, this.desc, this.quantity});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    quantity = json["quantity"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
//when we want to Auto increment we can not add ID
    data['title'] = this.title;
    data['desc'] = this.desc;
    data["quantity"] = this.quantity;
    return data;
  }
}
