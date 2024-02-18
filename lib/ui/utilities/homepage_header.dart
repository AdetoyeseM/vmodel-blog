import 'package:flutter/material.dart';
import 'package:vmodel_blog_app/ui/utilities/dateformat.dart';

class HomepageHeader extends StatelessWidget {
  const HomepageHeader({super.key, this.title});

  final String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            formatDateTO(DateTime.now().toString()),
            style: const TextStyle(
                color: Color(0xff503C3C), fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
              Text(
            title??  "Blog",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 40,
              ),
            ),
            InkWell(
              hoverColor: Colors.deepOrange,
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.elliptical(12, 12)),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://avatars.githubusercontent.com/u/62837454?v=4")))),
            ),
          ],
        )
      ]),
    );
  }
}
