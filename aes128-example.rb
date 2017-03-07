require "openssl"
require "base64"

include Base64

plain_text = "The beatings will continue until morale improves"

cipher = OpenSSL::Cipher::AES128.new(:CBC)
cipher.encrypt
key = cipher.random_key
iv = cipher.random_iv
cipher_text = cipher.update(plain_text) + cipher.final

cipher = OpenSSL::Cipher::AES128.new(:CBC)
cipher.decrypt
cipher.key = key
cipher.iv = iv
decrypted_plain_text = cipher.update(cipher_text) + cipher.final

puts "AES128 in CBC mode"
puts "Key: " + urlsafe_encode64(key)
puts "Iv: " + urlsafe_encode64(iv)
puts "Plain text: " + plain_text
puts "Cipher text: " + urlsafe_encode64(cipher_text)
puts "Decrypted plain text: " + decrypted_plain_text 
