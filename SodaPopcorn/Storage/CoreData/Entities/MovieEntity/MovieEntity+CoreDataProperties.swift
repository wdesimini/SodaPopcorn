//
//  MovieEntity+CoreDataProperties.swift
//  SodaPopcorn
//
//  Created by Zimplifica Macbook Pro on 13/9/21.
//

import Foundation
import CoreData

extension MovieEntity {

	@nonobjc public class func fetchRequest() -> NSFetchRequest<MovieEntity> {
		return NSFetchRequest<MovieEntity>(entityName: "MovieEntity")
	}

	@NSManaged public var id: Int
	@NSManaged public var posterPath: String
	@NSManaged public var backdrop: String
	@NSManaged public var title: String
	@NSManaged public var releaseDate: String
	@NSManaged public var rating: Double
	@NSManaged public var overview: String
	@NSManaged public var popularity: Double
	@NSManaged public var voteCount: Int
	@NSManaged public var posterImageData: Data?
}