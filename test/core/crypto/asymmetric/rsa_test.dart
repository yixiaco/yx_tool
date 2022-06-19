import 'dart:convert';

import 'package:yx_tool/yx_tool.dart';

void main() {
  testExecute(
    title: 'RSA TEST',
    function: () {
      // var generateKeyPair = KeyUtil.generateKeyPair();
      // var publicKey = generateKeyPair.publicKey;
      // var privateKey = generateKeyPair.privateKey;
      // print(KeyUtil.publicKeyToString(publicKey));
      // print(KeyUtil.privateKeyToString(privateKey));
      var publicKeyText =
          'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq6wnoKOM/FQdDsgo8h+Oiby4wNzIS/xuxvGQLW0EV5ZwW4FtXhB3iGz/Rt3ACPthICx9UNpl1pwZNNUnwAyTF17B2W7JTN/RvW/a6Kjs64R3fbYKoo+e447RBWy9v8POQn3HNahzQhGYyfsJxGnh07EC+/wMYWL0WYKeQ2cHjPcYbe6bvbLqpDl/Ao2cYtN5VSAvdeN9lt5Mq1CWA29rB1mEfE/RWTT74Xmb1v5y0PJjr9atG7i8WIhrnUCSyRTzBmIDfR/7OifTVpMFhd9MrInTx9VxH3Z5/wpplyo1EaB7+OWsYy3++FCOtP1qUBAn86IXhYPkhswSdtkp091V6wIDAQAB';
      var privateKeyText =
          'MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCrrCego4z8VB0OyCjyH46JvLjA3MhL/G7G8ZAtbQRXlnBbgW1eEHeIbP9G3cAI+2EgLH1Q2mXWnBk01SfADJMXXsHZbslM39G9b9roqOzrhHd9tgqij57jjtEFbL2/w85Cfcc1qHNCEZjJ+wnEaeHTsQL7/AxhYvRZgp5DZweM9xht7pu9suqkOX8CjZxi03lVIC91432W3kyrUJYDb2sHWYR8T9FZNPvheZvW/nLQ8mOv1q0buLxYiGudQJLJFPMGYgN9H/s6J9NWkwWF30ysidPH1XEfdnn/CmmXKjURoHv45axjLf74UI60/WpQECfzoheFg+SGzBJ22SnT3VXrAgMBAAECggEAAw07YxqlLfMc1R9vwuYWtZIaQqtqEBe7rGOs6XHPqvLsqmPBmvN1/IHbg9n7SO2XC2hfDenj942s0Qic/Uf78WVo0sGqaGhuJQzw+kPOel1Pdnee9sbQz0DBrHQDZ35Gk14DBYwqCFmhuq1wvgIX1piF8g7H9Y85wsGUqKQTOUk/uudvRPc33U4Id9BpfOd8MyfnSrLkksbLtY8OEhyH/2nFiGMoykBuojPNJK5NuySk/ie5sMBNlMAJBhmagqliSS5vW9d1NiRj+92b64FcREogNv/J62Zww5ZpDOMDR7Kymgkku7xlhcHiTSTDtnjd9KOgOdeYRwepyEE8xLF1EQKBgQDba/yiJ9+q04m9QXqkhJuujZ/0w0EB5L3L47YHD1IaBfWPBJAfb6cbrR3eZWeBPSnL1yU13XgDUHXQ9JBwGeVM7oCrYz/Q/5MNRojOQ5tmALPINV7DWK9maPprCqVsytU5TUOjVbh2NxPNV99pnbpjYAPxE5m3Y/d0YOqPZbG1swKBgQDISmyNmo1okoWdwABxiS76wxVWCINwj8QavcRkETU+jyzQvGBJqf/yhgHKFTMXDhj9MRd10evURJYPT/5zDUJWpFtm+5drJAj9Yadg/BsUPB7jjTBhC3pZrYlfK5kuhTSrxBSSawp2e31Ywp+urkCUHz8IBIW6Sw5zeUBXpNYy6QKBgBqyiuyX+WjpkCrM2sVFtUOJy9qWH0TBti4mqLE3NgAglX4vSfHpPeXqLGYw5GUfMgSxSr/BEKcmlQ81kpVxMSspIdK4or0lO5kz6dVe+Htyvm0vwTX3hm/pef6oLvSLwWHVetNWzLjlfq1PccmB/Xm15wTgI6XireslF6UW9IZtAoGAM6rPOfAmjlVN1pXTB3bGAbYVaO4lSgIsKmHNqaquu4afnvEZPad2+Q8Mox644TenxpjFXoVaepV+yFBwaSmAdW1MjtJUCzVuhD6OuPwP2DZyGW0wj7gwRbX4e+55Q4DlR3H7hJHMTygn+5+pJZyZ2Bv/XIgeHyKBhdQ/ftxszRECgYBky7rM40fETwEUU9CJS4bxrrqG24Jr09OGVrwJHaYUX7b6lenE0PTHdJpwd75a22bYUL3hMaHFDGxpfQdXVK3xYn/egGyFW0DOCMMWqVbPMxiatyJeo3NtGpAT5IWDnw5ox1iV7oPGLN1oM8S+I4+DrX1xasR+plTUhOmpHVkFRw==';
      var rsa = RSA(publicKeyText: publicKeyText, privateKeyText: privateKeyText, encoding: RSAEncoding.pkcs1);
      var data = '虎头闯杭州,多抬头看天,切勿只管种地'.bytes;
      var encrypt = rsa.encrypt(data: data);
      print(base64Encode(encrypt));
      print(StrUtil.decode(rsa.decrypt(data: encrypt)));

      var generateSignature = rsa.generateSignature(message: data);
      print('签名：${base64Encode(generateSignature.bytes)}');
      print('验证签名：${rsa.verifySignature(message: data, signature: generateSignature)}');
    },
    execute: true,
  );

  testExecute(
    function: () {
      var generateKeyPair = RSAKeyUtil.generateKeyPair();
      var publicKey = generateKeyPair.publicKey;
      var privateKey = generateKeyPair.privateKey;

      var publicKeyText = RSAKeyUtil.publicKeyToString(publicKey);
      var privateKeyText = RSAKeyUtil.privateKeyToString(privateKey);
      print('生成公钥: $publicKeyText');
      print('生成私钥: $privateKeyText');

      var parsePublicKeyText = RSAKeyUtil.publicKeyToString(RSAKeyUtil.parsePublicKey(publicKeyText));
      var parsePrivateKeyText = RSAKeyUtil.privateKeyToString(RSAKeyUtil.parsePrivateKey(privateKeyText));
      print('解析公钥: $parsePublicKeyText');
      print('解析私钥: $parsePrivateKeyText');
    },
    execute: true,
  );

  testExecute(
    function: () {
      var privateKeyText = r'''-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAugLZ6OAAm1wM7kE8zPbwQDdhCWq67pKwNs7k4VodylqcCM6B
oxCPBIMTGiHzX+MHpg/XDB1twsRxmsoobTwz0KGJthuOmNsyKIAt5IK47KNCSg7D
fV9RjarZO6AARz9OBy7pJqoi+MTeOVcOdtbecDxxWU7ayhaAqb7NRn8twBguL2gr
84rg6NYzfRs+9gS0iw+HDQqkOxx7A/SqrN5QrYk925qLdMG5Qx1ityX3SQ1d9Alu
mvvGKheLVXpGoCd2oc2FnUlVrMpN2fkxA2LyoGOTB5IJxhHVyHcnX1lmYWZuwk1Q
Yncw4hojVPSM7Gp0nTm/0GxiLPmqEVtfGQMzQwIBIwKCAQEAmh+enGHUnfvQMyAc
b1BDaGhmWEJ9oRp0v7K9pMcCvZuImZUplb1DTOGiHPePI5A5iZgYlQJw4zUNrCPY
WoJW0W/nIdxRlJhcwnjVkXOgiY6WAtkIYJDOi1MLw7B1QlkGIzV/Woz4Z7kP5l4T
TIYmBTllO16YBoesb2OUJHgBVgP9sSzGfG84+d/dx0f3ONLFULP5WCrHkTpUTfVk
eZqe0xdvn7Y4wJzADxpoBGY5YA5ACtbqHWLz4bYupZjtRI4vrwth2qkKkQWLsGmM
8CNrEneSq7aasnwULkx/xRWXBaB+BKxDFCLhVPPkg+dqqpuLA3BRf3I029ej0XRa
degbcwKBgQDpGCuOwsHKwApjX0OXNwKaW2/dnB6HZIeekfStQbVPnFCK1ta8DRZ7
fPqduecn8gew56UnDxTZc0+TYJPeIuMFNOC1PLMCJ08NFL2n6Etd+omZwFNQjalM
300AzIqeoHPAF2gkuVm8qWqdiQ/F2oSziZ8wUGfmfZsjpMWzSi3QZwKBgQDMSjuK
U/w7U3/WG6zwIicIvJF8ghmV6YNt3vJPMKwvui4R0UApzqdwdh1h7xu2O15olWDm
X5ujEE0yatWQwJjWxc1r7sF7u/j5SJjWLjxIY2z40EfbNNucsUlpDuDchTD8GAOc
6Raq48/KRy6VyGfSrlmf5jQG7Km34o2oj/sMxQKBgE/rB56pLIAHVATQNG5cAOR3
Hwom5eVHCe05WzQWh05+vIdfmhSWxeEyKgoxHA2yEUP3plaI0/LIcw31OgMEpZti
li+ChoRlP6y2p2zErCA4pDS29/5cdI9igM0S7bK6q1fNgsrDNLW2bbJa4NYfCO0Z
PeSt2nrpPIE/zsEgv0AjAoGAaRA74L16Z6dJDwbrOasqBH48MWd632ImVcMdh8/j
hkJ+F8qzSLNsDfOaFRviXbgh7KSYO/an0DRE9VuDxslzLKA9wnrJ590Ds2cqB8AB
vtQMKDCZ+7TItvwXIBZHwd4ZMTDr6kv9B23Yk+oX9UJ+iZt+jL+IeJb4Mq8HBjtr
KyMCgYEA2ouFn7iPw4g0X9nvKTC8VNeAHp6+mzerhXp7RtHcfD4CxFYCyxvUo7HL
COHtZz0uJsWPplPC7Bb1NWqgULsZfP5BfHxUOd7bSUmN/aFhAUUNY9+LHWbG8Tpa
YC0F52LpCCDFy9NwiE47EFuqzJZy3B5gSLuBre0knqeA4NtSrrk=
-----END RSA PRIVATE KEY-----
''';
      var pkcs8PrivateKeyText = '''MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAIL7pbQ+5KKGYRhw7jE31hmA
f8Q60ybd+xZuRmuO5kOFBRqXGxKTQ9TfQI+aMW+0lw/kibKzaD/EKV91107xE384qOy6IcuBfaR5lv39OcoqNZ
5l+Dah5ABGnVkBP9fKOFhPgghBknTRo0/rZFGI6Q1UHXb+4atP++LNFlDymJcPAgMBAAECgYBammGb1alndta
xBmTtLLdveoBmp14p04D8mhkiC33iFKBcLUvvxGg2Vpuc+cbagyu/NZG+R/WDrlgEDUp6861M5BeFN0L9O4hz
GAEn8xyTE96f8sh4VlRmBOvVdwZqRO+ilkOM96+KL88A9RKdp8V2tna7TM6oI3LHDyf/JBoXaQJBAMcVN7fKlYP
Skzfh/yZzW2fmC0ZNg/qaW8Oa/wfDxlWjgnS0p/EKWZ8BxjR/d199L3i/KMaGdfpaWbYZLvYENqUCQQCobjsuCW
nlZhcWajjzpsSuy8/bICVEpUax1fUZ58Mq69CQXfaZemD9Ar4omzuEAAs2/uee3kt3AvCBaeq05NyjAkBme8SwB0iK
kLcaeGuJlq7CQIkjSrobIqUEf+CzVZPe+AorG+isS+Cw2w/2bHu+G0p5xSYvdH59P0+ZT0N+f9LFAkA6v3Ae56OrI
wfMhrJksfeKbIaMjNLS9b8JynIaXg9iCiyOHmgkMl5gAbPoH/ULXqSKwzBw5mJ2GW1gBlyaSfV3AkA/RJC+adIjsRGg
JOkiRjSmPpGv3FOhl9fsBPjupZBEIuoMWOC8GXK/73DHxwmfNmN7C9+sIi4RBcjEeQ5F5FHZ''';
      var parsePrivateKeyText = RSAKeyUtil.privateKeyToString(RSAKeyUtil.parsePrivateKey(privateKeyText), rsaPublicKeyFormat: true);
      print('解析私钥: $parsePrivateKeyText');
      parsePrivateKeyText = RSAKeyUtil.privateKeyToString(RSAKeyUtil.parsePrivateKey(pkcs8PrivateKeyText));
      print('解析PKCS8私钥: $parsePrivateKeyText');
    },
    execute: true,
  );

  testExecute(
    function: () {
      var publicKeyText =
          'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDgtQn2JZ34ZC28NWYpAUd98iZ37BUrX/aKzmFbt7clFSs6sXqHauqKWqdtLkF2KexO40H1YTX8z2lSgBBOAxLsvaklV8k4cBFK9snQXE9/DDaFt6Rr7iVZMldczhC0JNgTz+SHXT6CBHuX3e9SdB1Ua44oncaTWz7OBGLbCiK45wIDAQAB';
      var parsePublicKeyText = RSAKeyUtil.publicKeyToString(RSAKeyUtil.parsePublicKey(publicKeyText));
      print('解析公钥: $parsePublicKeyText');
    },
    execute: false,
  );
}
