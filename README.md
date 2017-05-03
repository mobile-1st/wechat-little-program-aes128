# wechat-little-program-aes128
微信小程序Ruby版本加密信息解密实例

### 用法实例

index.rb 为样例代码，使用前请将相关参数修改为您个人小程序相关信息

`pc = WXBizDataCrypt.new(app_id, session_key)`

`puts pc.decrypt(encrypted_data, iv)`

### 解析JSON结果

```
$ ruby index.rb

{"openId"=>"oPXsJ0XRxxxT-EC73Vm5B0aug", "nickName"=>"wayde", "gender"=>1, "language"=>"en", "city"=>"Wuhan", "province"=>"Hubei", "country"=>"CN", "avatarUrl"=>"http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaExxxKfbEfNEquYYiaK8mhXLliaQA29cicl7Vf6mhoWuNllXh6er94K1kLCJkce6W1LJUuSPp2g/0", "watermark"=>{"timestamp"=>1488876922, "appid"=>"wx7ecxxx9398"}}
```

[JSON 在线编缉器](http://www.jsoneditoronline.cn/)
http://www.jsoneditoronline.cn/

![JSON](./json.png)

[有其它问题欢迎交流](mailto:wayde.sun@gmail.com?Subject=WxChat little program%20Text&Body=Thank%20you)

### 关于unionid的补充说明

有朋友问到为什么我这解析的没有unionid？

这是因为微信官网无法真视的规定：如果你的小程序没有和你的已经通过官方认证了的公从号绑定，那么这里不给你返回unionid!!!

![WTF](./wtf.jpeg)

### 补充

经测试可正常工作的去除解密后特殊字符的源码

```
# encoding: utf-8
decrypted_plain_text = File.read('./000/0007.json')

decrypted_plain_text = decrypted_plain_text.gsub(/[\u0000-\u001F\u2028\u2029]/, '')
p decrypted_plain_text
last_letter = decrypted_plain_text[decrypted_plain_text.length - 1]
if last_letter != '}'
  bracket_index = (0 ... decrypted_plain_text.length).find_all { |i| decrypted_plain_text[i,1] == '}' }
  p bracket_index
  last_bracket_index = bracket_index[bracket_index.length - 1]
  p last_bracket_index
  decrypted_plain_text = decrypted_plain_text[0, last_bracket_index + 1]
end

File.open('./111.json', 'w') { |file| file.write(decrypted_plain_text) }
```

生产环境和开发环境的差别

```
# ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-linux]
# not work!!
# decrypted_plain_text = decrypted_plain_text.strip.gsub(/[\u0000-\u001F\u2028\u2029]/, '')
# ruby 2.1.1p76 (2014-02-24 revision 45161) [x86_64-darwin12.0]
# works!!

```