import 'dart:typed_data';

import 'package:fast_rsa/fast_rsa.dart' as fastRsa;
import 'package:fast_rsa/fast_rsa.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:pointycastle/key_generators/api.dart';
import 'package:pointycastle/key_generators/rsa_key_generator.dart';

Future<String> encryptRSA({required String payload, required String publicKey}) async {
  try {
    // Encrypt the payload using RSA with OAEP padding
    String encryptedData = await fastRsa.RSA.encryptOAEP(
      payload,
      '', // Empty string for label
      fastRsa.Hash.SHA256,
      publicKey,
    );
    return encryptedData;
  } catch (e) {
    if (e is fastRsa.RSAException) {
      print('RSAException occurred: ${e.cause}');
      return ''; // Return empty string or handle the error as needed
    } else {
      print('An unexpected error occurred: $e');
      return ''; // Return empty string or handle the error as needed
    }
  }
}

void main() async {


  // Generate RSA key pair parameters

  // Create RSA key generator

  // Generate RSA key pair

  // Get the public key

  KeyPair keyPair1 = await RSA.generate(2048);
 // print(keyPair1.privateKey);
 // print(keyPair1.publicKey);
 // print('Encrypted message:;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;');
  // Your RSA public key here
  print(keyPair1.publicKey);
  String encryptedMessage = await encryptRSA(payload: 'akbhhhhhhhhhhhh', publicKey:keyPair1.publicKey.toString());
  print(encryptedMessage);
}
//keyPair1.publicKey.toString()