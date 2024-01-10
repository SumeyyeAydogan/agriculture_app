import 'package:agriculture_app/core/extension/context_extension.dart';
import 'package:agriculture_app/product/widget/post_model.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  //final PostModel selectPost;
  //final Widget widget;
  PostItem({
    Key? key,
    //required this.selectPost,
    //required this.widget,
  }) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Card(
        child: ListTile(
          onTap: () {},
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/person.jpg"), fit: BoxFit.cover),
              ),
            ),
          ),
          title: Text(
            "",
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Colors.orange,
                        size: 18,
                      ),
                      SizedBox(
                        width: context.height * 0.01,
                      ),
                      Text(
                        "Boş",
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    height: context.height * 0.025,
                    /* decoration: BoxDecoration(
                      border: RDottedLineBorder(
                          left: BorderSide(
                        color: Colors.grey,
                      )),
                    ), */
                  ),
                ],
              ),
              Text("Burası widget"),
            ],
          ),
        ),
      ),
    );
  }
}
