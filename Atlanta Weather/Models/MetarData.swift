//
//  MetarData.swift
//  Atlanta Weather
//
//  Created by Dylan Welch on 1/19/24.
//

import Foundation

struct MetarData: Codable {
    let metarId: Int?
    let icaoId: String?
    let receiptTime: String?
    let observationTime: Int?
    let reportTime: String?
    let temp: Double?
    let dewPoint: Double?
    let windDirection: Int?
    let windSpeed: Int?
    let windGust: Int?
    let visibility: Double?
    let altim: Double?
    let seaLevelPressure: Double?
    let qcField: Int?
    let wxString: String?
    let presTend: String?
    let maxT: String?
    let minT: String?
    let maxT24: String?
    let minT24: String?
    let precipitation: Double?
    let precipitation3Hr: String?
    let precipitation6Hr: String?
    let precipitation24Hr: String?
    let snow: String?
    let verticalVisibility: String?
    let metarType: String?
    let rawObservation: String?
    let mostRecent: Int?
    let latitude: Double?
    let longitude: Double?
    let elevation: Int?
    let prior: Int?
    let airportName: String?
    let clouds: [Cloud]?

    enum CodingKeys: String, CodingKey {
        case metarId = "metar_id"
        case icaoId
        case receiptTime
        case observationTime = "obsTime"
        case reportTime
        case temp
        case dewPoint
        case altim
        case qcField
        case wxString
        case presTend
        case maxT
        case minT
        case maxT24
        case minT24
        case snow
        case metarType
        case mostRecent
        case prior
        case clouds
        case windDirection = "wdir"
        case windSpeed = "wspd"
        case windGust = "wgst"
        case visibility = "visib"
        case seaLevelPressure = "slp"
        case precipitation = "precip"
        case precipitation3Hr = "pcp3hr"
        case precipitation6Hr = "pcp6hr"
        case precipitation24Hr = "pcp24hr"
        case verticalVisibility = "vertVis"
        case rawObservation = "rawOb"
        case latitude = "lat"
        case longitude = "lon"
        case elevation = "elev"
        case airportName = "name"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.metarId = try container.decodeIfPresent(Int.self, forKey: .metarId)
        self.icaoId = try container.decodeIfPresent(String.self, forKey: .icaoId)
        self.receiptTime = try container.decodeIfPresent(String.self, forKey: .receiptTime)
        self.observationTime = try container.decodeIfPresent(Int.self, forKey: .observationTime)
        self.reportTime = try container.decodeIfPresent(String.self, forKey: .reportTime)
        self.temp = try container.decodeIfPresent(Double.self, forKey: .temp)
        self.dewPoint = try container.decodeIfPresent(Double.self, forKey: .dewPoint)
        self.windDirection = try container.decodeIfPresent(Int.self, forKey: .windDirection)
        self.windSpeed = try container.decodeIfPresent(Int.self, forKey: .windSpeed)
        self.windGust = try container.decodeIfPresent(Int.self, forKey: .windGust)
        self.visibility = try container.decodeIfPresent(Double.self, forKey: .visibility)
        self.altim = try container.decodeIfPresent(Double.self, forKey: .altim)
        self.seaLevelPressure = try container.decodeIfPresent(Double.self, forKey: .seaLevelPressure)
        self.qcField = try container.decodeIfPresent(Int.self, forKey: .qcField)
        self.wxString = try container.decodeIfPresent(String.self, forKey: .wxString)
        self.presTend = try container.decodeIfPresent(String.self, forKey: .presTend)
        self.maxT = try container.decodeIfPresent(String.self, forKey: .maxT)
        self.minT = try container.decodeIfPresent(String.self, forKey: .minT)
        self.maxT24 = try container.decodeIfPresent(String.self, forKey: .maxT24)
        self.minT24 = try container.decodeIfPresent(String.self, forKey: .minT24)
        self.precipitation = try container.decodeIfPresent(Double.self, forKey: .precipitation)
        self.precipitation3Hr = try container.decodeIfPresent(String.self, forKey: .precipitation3Hr)
        self.precipitation6Hr = try container.decodeIfPresent(String.self, forKey: .precipitation6Hr)
        self.precipitation24Hr = try container.decodeIfPresent(String.self, forKey: .precipitation24Hr)
        self.snow = try container.decodeIfPresent(String.self, forKey: .snow)
        self.verticalVisibility = try container.decodeIfPresent(String.self, forKey: .verticalVisibility)
        self.metarType = try container.decodeIfPresent(String.self, forKey: .metarType)
        self.rawObservation = try container.decodeIfPresent(String.self, forKey: .rawObservation)
        self.mostRecent = try container.decodeIfPresent(Int.self, forKey: .mostRecent)
        self.latitude = try container.decodeIfPresent(Double.self, forKey: .latitude)
        self.longitude = try container.decodeIfPresent(Double.self, forKey: .longitude)
        self.elevation = try container.decodeIfPresent(Int.self, forKey: .elevation)
        self.prior = try container.decodeIfPresent(Int.self, forKey: .prior)
        self.airportName = try container.decodeIfPresent(String.self, forKey: .airportName)
        self.clouds = try container.decodeIfPresent([Cloud].self, forKey: .clouds)
    }
}

struct Cloud: Codable {
    let cover: String?
    let base: Int?
}
