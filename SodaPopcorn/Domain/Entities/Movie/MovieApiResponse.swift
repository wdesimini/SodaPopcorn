//
//  MovieApiResponse.swift
//  SodaPopcorn
//
//  Created by Francisco Cordoba on 3/9/21.
//

import Foundation

public struct MovieApiResponse {
	let page: Int
	let numberOfResults: Int
	let numberOfPages: Int
	var movies: [Movie]
}

extension MovieApiResponse: Decodable {
	private enum MovieApiResponseCodingKeys: String, CodingKey {
		case page
		case numberOfResults = "total_results"
		case numberOfPages = "total_pages"
		case movies = "results"
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: MovieApiResponseCodingKeys.self)

		page = try container.decode(Int.self, forKey: .page)
		numberOfResults = try container.decode(Int.self, forKey: .numberOfResults)
		numberOfPages = try container.decode(Int.self, forKey: .numberOfPages)
		movies = try container.decode([Movie].self, forKey: .movies)
	}
}
