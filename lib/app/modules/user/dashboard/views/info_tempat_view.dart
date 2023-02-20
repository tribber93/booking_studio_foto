import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:studio_foto/app/controller/myController.dart';
import 'package:studio_foto/utils/myColor.dart';
// import 'package:studio_foto/utils/widget/myCheckbox.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoTempatView extends GetView<MyController> {
  const InfoTempatView({Key? key}) : super(key: key);

  static final Uri _urlWhatsapp = Uri.parse("https://wa.me/+6283149857944");
  static final Uri _urlInstagram =
      Uri.parse("https://www.instagram.com/qm_studiophoto");
  static final Uri _urlMap = Uri.parse("https://goo.gl/maps/U3MxMb994Dmmq5xq7");

  @override
  Widget build(BuildContext context) {
    String lorem =
        "QM Studio Photo adalah sebuah studio fotografi. Studio ini menawarkan berbagai layanan fotografi, mulai dari pemotretan pribadi hingga pemotretan bisnis. Dalam studio ini, para fotografer yang terampil dan berpengalaman dapat membantu Anda mendapatkan hasil foto yang berkualitas tinggi. \n\nStudio ini dilengkapi dengan peralatan fotografi modern dan berkualitas tinggi, sehingga Anda dapat yakin bahwa hasil foto Anda akan terlihat profesional. Selain itu, studio ini memiliki berbagai macam background dan properti untuk memenuhi kebutuhan Anda dalam pemotretan. \n\nSelain itu, QM Studio Photo juga menawarkan layanan penyuntingan foto yang dapat membantu memperbaiki foto Anda agar terlihat lebih baik dan menarik. Layanan ini terbuka bagi siapa saja yang ingin meningkatkan hasil foto mereka. \n\nDalam studio ini, suasana yang nyaman dan ramah akan membuat Anda merasa santai dan tenang selama sesi pemotretan. Para fotografer yang bekerja di QM Studio Photo sangat profesional dan peduli pada kebutuhan klien mereka, sehingga Anda dapat yakin bahwa Anda akan mendapatkan hasil foto yang sesuai dengan keinginan Anda. \n\nJika Anda mencari studio fotografi yang berkualitas tinggi dengan fotografer yang ahli dan ramah, QM Studio Photo adalah pilihan yang tepat untuk Anda.";
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: primaryColor,
            pinned: true,
            snap: false,
            floating: false,
            automaticallyImplyLeading: false,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text(
                'QM Studio Foto',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white),
              ),
              background: Stack(
                alignment: const Alignment(0, -0.5),
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        alignment: Alignment.bottomCenter,
                        image: AssetImage("assets/images/bg_info.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/logo_qm.jpg"),
                  )
                ],
              ),
              //padding: EdgeInsets.only(bottom: 100),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, spreadRadius: 0.2, blurRadius: 5),
                  ],
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                padding: const EdgeInsets.all(20),
                // height: 600,
                width: double.infinity,
                child: Column(children: [
                  RichText(
                    text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          TextSpan(
                              text: lorem,
                              // "When you try your best, but you don't succeed.\nWhen you get what you want, but not what you need.\nWhen you feel so tired, but you can't sleep.\nStuck in reverse",
                              style: const TextStyle(fontSize: 18)),
                        ]),
                  ),
                ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      color: Colors.green,
                      iconSize: 40,
                      onPressed: () {
                        _launchInBrowser(_urlWhatsapp);
                      },
                      icon: const FaIcon(FontAwesomeIcons.whatsapp),
                    ),
                    IconButton(
                      color: Colors.purple[300],
                      iconSize: 40,
                      onPressed: () {
                        _launchInBrowser(_urlInstagram);
                      },
                      icon: const FaIcon(FontAwesomeIcons.instagram),
                    ),
                    IconButton(
                      color: Colors.red[600],
                      iconSize: 40,
                      onPressed: () {
                        _launchInBrowser(_urlMap);
                      },
                      icon: const FaIcon(FontAwesomeIcons.locationDot),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ]),
            // child:
          )
        ],
      ),
    );
  }
}

Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalNonBrowserApplication,
  )) {
    throw 'Could not launch $url';
  }
}
