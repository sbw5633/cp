import 'package:flutter/material.dart';

enum SupportSNS {
  KAKAO,
  GOOGLE,
  APPLE,
}

class SNSValue {
  final String snsName;
  final String logoUrl;
  final Color conceptColor;

  const SNSValue({
    required this.snsName,
    required this.logoUrl,
    required this.conceptColor,
  });
}

class SNS_Kakao extends SNSValue {
  SNS_Kakao(
      {super.snsName = "카카오",
      super.logoUrl = "kakao_Logo_Url",
      super.conceptColor = Colors.yellow});
}

class SNS_Google extends SNSValue {
  SNS_Google(
      {super.snsName = "구글",
      super.logoUrl = "google_Logo_Url",
      super.conceptColor = Colors.blueGrey});
}

class SNS_Apple extends SNSValue {
  SNS_Apple(
      {super.snsName = "애플",
      super.logoUrl = "apple_Logo_Url",
      super.conceptColor = Colors.red});
}
