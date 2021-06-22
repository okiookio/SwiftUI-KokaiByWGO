//
//  SawasdeeModel.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-07.
//

import Foundation

struct LevelModel : Identifiable{
    var id: UUID
    var level_code : String
    var order_id : Int
    var level_name : String
    var level_description : String
    var column_chapter_per_row : String
    var image : String
    var background  : String
    
    
    func dictionaryFrom(level: LevelModel) -> [String : Any] {
        
        return NSDictionary(objects: [level.id,
                                      level.level_code,
                                      level.order_id,
                                      level.level_name,
                                      level.level_description,
                                      level.column_chapter_per_row,
                                      level.image,
                                      level.background
                                    ],
                            
                            forKeys: ["id" as NSCopying,
                                      "level_code" as NSCopying,
                                      "order_id" as NSCopying,
                                      "level_name" as NSCopying,
                                      "level_description" as NSCopying,
                                      "column_chapter_per_row" as NSCopying,
                                      "image" as NSCopying,
                                      "background" as NSCopying
        ]) as! [String : Any]
    }

}

struct ChapterModel : Identifiable{
    var id: UUID
    var level_code: String
    var chapter_code: String
    var order_id: Int
    var chapter_name: String
    var chapter_desctiption: String
    var column_chapter_per_row: String
    var image: String
    var background: String
    
    func dictionaryFrom(chapter: ChapterModel) -> [String : Any] {
        
        return NSDictionary(objects: [chapter.id,
                                      chapter.level_code,
                                      chapter.chapter_code,
                                      chapter.order_id,
                                      chapter.chapter_name,
                                      chapter.chapter_desctiption,
                                      chapter.column_chapter_per_row,
                                      chapter.image,
                                      chapter.background
                                    ],
                            
                            forKeys: ["id" as NSCopying,
                                      "level_code" as NSCopying,
                                      "chapter_code" as NSCopying,
                                      "order_id" as NSCopying,
                                      "chapter_name" as NSCopying,
                                      "chapter_desctiption" as NSCopying,
                                      "column_chapter_per_row" as NSCopying,
                                      "image" as NSCopying,
                                      "background" as NSCopying
        ]) as! [String : Any]
    }
}

struct SectionGroupModel {
    var section_group_code: String
    var section_name: String
    
    func dictionaryFrom(section: SectionGroupModel) -> [String : Any] {
        
        return NSDictionary(objects: [section.section_group_code,
                                      section.section_name
                                    ],
                            
                            forKeys: ["section_group_code" as NSCopying,
                                      "section_name" as NSCopying
        ]) as! [String : Any]
    }
}

struct SectionModel : Identifiable{
    var id: UUID
    var level_code: String
    var chapter_code: String
    var section_code: String
    var order_id: Int
    var section_group: String
    var section_name: String
    var section_descritpion: String
    var column_sentence_per_row: String
    var image: String
    
    func dictionaryFrom(section: SectionModel) -> [String : Any] {
        
        return NSDictionary(objects: [section.id,
                                      section.level_code,
                                      section.chapter_code,
                                      section.section_code,
                                      section.order_id,
                                      section.section_group,
                                      section.section_name,
                                      section.section_descritpion,
                                      section.column_sentence_per_row,
                                      section.image
                                    ],
                            
                            forKeys: ["id" as NSCopying,
                                      "level_code" as NSCopying,
                                      "chapter_code" as NSCopying,
                                      "section_code" as NSCopying,
                                      "order_id" as NSCopying,
                                      "section_group" as NSCopying,
                                      "section_name" as NSCopying,
                                      "section_descritpion" as NSCopying,
                                      "column_sentence_per_row" as NSCopying,
                                      "image" as NSCopying
        ]) as! [String : Any]
    }
}

struct SentenceModel : Hashable,Identifiable{
    var id: UUID
    var sentence_id: String
    var level_code: String
    var chapter_code: String
    var section_code: String
    var sentence_code: String
    var order_id: Int
    var sentence_text: String
    var word_list: [String]
    
    
    func dictionaryFrom(sentence: SentenceModel) -> [String : Any] {
        
        return NSDictionary(objects: [sentence.id,
                                      sentence.sentence_id,
                                      sentence.level_code,
                                      sentence.chapter_code,
                                      sentence.section_code,
                                      sentence.sentence_code,
                                      sentence.order_id,
                                      sentence.sentence_text,
                                      sentence.word_list
                                    ],
                            
                            forKeys: ["id" as NSCopying,
                                      "sentence_id" as NSCopying,
                                      "level_code" as NSCopying,
                                      "chapter_code" as NSCopying,
                                      "section_code" as NSCopying,
                                      "sentence_code" as NSCopying,
                                      "order_id" as NSCopying,
                                      "sentence_text" as NSCopying,
                                      "word_list" as NSCopying
        ]) as! [String : Any]
    }
}
