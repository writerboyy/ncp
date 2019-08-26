package config;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

    //请在这里配置您的基本信息
    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016100100640142";
    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDgATNnKHuYMktj4T1NBYQfPIuafIQ/YLCoIcXNfcR6bmUKgcfbu4DEaKlxJ3t9f4x1W9ZTPtWRxtgh9Urcj7dkySLqDrOUMFyZ9SIMeRvnBboB2zXjsn7H2EPTf+VB9soZr3Gcq2wjdmjVwLK5YwUMfK5cqe6xKMwaomxTZFtfWw4FQWLfqDW1AOsGyN3A7jOi3LyLD9TNKm6NdkbdlQ+otnkF9Iwy8HAXaDCKkn6j4iM4GExmJZ5Cj4hRQNi9fNJuCEBI28wDbLAtu4p6YcLyiX89P8W7O6iYdN+kuyAVyaryD8wOvtSxAqIfR1f9YMuB+oLxnNTh/EAQQc2QHJd7AgMBAAECggEAU57/ImZRZSp5TErcCHGjtclzT/NlpwcgS1N4NNLbUtz9KSPziMqBMlDj2BLmHZ5Mv87Nvnu5XFb/fgXEsXuQ+bXAK+HbFdnL58lDsaZQTTitDF5Zyqtqeo34G+8llS9cmKQO5G51yvM8BXePAHe/fb7ZlEv3h/jz4Il7qNHQ7lIrpfC5dpRxilo2HHHFRJ2ZYPCpfr9gT6pgVMGWUqt9qwqhbIprXeYSZpVaRlkqOr1fT3RuOM7CJk5FAdTbtp8EV017VYNFppEnTVseNCNB6nOph7cqvwVb54zFGA7BHtJnuRH9i2EfROOUolmIAxc+4t+jPKnkxfa7vI80QwDCsQKBgQDy13gc/18ivk1zyzUmxtNmxGG4oSlsxp1qjUzeGJSyVODrn/iCUqznCfuOQmGz8GNcmayLk2v/g1Q5EP9hyxFz5fbdcmcGzQ4kI9/x3LiesSEnP/asU93A80V+kHTgjm3SrYp27GYXyX+Ca5UOO4/UebL2E1BjUFLCs6rL0kEhmQKBgQDsJHAjEeVaAWMmdxuHch3rKA/8VWBaM8ooCXm6wx6vfBNI3ko53DsJF7kzMImahAj2Q03BqxEmvEwh3i3BXzHcIx0hYsrAMP4vov40eTBog8Y0kKb3X4SMhr0LKWRnQRaGqjuzsVxR+9sL97stvRgmvHPPwCk/tbnWZWwLNZXWMwKBgQDn36e4AHtloFIyO5kf0n9uxBsPAQud6rPKVutLsirhcLxnIBNY1Pp1jQmel3HVL7agZ7fiejyH+G1GJB3F0fFzOeSTJDaNvuQ+y+Z8eaXrGPSwFppBh77ZCzCTHfoLpNPmc4Af96+wDN1sua7UrTizyBSCdISwn7S2ZnmyLqu0GQKBgCeFEZ9M521gvg8578mDN66bTdGVGEMAV9zLeSvga8pCoZeYXCPCz7590ejXPrA1WKqeKO04i+5HpRYl8NJj9Bw7ZCyqM/RmPqQKSzDM92UGaK1zZ/4OZkh+ZDTyAHOnWPXAl61DCYhO9iHSm+jTtK8G6vrh1gVrjGZtIt/dX+4xAoGACLN3mt9Q4G62w3Tt1C2CNpqKAmHMLw656hD2bKQFhl92OvpEar3UKMIKkx1KY8yIyqj0Rf8W2Sj7VUPve3noAuivnovGMvArf5TlbRRdvFofjpTmQ/ISgr+zi5AobCMKU7gOiSre0e2NVqdXmCox7Diy5223wYZ/hDCEt4pVP94=";
    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAp7FF0JdZAIh99M9t1yHt8hRkvdBDlubHo0NDBQDyDgJpYNp3ticmrGpEAWcPmiS4rGknNAH2Qt8nRWrBGjY5sP5X6i1cc6c/Jxn6AMKrb5UpcJM5jh0lMryeLQdPg5HdqtCegeVvma+cR/TcjlBkWtzqptKWh63iSsUclt2JUDCYxB22FNsQGBX9+qlB1Tsqgmn21CrBHnPQQ7rkVKqb3r5i0n8e56FpPvEnBgPl3l3NDP1lKtPiBRYsiIaY/7c0xmHoB8nhvVWR30wBuPMsQRYR29rn8od/JT/wRsVDFdx6TQUUQijK2vYQvHludu2nkZqmzeOemAVHO0AoYR7DmwIDAQAB";
    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    //192.168.13.195:9527  //192.168.42.34:8080
    public static String notify_url = "http://120.78.195.154:9527/reception/notify_url.jsp";
    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://ncp.lingdu.live/buy";
    // 签名方式
    public static String sign_type = "RSA2"; // 字符编码格式
    public static String charset = "utf-8"; // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do"; // 支付宝网关
    public static String format = "json";
}

