# encoding: utf-8

require './wx_biz_data_crypt'

# https://api.weixin.qq.com/sns/jscode2session?appid=wx87ec248ea93e7398&secret=e147bc65cbbe4b98386bd4bf5a36877d&js_code=013Muldp0QMnAr1R9Afp0nCmdp0MuldG&grant_type=authorization_code

app_id = 'wx87ec248ea93e7398'
iv = "Hm5ifm6zbVgZqOvJVL4i9A=="
session_key = 'ia0fXDBskItNKM1hy8+Emg=='
encrypted_data = "AfRKDHIbpaoWPBqq+GS6vIy3H2Ajpi4Xvx7jknWnA2z47h6WMRLRNoHecXIR6vxARvAOzPxkWwK49yfBCDfNV4/lyCcWJHNXQRo3EFO3DFkTaEe8OqA26cV8MYdJ/PVtPE868hUoDi38IAZF9eS+RzTflqNtJDXlmPHnln6VEILrAgglfrzBQlW84y4N7dKDVtbYfk+aLphe48HudOLT2WDolIno5rorEYQyaup1c5Z66N7ebrI1JMIdqk2eVqDgLdagCMp9c+llvVBX84VWJmhOXKGltTiHkAUvow0FNr4UzkggsQ5cTn7FcQ/83ifVZxn0VnRRy2mO3TN9fVIFo3/9/ABQIIKgKzKtNYl+uBtsjY5Uj53+wyNJdsJFOS/UNkutipEwKzw+Kz0iSguvRNz+gW8FfbUGJ8fXenLqBbIRRLP3XbeP8wSR3vYC1ZvSmZVQzLpogzY4AuN0q0+aPQ=="

pc = WXBizDataCrypt.new(app_id, session_key)
puts pc.decrypt(encrypted_data, iv)

