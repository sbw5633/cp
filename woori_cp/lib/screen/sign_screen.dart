import 'package:flutter/material.dart';
import 'package:woori_cp/const/sns_value.dart';
import 'package:woori_cp/screen/home_screen.dart';
import 'package:woori_cp/unit/component/common/toast_message.dart';
import 'package:woori_cp/util/common/sign_manager.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(clipBehavior: Clip.none, children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            'asset/image/sampleBG.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.grey,
                )),
            Expanded(flex: 10, child: _topLogo()),
            Expanded(flex: 1, child: Container()),
            Expanded(flex: 10, child: _bottomSignWidgets()),
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.grey,
                )),
          ],
        ),
      ]),
    ));
  }
}

class _topLogo extends StatelessWidget {
  const _topLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: Colors.amber,
        child: Text("Logo 들어갈 자리"),
      ),
    );
  }
}

class _bottomSignWidgets extends StatefulWidget {
  _bottomSignWidgets({
    super.key,
  });

  //로그인중(0:없음, 1:카카오, 2:구글, 3:애플) : 로그인 중 타sns 로그인 시도 막는 용도

  @override
  State<_bottomSignWidgets> createState() => _bottomSignWidgetsState();
}

class _bottomSignWidgetsState extends State<_bottomSignWidgets> {
  int isSigning = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: _snsSignBtn(
            selectSNS: SupportSNS.KAKAO,
            isLoading: isSigning == 1,
          ),
          onTap: () async {
            if (isSigning == 0) {
              setState(() {
                isSigning = 1;
              });
              final resp = await SignManager().signInKakao();
              checkSignIn(resp);
            }
          },
        ),
        const SizedBox(height: 16),
        InkWell(
          child: _snsSignBtn(
            selectSNS: SupportSNS.GOOGLE,
            isLoading: isSigning == 2,
          ),
          onTap: () async {
            if (isSigning == 0) {
              setState(() {
                isSigning = 2;
              });
              final resp = await SignManager().signInGoogle();
              checkSignIn(resp);
            }
          },
        ),
        const SizedBox(height: 16),
        InkWell(
          child: _snsSignBtn(
            selectSNS: SupportSNS.APPLE,
            isLoading: isSigning == 3,
          ),
          onTap: () async {
            if (isSigning == 0) {
              setState(() {
                isSigning = 3;
              });
              final resp = await SignManager().signInApple();
              checkSignIn(resp);
            }
          },
        ),
      ],
    );
  }

  void checkSignIn(bool resp) {
    if (resp) {
      successSignIn(userData: "서버에서 받아온 유저 정보");
    } else {
      failedSignIn();
    }
  }

  void successSignIn({required String userData}) {
    //서버에서 받아온 유저 정보 저장
    final user = userData;

    toastMessage('{user.name} 님 환영합니다.');

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);
  }

  void failedSignIn() {
    toastMessage('로그인에 실패했습니다.');
    setState(() {
      isSigning = 0;
    });
  }
}

class _snsSignBtn extends StatelessWidget {
  final SupportSNS selectSNS;
  final bool isLoading;
  const _snsSignBtn({
    super.key,
    required this.selectSNS,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final _snsValues = setSnsValue();

    final TextStyle _ts = TextStyle(
      color: Colors.black,
    );

    return Container(
      decoration: BoxDecoration(
        color: _snsValues.conceptColor,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 280,
      height: 60,
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Text(
                    _snsValues.logoUrl,
                    style: _ts,
                  )),
              Container(
                  width: 140,
                  height: 50,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Text(
                    _snsValues.snsName,
                    style: _ts,
                  ))
            ]),
    );
  }

  dynamic setSnsValue() {
    switch (selectSNS) {
      case SupportSNS.KAKAO:
        return SNS_Kakao();
      case SupportSNS.GOOGLE:
        return SNS_Google();
      case SupportSNS.APPLE:
        return SNS_Apple();
      default:
        return null;
    }
  }
}
