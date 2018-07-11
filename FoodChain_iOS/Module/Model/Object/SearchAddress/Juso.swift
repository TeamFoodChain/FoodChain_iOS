

import Foundation

struct Juso : Codable {
	let detBdNmList : String?
	let engAddr : String?
	let rn : String?
	let emdNm : String?
	let zipNo : String?
	let roadAddrPart2 : String?
	let emdNo : String?
	let sggNm : String?
	let jibunAddr : String?
	let siNm : String?
	let roadAddrPart1 : String?
	let bdNm : String?
	let admCd : String?
	let udrtYn : String?
	let lnbrMnnm : String?
	let roadAddr : String?
	let lnbrSlno : String?
	let buldMnnm : String?
	let bdKdcd : String?
	let liNm : String?
	let rnMgtSn : String?
	let mtYn : String?
	let bdMgtSn : String?
	let buldSlno : String?

	enum CodingKeys: String, CodingKey {

		case detBdNmList = "detBdNmList"
		case engAddr = "engAddr"
		case rn = "rn"
		case emdNm = "emdNm"
		case zipNo = "zipNo"
		case roadAddrPart2 = "roadAddrPart2"
		case emdNo = "emdNo"
		case sggNm = "sggNm"
		case jibunAddr = "jibunAddr"
		case siNm = "siNm"
		case roadAddrPart1 = "roadAddrPart1"
		case bdNm = "bdNm"
		case admCd = "admCd"
		case udrtYn = "udrtYn"
		case lnbrMnnm = "lnbrMnnm"
		case roadAddr = "roadAddr"
		case lnbrSlno = "lnbrSlno"
		case buldMnnm = "buldMnnm"
		case bdKdcd = "bdKdcd"
		case liNm = "liNm"
		case rnMgtSn = "rnMgtSn"
		case mtYn = "mtYn"
		case bdMgtSn = "bdMgtSn"
		case buldSlno = "buldSlno"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		detBdNmList = try values.decodeIfPresent(String.self, forKey: .detBdNmList)
		engAddr = try values.decodeIfPresent(String.self, forKey: .engAddr)
		rn = try values.decodeIfPresent(String.self, forKey: .rn)
		emdNm = try values.decodeIfPresent(String.self, forKey: .emdNm)
		zipNo = try values.decodeIfPresent(String.self, forKey: .zipNo)
		roadAddrPart2 = try values.decodeIfPresent(String.self, forKey: .roadAddrPart2)
		emdNo = try values.decodeIfPresent(String.self, forKey: .emdNo)
		sggNm = try values.decodeIfPresent(String.self, forKey: .sggNm)
		jibunAddr = try values.decodeIfPresent(String.self, forKey: .jibunAddr)
		siNm = try values.decodeIfPresent(String.self, forKey: .siNm)
		roadAddrPart1 = try values.decodeIfPresent(String.self, forKey: .roadAddrPart1)
		bdNm = try values.decodeIfPresent(String.self, forKey: .bdNm)
		admCd = try values.decodeIfPresent(String.self, forKey: .admCd)
		udrtYn = try values.decodeIfPresent(String.self, forKey: .udrtYn)
		lnbrMnnm = try values.decodeIfPresent(String.self, forKey: .lnbrMnnm)
		roadAddr = try values.decodeIfPresent(String.self, forKey: .roadAddr)
		lnbrSlno = try values.decodeIfPresent(String.self, forKey: .lnbrSlno)
		buldMnnm = try values.decodeIfPresent(String.self, forKey: .buldMnnm)
		bdKdcd = try values.decodeIfPresent(String.self, forKey: .bdKdcd)
		liNm = try values.decodeIfPresent(String.self, forKey: .liNm)
		rnMgtSn = try values.decodeIfPresent(String.self, forKey: .rnMgtSn)
		mtYn = try values.decodeIfPresent(String.self, forKey: .mtYn)
		bdMgtSn = try values.decodeIfPresent(String.self, forKey: .bdMgtSn)
		buldSlno = try values.decodeIfPresent(String.self, forKey: .buldSlno)
	}

}
