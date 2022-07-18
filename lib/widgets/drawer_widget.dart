import 'package:bookstore/data/data.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/pdf_screen.dart';

class drawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              'assets/images/map.jpg',
              fit: BoxFit.fill,
            ),
          ),
          ListTile(
            title: Text(
              "الصفحة الرئيسية",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
            ),
            trailing: Icon(Icons.home),
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (c) => MyHome()));
            },
          ),
          ExpansionTile(
            title: Text(
              "تواصل معنا",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
            ),
            children: [
              ListTile(
                title: SelectableText(
                  "+201123283776",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: pdf_list.length,
                itemBuilder: (ctx, index) => ListTile(
                      trailing: Icon(Icons.book),
                      title: Text(
                        pdf_list[index].title,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Navigator.of(ctx).pushReplacement(MaterialPageRoute(
                            builder: (_) => pdfScreen(
                                  pdfUrl: pdf_list[index].url,
                                  title: pdf_list[index].title,
                                )));
                      },
                    )),
          )
        ],
      ),
    );
  }
}
