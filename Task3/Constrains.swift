//
//  Constrains.swift
//  Task3
//
//  Created by Kirolos on 4/15/19.
//  Copyright © 2019 Kirolos. All rights reserved.
//

import Foundation


let BEST_SELLER_URL = "http://www.salonidepot.com/app/app.asmx/GetBestSellers?pageIndex=-1&loginUserId=0&countryId=1&currencyId=1"
let BRANDS_URL = "http://www.salonidepot.com/app/app.asmx/GetBrands?pageIndex=-1&userId=0&countryId=1&currencyId=1"

typealias competionHandler = (_ Success : Bool) -> ()
