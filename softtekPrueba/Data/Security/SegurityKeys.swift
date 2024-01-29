//
//  SegurityKeys.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import Foundation
import CryptoKit

class SegurityKeys {
    // Función para derivar una clave desde una cadena utilizando SHA-256
    static func deriveKey(from string: String) -> SymmetricKey {
        let keyData = Data(string.utf8)
        let hashed = SHA256.hash(data: keyData)
        return SymmetricKey(data: hashed)
    }

    // Función para cifrar un String con una clave String
    static func encryptString(inputString: String, key: String) throws -> String {
        let key = deriveKey(from: key)
        let inputData = inputString.data(using: .utf8)!

        // Cifra los datos
        let sealedBox = try AES.GCM.seal(inputData, using: key)

        // Devuelve los datos cifrados como String
        return Data(sealedBox.combined!).base64EncodedString()
    }

    // Función para descifrar un String con una clave String
    static func decryptString(encryptedString: String, key: String) throws -> String {
        let key = deriveKey(from: key)

        // Decodifica el String base64 a datos
        guard let encryptedData = Data(base64Encoded: encryptedString) else {
            throw CryptoError.invalidBase64String
        }

        // Abre el sello (nonce) desde los datos cifrados
        let sealedBox = try AES.GCM.SealedBox(combined: encryptedData)

        // Descifra los datos
        let decryptedData = try AES.GCM.open(sealedBox, using: key)

        // Convierte los datos descifrados a un String
        guard let decryptedString = String(data: decryptedData, encoding: .utf8) else {
            throw CryptoError.decryptionFailed
        }

        return decryptedString
    }
}

enum CryptoError: Error {
    case invalidBase64String
    case decryptionFailed
}
