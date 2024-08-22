import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Shared/ui/buttons/rounded/rounded_button.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';

class StationList extends StatefulWidget {
  const StationList({super.key});

  @override
  _StationListState createState() => _StationListState();
}

class _StationListState extends State<StationList> {
  int _selectedIndex = -1;

  final List<Map<String, String>> stations = [
    {
      "title": "محطة نفط",
      "subtitle": "شارع الأمير سلطان بن عبد العزيز، العليا",
      "image":
          "https://english.ahram.org.eg/Media/News/2023/5/17/41_2023-638199525882968514-296.jpg",
    },
    {
      "title": "محطة قو ستبشين | GOstation",
      "subtitle": "طريق الملك فهد، العليا",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiYuUr3Trpfwi2WvRkzffEqwa9VsJ-71bbXg&s",
    },
    {
      "title": "محطة الدريس Aldrees",
      "subtitle": "شارع الامير ممدوح بن عبدالعزيز، السليمانية",
      "image":
          "https://cdn.sanity.io/images/zlfgolrr/production/8a355ef8f25011e46cfc96e360e738ee0c323266-724x482.jpg?w=724&h=482&auto=format",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: stations.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 3, horizontal: 15.w),
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: _selectedIndex == index
                    ? AppColors.secondaryColor
                    : Colors.transparent,
                width: 1,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(stations[index]["image"]!)),
                const SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(stations[index]["title"]!,
                            style: AppTextStyle.bodyBold),
                        SizedBox(
                          width: 200.w,
                          child: Text(stations[index]["subtitle"]!,
                              style: AppTextStyle.smallBody
                                  .copyWith(fontWeight: FontWeight.w300)),
                        ),
                      ],
                    ),
                  ),
                ),
                RoundedButton(
                  onPressed: () {},
                  title: "عرض المحطة",
                  style: AppTextStyle.smallBodyBold
                      .copyWith(color: Colors.white, fontSize: 12),
                  btnSize: const Size(100, 40),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
