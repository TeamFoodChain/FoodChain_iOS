

import Foundation
struct Geocoding : Codable {
	let results : [GeoResults]?
	let status : String?

	enum CodingKeys: String, CodingKey {

		case results = "results"
		case status = "status"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		results = try values.decodeIfPresent([GeoResults].self, forKey: .results)
		status = try values.decodeIfPresent(String.self, forKey: .status)
	}

}
