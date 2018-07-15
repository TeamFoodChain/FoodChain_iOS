/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Markets : Codable {
	let mar_locate_long : Double?
	let mar_idx : Int?
	let mar_locate_lat : Double?
	let mar_addr : String?
    let mar_name : String?

	enum CodingKeys: String, CodingKey {

		case mar_locate_long = "mar_locate_long"
		case mar_idx = "mar_idx"
		case mar_locate_lat = "mar_locate_lat"
		case mar_addr = "mar_addr"
        case mar_name = "mar_name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		mar_locate_long = try values.decodeIfPresent(Double.self, forKey: .mar_locate_long)
		mar_idx = try values.decodeIfPresent(Int.self, forKey: .mar_idx)
		mar_locate_lat = try values.decodeIfPresent(Double.self, forKey: .mar_locate_lat)
		mar_addr = try values.decodeIfPresent(String.self, forKey: .mar_addr)
        mar_name = try values.decodeIfPresent(String.self, forKey: .mar_name)
	}

}
