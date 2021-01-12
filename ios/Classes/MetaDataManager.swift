//
//  MetaDataManager.swift
//  audio_metadata
//
//  Created by Denis Dudka on 12.01.2021.
//


import Foundation
import ID3TagEditor
import AVKit

extension URL {
    var attributes: [FileAttributeKey : Any]? {
        do {
            return try FileManager.default.attributesOfItem(atPath: path)
        } catch let error as NSError {
            print("FileAttribute error: \(error)")
        }
        return nil
    }

    var fileSize: UInt64 {
        return attributes?[.size] as? UInt64 ?? UInt64(0)
    }

    var creationDate: Date? {
        return attributes?[.creationDate] as? Date
    }
}


class MetaDataManager {
    
    static func getMetaData(filePath: String) -> [String: Any] {
        var result: [String: Any] = [:]
        
        do {
            let id3TagEditor = ID3TagEditor()
            
            if let id3Tag = try id3TagEditor.read(from: filePath) {
                result["title"] = (id3Tag.frames[.title] as? ID3FrameWithStringContent)?.content
                result["artist"] = (id3Tag.frames[.artist] as? ID3FrameWithStringContent)?.content
                result["album"] = (id3Tag.frames[.album] as? ID3FrameWithStringContent)?.content
                result["album_artist"] = (id3Tag.frames[.albumArtist] as? ID3FrameWithStringContent)?.content
                result["copyright"] = (id3Tag.frames[.copyright] as? ID3FrameWithStringContent)?.content
                result["subtitle"] = (id3Tag.frames[.subtitle] as? ID3FrameWithStringContent)?.content
                result["genre"] = (id3Tag.frames[.genre] as? ID3FrameWithStringContent)?.content
                result["original_filename"] = (id3Tag.frames[.originalFilename] as? ID3FrameWithStringContent)?.content
                result["file_owner"] = (id3Tag.frames[.fileOwner] as? ID3FrameWithStringContent)?.content
            }
            
            let fileUrl: URL = URL(string: filePath)!
            result["size_in_bytes"] = fileUrl.fileSize
            result["creation_date_stamp"] = fileUrl.creationDate?.timeIntervalSince1970
            
            let asset = AVURLAsset(url: fileUrl, options: nil)
            result["length_in_milliseconds"] = CMTimeGetSeconds(asset.duration)
            
        } catch {
            return result
        }
        return result
    }
    
}



