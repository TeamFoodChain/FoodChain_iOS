

import Foundation
struct Address_components : Codable {
	let long_name : String?
	let short_name : String?
	let types : [String]?

	enum CodingKeys: String, CodingKey {

		case long_name = "long_name"
		case short_name = "short_name"
		case types = "types"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		long_name = try values.decodeIfPresent(String.self, forKey: .long_name)
		short_name = try values.decodeIfPresent(String.self, forKey: .short_name)
		types = try values.decodeIfPresent([String].self, forKey: .types)
	}

}
