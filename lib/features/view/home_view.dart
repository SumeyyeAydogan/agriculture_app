import 'package:agriculture_app/core/extension/context_extension.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Post> posts = [
    // Örnek gönderi verileri
    Post(title: 'Bitki Hastalığı', content: 'Merhabalar, Çay bitkimde sarı sarı benekler oluştu, daha önce sizin başınıza geldi mi', username: 'Sümeyye Aydoğan', timestamp: '10:00'),
    Post(title: 'Fındık Yetiştiriciliği', content: 'Merhaba arkadaşlar, Ordu bölgesinde fındık yetiştiriciliği yapmak istiyorum. Hangi fındık türleri benim için idealdir?', username: 'Kullanıcı2', timestamp: '11:00'),
    // Daha fazla gönderi ekleyebilirsiniz
  ];

  final photoList = [
    "assets/images/image1.png",
    "assets/images/image2.jpg",
    "assets/images/image3.jpg",
    "assets/images/image4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(padding: const EdgeInsets.all(15.0), child: topBarMenu()),
          //buildSlider(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return PostCard(post: posts[index]);
            },
          ),
        ],
    );
  }

  CarouselSlider buildSlider() {
    return CarouselSlider(
      options: CarouselOptions(enlargeCenterPage: true, autoPlay: true, viewportFraction: 0.9),
      items: photoList.map<Widget>((index) {
        return Builder(
          builder: (BuildContext context) {
            return Image.asset(
              index.toString(),
            );
          },
        );
      }).toList(),
    );
  }
}

class Post {
  final String title;
  final String content;
  final String username;
  final String timestamp;

  Post({required this.title, required this.content, required this.username, required this.timestamp});
}

class PostCard extends StatelessWidget {
  final Post post;

  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(post.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(post.content),
            SizedBox(height: 8),
            Text('Yayınlanma zamanı: ${post.timestamp}'),
            SizedBox(height: 8),
            Text('Yazar: ${post.username}'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton.icon(
                  // Beğeni butonu
                  icon: Icon(Icons.thumb_up),
                  label: Text('Beğen'),
                  onPressed: () {
                    // Beğeni işlemi
                  },
                ),
                TextButton.icon(
                  // Yorum butonu
                  icon: Icon(Icons.comment),
                  label: Text('Yorum Yap'),
                  onPressed: () {
                    // Yorum yapma işlemi
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class topBarMenu extends StatefulWidget {
  const topBarMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<topBarMenu> createState() => _topBarMenuState();
}

class _topBarMenuState extends State<topBarMenu> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      //Image.asset('assets/images/pp_mini.png'),
      SizedBox(width: context.width * 0.01),
      Row(
        children: [
          RichText(
            text: const TextSpan(
              text: 'Merhaba\n',
              style: TextStyle(color: Colors.grey),
              children: <TextSpan>[
                TextSpan(text: 'Ali Adıgüzel', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          )
        ],
      ),
    ]);
  }
}
