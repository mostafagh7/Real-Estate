import 'package:real_estate/features/Realestate/data/models/model.dart';
import '../../../../core/data_source/model.dart';

class RealestateDetailsModel extends BaseModel {
  String? id;
  String? createdAt;
  String? updatedAt;
  // UserModel? user;
  DefaultModel? country;
  DefaultModel? city;
  DefaultModel? district;
  DefaultModel? subDistrict;
  DefaultModel? category;
  DefaultModel? subCategory;
  String? ownerType;
  String? subScriptionPlanId;
  String? status;
  String? phoneNumber;
  int? area;
  double? price;
  String? posterUrl;
  String? realestateGroup;
  String? realestateSample;
  bool? isFavorite;
  String? title;
  String? description;
  String? nearestPoint;
  String? commName;
  String? fullAddress;
  String? avenueName;
  int? streetNo;
  int? districtNo;
  double? lng;
  double? lat;
  int? views;
  bool? isSold;
  bool? isPublished;
  bool? isAddedFromDashboard;
  String? expiresAt;
  List<String>? images;
  String? video;
  String? offerType;
  String? payType;
  String? ownershipType;
  String? installmentDetails;
  List<String>? features;
  int? age;
  int? noOfRooms;
  int? noOfBedRooms;
  int? noOfBathRooms;
  int? noOfLivingRooms;
  int? noOfFloors;
  int? noOfApartments;
  int? parkingCapacity;
  double? frontageWidth;
  double? frontageDepth;
  double? constructionArea;
  double? gardenArea;
  String? flooringType;
  String? claddingType;
  String? windowType;
  String? nearbyType;
  String? facingDirection;
  String? residencyType;
  bool? forGender;
  String? buildingComplexGroup;
  String? blockNumber;
  String? buildingNumber;
  int? floorNumber;
  int? flatNumber;
  int? noOfUnits;
  int? similarRealestatesCount;
  // List<SimilarRealestateModel>? similarRealestates;

  RealestateDetailsModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    // this.user,
    this.country,
    this.city,
    this.district,
    this.subDistrict,
    this.category,
    this.subCategory,
    this.ownerType,
    this.subScriptionPlanId,
    this.status,
    this.phoneNumber,
    this.area,
    this.price,
    this.posterUrl,
    this.realestateGroup,
    this.realestateSample,
    this.isFavorite,
    this.title,
    this.description,
    this.nearestPoint,
    this.commName,
    this.fullAddress,
    this.avenueName,
    this.streetNo,
    this.districtNo,
    this.lng,
    this.lat,
    this.views,
    this.isSold,
    this.isPublished,
    this.isAddedFromDashboard,
    this.expiresAt,
    this.images,
    this.video,
    this.offerType,
    this.payType,
    this.ownershipType,
    this.installmentDetails,
    this.features,
    this.age,
    this.noOfRooms,
    this.noOfBedRooms,
    this.noOfBathRooms,
    this.noOfLivingRooms,
    this.noOfFloors,
    this.noOfApartments,
    this.parkingCapacity,
    this.frontageWidth,
    this.frontageDepth,
    this.constructionArea,
    this.gardenArea,
    this.flooringType,
    this.claddingType,
    this.windowType,
    this.nearbyType,
    this.facingDirection,
    this.residencyType,
    this.forGender,
    this.buildingComplexGroup,
    this.blockNumber,
    this.buildingNumber,
    this.floorNumber,
    this.flatNumber,
    this.noOfUnits,
    this.similarRealestatesCount,
  });

  factory RealestateDetailsModel.fromJson(Map<String, dynamic> json) => RealestateDetailsModel(
    id: json["id"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    // user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    country: json["country"] != null ? DefaultModel.fromJson(json["country"]) : null,
    city: json["city"] != null ? DefaultModel.fromJson(json["city"]) : null,
    district: json["district"] != null ? DefaultModel.fromJson(json["district"]) : null,
    subDistrict: json["subDistrict"] != null ? DefaultModel.fromJson(json["subDistrict"]) : null,
    category: json["category"] != null ? DefaultModel.fromJson(json["category"]) : null,
    subCategory: json["subCategory"] != null ? DefaultModel.fromJson(json["subCategory"]) : null,
    ownerType: json["ownerType"],
    subScriptionPlanId: json["subScriptionPlanId"],
    status: json["status"],
    phoneNumber: json["phoneNumber"],
    area: json["area"],
    price: json["price"] != null ? double.parse(json["price"].toString()) : null,
    posterUrl: json["posterUrl"],
    realestateGroup: json["realestateGroup"],
    realestateSample: json["realestateSample"],
    isFavorite: json["isFavorite"],
    title: json["title"],
    description: json["description"],
    nearestPoint: json["nearestPoint"],
    commName: json["commName"],
    fullAddress: json["fullAddress"],
    avenueName: json["avenueName"],
    streetNo: json["streetNo"],
    districtNo: json["districtNo"],
    lng: json["lng"] != null ? double.parse(json["lng"].toString()) : null,
    lat: json["lat"] != null ? double.parse(json["lat"].toString()) : null,
    views: json["views"],
    isSold: json["isSold"],
    isPublished: json["isPublished"],
    isAddedFromDashboard: json["isAddedFromDashboard"],
    expiresAt: json["expiresAt"],
    images: json["images"] != null ? List<String>.from(json["images"]) : null,
    video: json["video"],
    offerType: json["offerType"],
    payType: json["payType"],
    ownershipType: json["ownershipType"],
    installmentDetails: json["installmentDetails"],
    features: json["features"] != null ? List<String>.from(json["features"]) : null,
    age: json["age"],
    noOfRooms: json["noOfRooms"],
    noOfBedRooms: json["noOfBedRooms"],
    noOfBathRooms: json["noOfBathRooms"],
    noOfLivingRooms: json["noOfLivingRooms"],
    noOfFloors: json["noOfFloors"],
    noOfApartments: json["noOfApartments"],
    parkingCapacity: json["parkingCapacity"],
    frontageWidth: json["frontageWidth"] != null ? double.parse(json["frontageWidth"].toString()) : null,
    frontageDepth: json["frontageDepth"] != null ? double.parse(json["frontageDepth"].toString()) : null,
    constructionArea: json["constructionArea"] != null ? double.parse(json["constructionArea"].toString()) : null,
    gardenArea: json["gardenArea"] != null ? double.parse(json["gardenArea"].toString()) : null,
    flooringType: json["flooringType"],
    claddingType: json["claddingType"],
    windowType: json["windowType"],
    nearbyType: json["nearbyType"],
    facingDirection: json["facingDirection"],
    residencyType: json["residencyType"],
    forGender: json["forGender"],
    buildingComplexGroup: json["buildingComplexGroup"],
    blockNumber: json["blockNumber"],
    buildingNumber: json["buildingNumber"],
    floorNumber: json["floorNumber"],
    flatNumber: json["flatNumber"],
    noOfUnits: json["noOfUnits"],
    similarRealestatesCount: json["similarRealestatesCount"],
 
  );
}
