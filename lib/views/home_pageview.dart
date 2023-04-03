import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/apiservice/api_service.dart';
import 'package:project/controllers/homepage_controller.dart';
import 'package:project/models/nyk_model.dart';
import 'package:project/utils/utils.dart';
import 'package:project/views/details_pageview.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomePageController>(context, listen: false).fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBarColorCommon,
          leading: Icon(Icons.menu),
          title: Text("NY Times Most Popular"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<HomePageController>(builder: ((context, value, child) {
                if (value.loading) {
                  return Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: CircularProgressIndicator());
                }
                return ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: ((context, index) {
                      return Divider(
                        height: 1,
                      );
                    }),
                    itemCount: value.nykModel.results!.length,
                    itemBuilder: ((context, index) {
                      print(value.nykModel.results!.length);
                      return ListItemWidget(
                        results: value.nykModel.results![index],
                        index: index,
                      );
                    }));
              }))
            ],
          ),
        ));
  }
}

class ListItemWidget extends StatelessWidget {
  ListItemWidget({required this.results, required this.index, super.key});

  final Results results;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(10),
      height: 200.h,
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: results.media!.first.mediaMetadata!.first.url == null
                ? Text("no image")
                : Image.network(
                    "${results.media!.first.mediaMetadata!.first.url}")),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<HomePageController>(
              builder: (context, value, child) {
                return Text(
                  "${value.cutString(results.title!)}",
                  style: TextStyle(
                      color: AppColors.textColortitle, fontSize: 15.sp),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${results.byline}",
              style: TextStyle(
                  color: AppColors.textColorsubtitle, fontSize: 15.sp),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${results.section}",
                  style: TextStyle(fontSize: 15.sp),
                ),
                Row(
                  children: [
                    Icon(Icons.date_range),
                    Text(
                      "${results.publishedDate}",
                      style: TextStyle(fontSize: 12.sp),
                    )
                  ],
                )
              ],
            )
          ],
        ),
        trailing: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => DetailsScreen(results: results))));
            },
            icon: Icon(Icons.arrow_forward_ios_outlined)),
      ),
    );
  }
}
