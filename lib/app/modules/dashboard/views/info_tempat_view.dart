import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class InfoTempatView extends GetView {
  InfoTempatView({Key? key}) : super(key: key);
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            automaticallyImplyLeading: false,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text('QM Studio Foto'),
              background: Stack(
                alignment: const Alignment(0, -0.5),
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        alignment: Alignment.bottomCenter,
                        image: AssetImage("assets/images/bg_info.jpg"),
                        fit: BoxFit.fitWidth,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40,
                          offset: Offset(2, 4),
                        ),
                      ],
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
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, spreadRadius: 0.2, blurRadius: 5),
                  ],
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                padding: EdgeInsets.all(20),
                height: 600,
                width: double.infinity,
                child: RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const [
                        TextSpan(
                            text:
                                "When you try your best, but you don't succeed.\nWhen you get what you want, but not what you need.\nWhen you feel so tired, but you can't sleep.\nStuck in reverse",
                            style: TextStyle(fontSize: 18)),
                      ]),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      color: Colors.green,
                      iconSize: 40,
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.whatsapp),
                    ),
                    IconButton(
                      color: Colors.purple[300],
                      iconSize: 40,
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.instagram),
                    ),
                    IconButton(
                      color: Colors.red[600],
                      iconSize: 40,
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.locationDot),
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
