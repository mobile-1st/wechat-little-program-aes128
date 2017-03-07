require './wx_biz_data_crypt'

app_id = 'YOUR-APP-ID'
iv = "IRBmqGMXAKitOn2DnTdSVg=="
session_key = 'SESSION-KEY-YOU-GET-BY-wx.login-CODE'
encrypted_data = "ZY5CPUVTJ17J1rRd5KmYDQ4FHjPDHiJVIY5qzpKS7xtQ8JhtUNaRGJQKfWM1Qh1tmal7sOY/ajf9n7Ns/X3lJbLd92+/xVmo9wheK+Q22BRf9fNFWWTIjrU7pLRuK4kKW9MOgd2xCcNFFOJSx1aPnY3M+kV7zqQ3HOy9yhXaQVhZhKteRqsYMY6w8uUJGfHJQ6goxzW1MWaK4J5WLCWjMw86Tuydg77TsfHnQKS9tPX0a0QPgIOTCP2fevt/qMes6jmsRJr5uauNZGyX/vRv5XJR4AyBxQuEGwLfO8EiL07OtyrZaV5iSENYXj0xpAIDaQ8H0wYRnSOk/Ze/OfmiGPCJ3SG63fKDVAKUNbG/mVWfYBJyGY0j7BOYrAkLxUUCqb+aZO98Y7w2ZLVU95CtssdyM7oaXIoZr9PkUska45pddDzQqLTe6IEzFn1eRK3Ysm5Fm+FI20kw=="

pc = WXBizDataCrypt.new(app_id, session_key)
puts pc.decrypt(encrypted_data, iv)

