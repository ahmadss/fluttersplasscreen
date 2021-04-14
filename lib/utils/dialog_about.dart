import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contoh/data/img.dart';
import 'package:flutter_contoh/data/my_colors.dart';
import 'package:flutter_contoh/utils/tools.dart';
import 'package:flutter_contoh/widget/my_text.dart';
import 'package:package_info/package_info.dart';

class DialogAboutRoute extends StatefulWidget {

  DialogAboutRoute();

  @override
  DialogAboutRouteState createState() => new DialogAboutRouteState();
}

class DialogAboutRouteState extends State<DialogAboutRoute>{

  String version = "";

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        version = packageInfo.version;
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(4),),
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close, color: MyColors.grey_20,),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Container(
                width : double.infinity,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      child: Image.asset(
                          Img.get('logo_small_round.png'), color: MyColors.primary,
                          width: 60, height: 60
                      ),
                    ),
                    Container(height: 15),
                    Text("Projet Kerja", style: MyText.title(context).copyWith(color: Colors.black, fontWeight: FontWeight.w500)),
                    Text("Version "+version, style: MyText.body1(context).copyWith(color: Colors.grey)),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Text("Implementasi aplikasi flutter terbaik dari komponen UI material. Aplikasi ini diimplementasikan berdasarkan Google Design Guidelines.",
                        style: MyText.body1(context).copyWith(color: MyColors.grey_60), textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: double.infinity, height: 40,
                      child: FlatButton(
                        child: Text("PORTOFOLIO", style: TextStyle(color: MyColors.accentDark)),
                        color: Colors.transparent,
                        onPressed: (){
                          Tools.directUrl("https://google.com/");
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity, height: 45,
                      child: FlatButton(
                        child: Text("SC", style: MyText.body2(context).copyWith(color: Colors.white)),
                        color: MyColors.primary,
                        onPressed: (){
                          Tools.directUrl("https://google.com");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
