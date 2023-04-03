import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/models/nyk_model.dart';
import 'package:project/utils/utils.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({required this.results, super.key});

  Results results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColorCommon,
        title: Text("NY Times Most Popular"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Image.network(
                key: ValueKey('image'),
                "${results.media!.first.mediaMetadata!.first.url}",
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    results.source.toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(results.updated.toString(),
                      style: TextStyle(fontSize: 20)),
                  Text(results.publishedDate.toString(),
                      style: TextStyle(fontSize: 20)),

                  // Text(results.title.toString(),
                  //     style: TextStyle(fontSize: 15)),
                ],
              )
            ],
          ),

          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(results.section.toString(),
                style: TextStyle(fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child:
                Text(results.type.toString(), style: TextStyle(fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("About", style: TextStyle(fontSize: 20))),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                results.abstract.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
              alignment: Alignment.center,
              child: Text('Media Details', style: TextStyle(fontSize: 20))),
          // MediaDetails(list: results.media![0].mediaMetadata!)
        ],
      ),
    );
  }
}

class MediaDetails extends StatelessWidget {
  MediaDetails({required this.list, super.key});

  final List<MediaMetadata> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: ((context, index) {
          return Image.network(list[index].url.toString());
        }));
  }
}
