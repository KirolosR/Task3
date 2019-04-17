//
//  Data.swift
//  Task3
//
//  Created by Kirolos on 4/15/19.
//  Copyright © 2019 Kirolos. All rights reserved.
//

import Foundation

struct BestSeller : Decodable {
    
    var  Id : Int?
    var  TitleEN : String?
    var  TitleAR : String?
    var  DescriptionEN : String?
    var  DescriptionAR : String?
    var  HowToUseEN : String?
    var  HowToUseAR : String?
    var  CategoryId : Int?
    var  CategoryEN : String?
    var  CategoryAR : String?
    var  havespecialspecification :Bool?
    var  BrandId : Int?
    var  BrandEN : String?
    var  BrandAR : String?
    var  UserId : Int?
    var  FullName :String?
    var  ComName : String?
    var  UserName : String?
    var  Logo : String?
    var  YoutubeLink : String?
    var  OfferStatus : Int?
    var  OfferStatusEN  : String?
    var  OfferStatusAR : String?
    var  PromoFromDate : String?
    var  PromoToDate : String?
    var  CurrencyId  : Int?
    var  CurrencyCode :Int?
    var  CurrencyEN : String?
    var  CurrencyAR : String?
    var  SymbolEN : String?
    var  SymbolAR : String?
    var  Price : String?
    var  FinalPrice : String?
    var  IsValid : Bool?
    var  IsPromo : Bool?
    var  IsAvailable : Bool?
    var  IsFavorite :Bool?
    var  Photo : String?
    var  AddedOnDate : String?
    var  ProductPhotos : [ProductPhotos]?
    var  ProductSizes : [ProductSizes]?
    
    
}

struct Brand : Decodable{
    var  Id : Int?
    var TitleEN : String?
    var  TitleAR  : String?
    var  Photo : String?
}

struct ProductSizes : Decodable{

    var  ProductSizeId : Int?
    var  SizeUnitId : Int
    var  SizeUnitEN : String?
    var  SizeUnitAR : String?
    var  SizeAmount : Int?
    var  CurrencyId : Int?
    var  CurrencyCode : Int?
    var  CurrencyEN : String?
    var  CurrencyAR : String?
    var  SymbolEN : String?
    var  SymbolAR : String?
    var  Price : String?
    var  Barcode : String?
    var  Systemcode : String?
    var  TitleEN : String?
    var  TitleAR : String?
    var  FinalPrice : String?
    var  Colors : [String]?
}

struct ProductPhotos : Decodable {
    var  ProductPhotoId : Int?
    var  Photo : String?
}
