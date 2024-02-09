//
//  ResultModel.swift
//  DictionMaster
//
//  Created by Felipe Henrique Domingos on 08/02/24.
//

struct Word: Codable {
    let word: String?
    let phonetic: String?
    let phonetics: [PhoneticInfo]?
    let origin: String?
    let meanings: [Meaning]?
}

struct PhoneticInfo: Codable {
    let text: String?
    let audio: String?
}

struct Meaning: Codable {
    let partOfSpeech: String?
    let definitions: [Definition]?

    private enum CodingKeys: String, CodingKey {
        case partOfSpeech = "partOfSpeech"
        case definitions
    }
}

struct Definition: Codable {
    let definition: String?
    let example: String?
    let synonyms: [String]?
    let antonyms: [String]?
}

