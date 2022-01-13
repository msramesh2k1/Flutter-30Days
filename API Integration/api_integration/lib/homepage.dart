import 'package:api_integration/controllers/newscontroller.dart';
import 'package:api_integration/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsController newsController = Get.put(NewsController());
  late Future<List> newsdata;
  @override
  void initState() {
    super.initState();
    newsdata = APIService().fetchnews();
    print(newsdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NEWS - O",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 10),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: GetBuilder<NewsController>(
        builder: (controller) {
          if (controller.newsdata.isEmpty) {
            return const LinearProgressIndicator(
              color: Colors.white,
              backgroundColor: Colors.black,
            );
          } else {
            return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.newsdata.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ShaderMask(
                                shaderCallback: (rect) {
                                  return const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.black, Colors.transparent],
                                  ).createShader(Rect.fromLTRB(
                                      0, 0, rect.width, rect.height));
                                },
                                blendMode: BlendMode.dstIn,
                                child: Image.network(
                                  controller.newsdata[index]['urlToImage'] ??
                                      "https://images.pexels.com/photos/9967888/pexels-photo-9967888.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 1.5,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: 20,
                                top: 20,
                                child: GestureDetector(
                                  onTap: () {
                                    launch(controller.newsdata[index]['url']);
                                  },
                                  child: const CircleAvatar(
                                    child: Icon(
                                      Icons.open_in_new,
                                      color: Colors.black,
                                    ),
                                    backgroundColor: Colors.white,
                                    radius: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              controller.newsdata[index]['title'],
                              style: const TextStyle(
                                  fontSize: 22,
                                  letterSpacing: 0.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Text(
                              controller.newsdata[index]['description'] ??
                                  'NEWS - O',
                              maxLines: 4,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  overflow: TextOverflow.fade,
                                  fontSize: 16,
                                  letterSpacing: 0.5,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 2),
                            child: Container(
                              color: Colors.black,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  controller.newsdata[index]['author'] ??
                                      "NEWS - O",
                                  style: const TextStyle(
                                      fontSize: 10,
                                      letterSpacing: 0.5,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      height: 150,
                      color: Colors.grey[900],
                    ),
                  );
                });
          }
        },
        init: NewsController(),
      ),
    );
  }
}
