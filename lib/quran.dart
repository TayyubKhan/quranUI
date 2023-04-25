import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class QuranScreen1 extends StatefulWidget {
  const QuranScreen1({Key? key}) : super(key: key);

  @override
  State<QuranScreen1> createState() => _QuranScreen1State();
}

class _QuranScreen1State extends State<QuranScreen1> {
  List<bool> containcolor = [true, false];
  PageController _page = PageController(viewportFraction: 0.5);
  double currentindex = 0.0;
  double slidervalue = 0.0;
  List<String> images1 = [
    'quranassets/image1.png',
    'quranassets/image2.png',
    'quranassets/image3.png',
  ];
  List<String> countries = ['السعودية', 'مصر', 'سورية', 'الهند', 'الأنجليزية'];
  List<int> surahno = [1, 2, 50, 77, 106, 128, 151, 177];
  List<int> juzzno = [1, 5, 7, 9, 5];
  List<String> juzz = [
    'حزب 1',
    'ربع الحزب 1',
    'نصف الحزب 1',
    'ثلث  الحزب 1',
    'الحزب 2'
  ];
  List<String> flag = [
    'quranassets/Saudi.png',
    'quranassets/Egypt.png',
    'quranassets/Syria.png',
    'quranassets/India.png',
    'quranassets/Uk.png'
  ];
  List<String> qariname = ['ماهر المعيقلي', 'عبد الرحمن السديس', 'مشاري راشد'];
  List<String> surah = [
    'سورة الفاتحة',
    'سورة البقرة',
    'سورة ال عمران',
    'سورة النساء',
    'سورة المائدة',
    'سورة الأنعام',
    'سورة الأعراف',
    'سورة الأنفال'
  ];
  List<String> images2 = [
    'quranassets/q1.png',
    'quranassets/q2.png',
    'quranassets/q3.png',
  ];
  Color color = const Color(0xff138D53);
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 1;
    final double width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: color,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'الأعدادات'),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: color,
                child: const Text(
                  'Logo',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w900),
                ),
              ),
              label: 'الرئيسية'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: 'العلامات'),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                width: width * 1,
                height: height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),
                    color: color.withOpacity(0.1)),
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        'بحث عن سورة',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: height * 0.1,
              child: PageView.builder(
                  controller: _page,
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: images1.length,
                  onPageChanged: (v) {
                    setState(() {
                      currentindex = v.toDouble();
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image(image: AssetImage(images1[index]));
                  }),
            ),
            DotsIndicator(
              dotsCount: images1.length,
              position: currentindex,
              axis: Axis.horizontal,
              decorator: DotsDecorator(activeColor: color),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), color: color),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          enableDrag: true,
                          backgroundColor: const Color(0xfff9fafe),
                          elevation: 0.01,
                          useSafeArea: true,
                          context: context,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          builder: (BuildContext context) {
                            return Container(
                              padding: const EdgeInsets.only(top: 10),
                              height: height * 0.5,
                              child: Column(
                                children: [
                                  const Text(
                                    'اختر دولة القارئ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: ListView.builder(
                                          itemCount: countries.length,
                                          itemBuilder: (context, i) {
                                            return Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Image(
                                                        height: height * 0.05,
                                                        width: height * 0.05,
                                                        image: AssetImage(
                                                            flag[i])),
                                                    Text(countries[i]),
                                                  ],
                                                ),
                                                Divider(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ],
                                            );
                                          }),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.expand_circle_down_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            'جميع النتائج',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Text(
                    'القراء',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            SizedBox(
              height: height * 0.25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images2.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Image(
                              height: height * 0.2,
                              image: AssetImage(images2[i])),
                          Text(
                            qariname[i],
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Expanded(
              child: Container(
                color: const Color(0xffF2F2F2),
                width: width,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      width: width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              containcolor[0] = true;
                              containcolor[1] = false;
                              setState(() {});
                            },
                            child: Container(
                              height: height * 0.04,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                  color: containcolor[0] == true
                                      ? color
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: Text('الجزء',
                                      style: TextStyle(
                                        color: containcolor[0] == true
                                            ? Colors.white
                                            : Colors.black,
                                      ))),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              containcolor[0] = false;
                              containcolor[1] = true;
                              setState(() {});
                            },
                            child: Container(
                              height: height * 0.04,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                  color: containcolor[1] == true
                                      ? color
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: Text(
                                'السورة',
                                style: TextStyle(
                                  color: containcolor[1] == true
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: containcolor[0] == true
                            ? ListView.builder(
                                itemCount: juzz.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(juzzno[index].toString()),
                                          Column(
                                            children: [
                                              const Text('الجزء 1'),
                                              Text(juzz[index]),
                                              SizedBox(
                                                height: height * 0.01,
                                              ),
                                              Text(surah[1]),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                    ],
                                  );
                                })
                            : ListView.builder(
                                itemCount: surah.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(surahno[index].toString()),
                                          Text(surah[index]),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                    ],
                                  );
                                }),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
