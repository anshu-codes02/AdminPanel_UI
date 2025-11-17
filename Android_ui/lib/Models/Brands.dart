
class Brand{
  String? name;
  subCategory? subcategoryId;
  String? createdAt;
  String? updatedAt;
  String? sId;
  
   Brand({this.sId, this.name, this.subcategoryId, this.createdAt, this.updatedAt});

   Brand.fromJson(Map<String,dynamic> json)
   {
     sId=json['_id'];
     name=json['name'];
     subcategoryId=json['subCategory']!=null?
      subCategory.fromJson(json['subCategory']): null;
      createdAt=json['createdAt'];
      updatedAt=json['updatedAt'];
   }

   Map<String,dynamic> toJson(){
    Map<String,dynamic> data={};
    data['_id']=sId;
    data['name']=name;
    if(subcategoryId!=null)
    {
      data['subCategory']=subcategoryId!.toJson();
    }
     data['createdAt'] = createdAt;
    data['updatedAt'] =  updatedAt;
    return data;
   }
}

class subCategory{
  String? name;
  String? sId;
  
   subCategory({this.sId, this.name});

   subCategory.fromJson(Map<String,dynamic> json)
   {
     sId = json['_id'];
    name = json['name'];
   }

   Map<String,dynamic> toJson(){
    Map<String,dynamic> data={};
    data['_id']=sId;
    data['name']=name;
    return data;
   }
}