/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Data : Codable {
	let pro_idx : Int?
//    let pro_cate : String?
	let pro_name : String?
	let pro_origin : String?
	let pro_price : Int?
	let pro_sale_price : Int?
	let pro_ex_date : String?
	let pro_regist_date : String?
	let pro_info : String?
	let mar_idx : Int?
    let pro_img:String?

	enum CodingKeys: String, CodingKey {

		case pro_idx = "pro_idx"
//        case pro_cate = "pro_cate"
		case pro_name = "pro_name"
		case pro_origin = "pro_origin"
		case pro_price = "pro_price"
		case pro_sale_price = "pro_sale_price"
		case pro_ex_date = "pro_ex_date"
		case pro_regist_date = "pro_regist_date"
		case pro_info = "pro_info"
		case mar_idx = "mar_idx"
        case pro_img = "pro_img"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		pro_idx = try values.decodeIfPresent(Int.self, forKey: .pro_idx)
//        pro_cate = try values.decodeIfPresent(String.self, forKey: .pro_cate)
		pro_name = try values.decodeIfPresent(String.self, forKey: .pro_name)
		pro_origin = try values.decodeIfPresent(String.self, forKey: .pro_origin)
		pro_price = try values.decodeIfPresent(Int.self, forKey: .pro_price)
		pro_sale_price = try values.decodeIfPresent(Int.self, forKey: .pro_sale_price)
		pro_ex_date = try values.decodeIfPresent(String.self, forKey: .pro_ex_date)
		pro_regist_date = try values.decodeIfPresent(String.self, forKey: .pro_regist_date)
		pro_info = try values.decodeIfPresent(String.self, forKey: .pro_info)
		mar_idx = try values.decodeIfPresent(Int.self, forKey: .mar_idx)
        pro_img = try values.decodeIfPresent(String.self, forKey: .pro_img)
	}

}
