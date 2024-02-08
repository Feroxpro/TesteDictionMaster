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

    private enum CodingKeys: String, CodingKey {
        case word, phonetic, phonetics, origin, meanings
    }
}

struct PhoneticInfo: Codable {
    let text: String?
    let audio: String?

    private enum CodingKeys: String, CodingKey {
        case text, audio
    }
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

    private enum CodingKeys: String, CodingKey {
        case definition, example, synonyms, antonyms
    }
}

