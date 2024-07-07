class ModelClass {
  String? pic1;
  String? pic2;
  String? pic3;
  String? pic4;
  String? pic5;
  String? pic6;
  String? pic7;
  String? pic8;
  String? pic9;
  String? pic10;
  String? title;
  String? apartment;
  String? apartdesc;
  String? apartdetdesc;
  String? description;
  String? price;
  String? city;
  String? detailedDescription;
  String? phone;
  String? cabincat;
  String? cabindesc;
  String? cabindetdesc;
  String? resortcat;
  String? resortdesc;
  String? resortdetdesc;
  String? yacht;
  String? yachtdesc;
  String? yachtdetdesc;

  ModelClass(
      {this.pic1,
      this.pic2,
      this.pic3,
      this.pic4,
      this.pic5,
      this.pic6,
      this.pic7,
      this.pic8,
      this.pic9,
      this.pic10,
      this.title,
      this.apartment,
      this.apartdesc,
      this.apartdetdesc,
      this.description,
      this.price,
      this.city,
      this.detailedDescription,
      this.phone,
      this.cabincat,
      this.cabindesc,
      this.cabindetdesc,
      this.resortcat,
      this.resortdesc,
      this.resortdetdesc,
      this.yacht,
      this.yachtdesc,
      this.yachtdetdesc});

  ModelClass.fromJson(Map<String, dynamic> json) {
    pic1 = json['pic1'];
    pic2 = json['pic2'];
    pic3 = json['pic3'];
    pic4 = json['pic4'];
    pic5 = json['pic5'];
    pic6 = json['pic6'];
    pic7 = json['pic7'];
    pic8 = json['pic8'];
    pic9 = json['pic9'];
    pic10 = json['pic10'];
    title = json['title'];
    apartment = json['apartment'];
    apartdesc = json['apartdesc'];
    apartdetdesc = json['apartdetdesc'];
    description = json['description'];
    price = json['price'];
    city = json['city'];
    detailedDescription = json['detailedDescription'];
    phone = json['phone'];
    cabincat = json['cabincat'];
    cabindesc = json['cabindesc'];
    cabindetdesc = json['cabindetdesc'];
    resortcat = json['resortcat'];
    resortdesc = json['resortdesc'];
    resortdetdesc = json['resortdetdesc'];
    yacht = json['yacht'];
    yachtdesc = json['yachtdesc'];
    yachtdetdesc = json['yachtdetdesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic1'] = this.pic1;
    data['pic2'] = this.pic2;
    data['pic3'] = this.pic3;
    data['pic4'] = this.pic4;
    data['pic5'] = this.pic5;
    data['pic6'] = this.pic6;
    data['pic7'] = this.pic7;
    data['pic8'] = this.pic8;
    data['pic9'] = this.pic9;
    data['pic10'] = this.pic10;
    data['title'] = this.title;
    data['apartment'] = this.apartment;
    data['apartdesc'] = this.apartdesc;
    data['apartdetdesc'] = this.apartdetdesc;
    data['description'] = this.description;
    data['price'] = this.price;
    data['city'] = this.city;
    data['detailedDescription'] = this.detailedDescription;
    data['phone'] = this.phone;
    data['cabincat'] = this.cabincat;
    data['cabindesc'] = this.cabindesc;
    data['cabindetdesc'] = this.cabindetdesc;
    data['resortcat'] = this.resortcat;
    data['resortdesc'] = this.resortdesc;
    data['resortdetdesc'] = this.resortdetdesc;
    data['yacht'] = this.yacht;
    data['yachtdesc'] = this.yachtdesc;
    data['yachtdetdesc'] = this.yachtdetdesc;
    return data;
  }
}
