
import Foundation

struct Common : Codable {
	let errorMessage : String?
	let countPerPage : String?
	let totalCount : String?
	let errorCode : String?
	let currentPage : String?

	enum CodingKeys: String, CodingKey {

		case errorMessage = "errorMessage"
		case countPerPage = "countPerPage"
		case totalCount = "totalCount"
		case errorCode = "errorCode"
		case currentPage = "currentPage"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		errorMessage = try values.decodeIfPresent(String.self, forKey: .errorMessage)
		countPerPage = try values.decodeIfPresent(String.self, forKey: .countPerPage)
		totalCount = try values.decodeIfPresent(String.self, forKey: .totalCount)
		errorCode = try values.decodeIfPresent(String.self, forKey: .errorCode)
		currentPage = try values.decodeIfPresent(String.self, forKey: .currentPage)
	}

}
