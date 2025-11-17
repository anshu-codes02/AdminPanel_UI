class Variant{
  String? name;
  String? sId;
  VariantTypeId? variantTypeId;
  String? createdAt;

  Variant({ required this.sId,required this.name,required this.variantTypeId});

   Variant.fromJson(Map<String,dynamic> json){
      name=json['name'];
      sId=json['_id'];
      if(json['variantTypeId']!=null)
      {
        variantTypeId=VariantTypeId.fromJson(json['variantTypeId']);
      }
      createdAt=json['createdAt'];
    
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data={};
    data['name']=name;
    data['_id']=sId;
    if(variantTypeId!=null)
    {
      data['variantTypeId']=variantTypeId!.toJson();
    }
    data['createdAt'] = createdAt;
    return data;
  }
}

class VariantTypeId{
  String? name;
  String? sId;
  VariantTypeId({ this.name,required this.sId});

   VariantTypeId.fromJson(Map<String,dynamic> json){
      name=json['name'];
      sId=json['_id'];
    
  }

  Map<String,dynamic> toJson(){ 
    final Map<String,dynamic> data={};
    data['name']=name;
    data['_id']=sId;
    return data;
  }
}