

import Foundation

struct Results : Codable {
	let common : Common?
	let juso : [Juso]?

	enum CodingKeys: String, CodingKey {

		case common = "common"
		case juso = "juso"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		common = try values.decodeIfPresent(Common.self, forKey: .common)
		juso = try values.decodeIfPresent([Juso].self, forKey: .juso)
	}

}
