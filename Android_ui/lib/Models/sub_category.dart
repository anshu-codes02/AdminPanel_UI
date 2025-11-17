
class SubCategory{
  String? name;
  CategoryId? categoryId;
  String? createdAt;
  String? updatedAt;
  String? sId;
  
  SubCategory({this.sId, this.name, this.categoryId, this.createdAt, this.updatedAt});

   SubCategory.fromJson(Map<String,dynamic> json)
   {
     sId=json['_id'];
     name=json['name'];
     categoryId=json['CategoryId']!=null?
      CategoryId.fromJson(json['CategoryId']): null;
      createdAt=json['createdAt'];
      updatedAt=json['updatedAt'];
   }

   Map<String,dynamic> toJson(){
    Map<String,dynamic> data={};
    data['_id']=sId;
    data['name']=name;
    if(categoryId!=null)
    {
      data['CategoryId']=categoryId!.toJson();
    }
     data['createdAt'] = createdAt;
    data['updatedAt'] =  updatedAt;
    return data;
   }
}

class CategoryId{
  String? name;
  String? sId;
  
   CategoryId({this.sId, this.name});

   CategoryId.fromJson(Map<String,dynamic> json)
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