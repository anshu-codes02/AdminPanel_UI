class Product{
  String? sId;
  String? name;
  String? description;
  int? quantity;
  double? price;
  ProRef? proCategoryId;
  ProRef? proSubCategoryId;
  ProRef? proBrandId;
  ProRef? proVariantTypeId;
  List<String>? proVariantId;
  List<Image>? images;
  String? createdAt;
  String? updatedAt;


    Product(
      {this.sId,
        this.name,
        this.description,
        this.quantity,
        this.price,
        this.proCategoryId,
        this.proSubCategoryId,
        this.proBrandId,
        this.proVariantTypeId,
        this.proVariantId,
        this.images,
        this.createdAt,
        this.updatedAt,
      });

      Product.fromJson(Map<String,dynamic> json)
      {
        sId=json['_id'];        
        name=json['name'];
        description=json['description'];
        quantity=json['quantity'];
        price = json['price']?.toDouble();
    proCategoryId = json['Category'] != null
        ?  ProRef.fromJson(json['Category'])
        : null;
    proSubCategoryId = json['subCategory'] != null
        ?  ProRef.fromJson(json['subCategory'])
        : null;
    proBrandId = json['Brand'] != null
        ?  ProRef.fromJson(json['Brand'])
        : null;
    proVariantTypeId = json['variantType'] != null
        ? ProRef.fromJson(json['variantType'])
        : null;
   proVariantId = (json['variant'] != null) 
    ? List<String>.from(json['variant'])
    : [];
    if (json['images'] != null) {
      images = <Image>[];
      json['images'].forEach((v) {
        images!.add( Image.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
      }

  Map<String,dynamic> toJson()
{
  Map<String,dynamic> data={};
  data['name']= name;
   data['_id'] = sId;
  data['description']=description;
  data['price']=price;
  data['quantity']=quantity;
  if(proCategoryId!=null)
  {
    data['Category']=proCategoryId!.toJson();
  }
  if(proSubCategoryId!=null)
  {
    data['subCategory']=proSubCategoryId!.toJson();
  }
  if(proBrandId!=null)
  {
    data['Brand']=proBrandId!.toJson();
  }
  if(proVariantTypeId!=null)
  {
    data['variantType']=proVariantTypeId!.toJson();
  }
  data['variant']=proVariantId;
  if(images!=null)
  {
    data['images']=[];
    images!.forEach((element){
      data['images'].add(element.toJson());
    }
  );
  }
  data['createdAt']=createdAt;
  data['updatedAt']=updatedAt;
return data;
}
}

class ProRef {
  String? sId;
  String? name;

  ProRef({this.sId, this.name});

  ProRef.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class Image {
  int? image;
  String? url;
  String? sId;

  Image({this.image, this.url, this.sId});

  Image.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    url = json['url'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['image'] = image;
    data['url'] = url;
    data['_id'] = sId;
    return data;
  }
}