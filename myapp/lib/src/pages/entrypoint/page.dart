import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myapp/src/components/index.dart';

import 'package:myapp/auth/auth_state.dart';

import 'package:url_launcher/url_launcher_string.dart';
import 'package:auth_buttons/auth_buttons.dart';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:collection/collection.dart';
import 'package:myapp/src/pages/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:latlng/latlng.dart';
import 'package:badges/badges.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart' as http;
import 'package:teta_cms/teta_cms.dart';
import 'package:webviewx/webviewx.dart';

class PageEntryPoint extends StatefulWidget {
  const PageEntryPoint({
    Key? key,
  }) : super(key: key);

  @override
  _StateEntryPoint createState() => _StateEntryPoint();
}

class _StateEntryPoint extends State<PageEntryPoint> {
  int filterChange = 0;
  String search = '0';
  String cMSKey = 'filter';
  String cMSValue = 'for_you';
  int changePage = 0;

  var datasets = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
              border: Border(
                left: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                    color: Color(0xFF000000)),
                top: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                    color: Color(0xFF000000)),
                right: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                    color: Color(0xFF000000)),
                bottom: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                    color: Color(0xFF000000)),
              ),
            ),
            child: SafeArea(
              left: false,
              top: true,
              right: false,
              bottom: false,
              child: IndexedStack(
                index: changePage,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * (7 / 100),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(r'''Tamil Nation''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: const Color(0xFFFF0000),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 32,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  maxLines: 1),
                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    changePage = 1;
                                  });
                                },
                                onDoubleTap: () async {},
                                onLongPress: () async {},
                                child: Icon(
                                  MdiIcons.fromString('text-search'),
                                  size: 32,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 24,
                        ),
                        child: SizedBox(
                          height:
                              MediaQuery.of(context).size.height * (5 / 100),
                          child: ListView(
                            primary: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 24,
                                  right: 16,
                                ),
                                child: GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      filterChange = 0;
                                    });
                                    setState(() {
                                      cMSValue = '''for_you''';
                                    });
                                  },
                                  onDoubleTap: () async {},
                                  onLongPress: () async {},
                                  child: (('''${filterChange}''') == '0')
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(r'''articles''',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color:
                                                        const Color(0xFF000000),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                top: 2,
                                              ),
                                              padding: EdgeInsets.zero,
                                              width: 60,
                                              height: 2,
                                              decoration: const BoxDecoration(
                                                color: Color(0xFF000000),
                                                border: Border(
                                                  left: BorderSide(
                                                      width: 0,
                                                      style: BorderStyle.none,
                                                      color: Color(0xFF000000)),
                                                  top: BorderSide(
                                                      width: 0,
                                                      style: BorderStyle.none,
                                                      color: Color(0xFF000000)),
                                                  right: BorderSide(
                                                      width: 0,
                                                      style: BorderStyle.none,
                                                      color: Color(0xFF000000)),
                                                  bottom: BorderSide(
                                                      width: 0,
                                                      style: BorderStyle.none,
                                                      color: Color(0xFF000000)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Text(r'''articles''',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: const Color(0xFF000000),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              fontStyle: FontStyle.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          textAlign: TextAlign.left,
                                          textDirection: TextDirection.ltr,
                                          maxLines: 1),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    cMSValue = '''thalam''';
                                  });
                                  setState(() {
                                    filterChange = 1;
                                  });
                                },
                                onDoubleTap: () async {},
                                onLongPress: () async {},
                                child: (('''${filterChange}''') == '1')
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(r'''Thalam''',
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  color:
                                                      const Color(0xFF000000),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              textAlign: TextAlign.left,
                                              textDirection: TextDirection.ltr,
                                              maxLines: 1),
                                          Container(
                                            margin: const EdgeInsets.only(
                                              top: 2,
                                            ),
                                            padding: EdgeInsets.zero,
                                            width: 73,
                                            height: 2,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF000000),
                                              border: Border(
                                                left: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                    color: Color(0xFF000000)),
                                                top: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                    color: Color(0xFF000000)),
                                                right: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                    color: Color(0xFF000000)),
                                                bottom: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                    color: Color(0xFF000000)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Text(r'''thalam''',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: const Color(0xFF000000),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            fontStyle: FontStyle.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        textAlign: TextAlign.left,
                                        textDirection: TextDirection.ltr,
                                        maxLines: 1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                ),
                                child: GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      filterChange = 2;
                                    });
                                    setState(() {
                                      cMSValue = '''top_stories''';
                                    });
                                  },
                                  onDoubleTap: () async {},
                                  onLongPress: () async {},
                                  child: (('''${filterChange}''') == '2')
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(r'''Kalam''',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color:
                                                        const Color(0xFF000000),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                top: 2,
                                              ),
                                              padding: EdgeInsets.zero,
                                              width: 89,
                                              height: 2,
                                              decoration: const BoxDecoration(
                                                color: Color(0xFF000000),
                                                border: Border(
                                                  left: BorderSide(
                                                      width: 0,
                                                      style: BorderStyle.none,
                                                      color: Color(0xFF000000)),
                                                  top: BorderSide(
                                                      width: 0,
                                                      style: BorderStyle.none,
                                                      color: Color(0xFF000000)),
                                                  right: BorderSide(
                                                      width: 0,
                                                      style: BorderStyle.none,
                                                      color: Color(0xFF000000)),
                                                  bottom: BorderSide(
                                                      width: 0,
                                                      style: BorderStyle.none,
                                                      color: Color(0xFF000000)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Text(r'''kalam''',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: const Color(0xFF000000),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              fontStyle: FontStyle.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          textAlign: TextAlign.left,
                                          textDirection: TextDirection.ltr,
                                          maxLines: 1),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    filterChange = 3;
                                  });
                                  setState(() {
                                    cMSValue = '''popular''';
                                  });
                                },
                                onDoubleTap: () async {},
                                onLongPress: () async {},
                                child: (('''${filterChange}''') == '3')
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(r'''Pulam''',
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  color:
                                                      const Color(0xFF000000),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              textAlign: TextAlign.left,
                                              textDirection: TextDirection.ltr,
                                              maxLines: 1),
                                          Container(
                                            margin: const EdgeInsets.only(
                                              top: 2,
                                            ),
                                            padding: EdgeInsets.zero,
                                            width: 64,
                                            height: 2,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF000000),
                                              border: Border(
                                                left: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                    color: Color(0xFF000000)),
                                                top: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                    color: Color(0xFF000000)),
                                                right: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                    color: Color(0xFF000000)),
                                                bottom: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                    color: Color(0xFF000000)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Text(r'''Pulam''',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: const Color(0xFF000000),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            fontStyle: FontStyle.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        textAlign: TextAlign.left,
                                        textDirection: TextDirection.ltr,
                                        maxLines: 1),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    filterChange = 4;
                                  });
                                  setState(() {
                                    cMSValue = '''incredibl''';
                                  });
                                },
                                onDoubleTap: () async {},
                                onLongPress: () async {},
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    right: 24,
                                  ),
                                  child: (('''${filterChange}''') == '4')
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(r'''World''',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color:
                                                        const Color(0xFF000000),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                top: 2,
                                              ),
                                              padding: EdgeInsets.zero,
                                              width: 82,
                                              height: 2,
                                              decoration: const BoxDecoration(
                                                color: Color(0xFF000000),
                                                border: Border(
                                                  left: BorderSide(
                                                      width: 0,
                                                      style: BorderStyle.none,
                                                      color: Color(0xFF000000)),
                                                  top: BorderSide(
                                                      width: 0,
                                                      style: BorderStyle.none,
                                                      color: Color(0xFF000000)),
                                                  right: BorderSide(
                                                      width: 0,
                                                      style: BorderStyle.none,
                                                      color: Color(0xFF000000)),
                                                  bottom: BorderSide(
                                                      width: 0,
                                                      style: BorderStyle.none,
                                                      color: Color(0xFF000000)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Text(r'''world''',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: const Color(0xFF000000),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              fontStyle: FontStyle.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          textAlign: TextAlign.left,
                                          textDirection: TextDirection.ltr,
                                          maxLines: 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FutureBuilder(
                          future: TetaCMS.instance.client.getCollection(
                            '629cdf8fe36c42a60410705e',
                            filters: [
                              Filter('_vis', 'public'),
                              Filter('''${cMSKey}''', '''${cMSValue}''')
                            ],
                            limit: 15,
                          ),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final list = snapshot.data as List<dynamic>?;
                            datasets['Cms fetch'] = list ?? const <dynamic>[];
                            const index = 0;

                            return SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  (80 / 100),
                              child: Builder(
                                builder: (context) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        this.datasets['Cms fetch'].length > 0
                                            ? this.datasets['Cms fetch'].length
                                            : 0,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          top: 24,
                                        ),
                                        child: GestureDetector(
                                          onTap: () async {
                                            await Navigator.push<void>(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PageArticleDetails(
                                                  articleImage: datasets[
                                                                  'Cms fetch']
                                                              ?[index]
                                                          ?['article_image'] ??
                                                      '',
                                                  category:
                                                      datasets['Cms fetch']
                                                                  ?[index]
                                                              ?['category'] ??
                                                          '',
                                                  title: datasets['Cms fetch']
                                                          ?[index]?['title'] ??
                                                      '',
                                                  authorImage: datasets[
                                                                  'Cms fetch']
                                                              ?[index]
                                                          ?['author_image'] ??
                                                      '',
                                                  authorName: datasets[
                                                                  'Cms fetch']
                                                              ?[index]
                                                          ?['author_name'] ??
                                                      '',
                                                  articleDate: datasets[
                                                                  'Cms fetch']
                                                              ?[index]
                                                          ?['article_date'] ??
                                                      '',
                                                  articleDescription: datasets[
                                                                  'Cms fetch']
                                                              ?[index]?[
                                                          'article_description'] ??
                                                      '',
                                                  articleImageOne: datasets[
                                                                  'Cms fetch']
                                                              ?[index]?[
                                                          'article_image_one'] ??
                                                      '',
                                                  articleImageTwo: datasets[
                                                                  'Cms fetch']
                                                              ?[index]?[
                                                          'article_image_two'] ??
                                                      '',
                                                  videoYTID: datasets[
                                                                  'Cms fetch']
                                                              ?[index]
                                                          ?['video_yt_id'] ??
                                                      '',
                                                ),
                                              ),
                                            );
                                          },
                                          onDoubleTap: () async {},
                                          onLongPress: () async {},
                                          child: PageArticleCard(
                                            articleImage: datasets['Cms fetch']
                                                        ?[index]
                                                    ?['article_image'] ??
                                                '',
                                            category: datasets['Cms fetch']
                                                    ?[index]?['category'] ??
                                                '',
                                            title: datasets['Cms fetch']?[index]
                                                    ?['title'] ??
                                                '',
                                            authorImage: datasets['Cms fetch']
                                                    ?[index]?['author_image'] ??
                                                '',
                                            authorName: datasets['Cms fetch']
                                                    ?[index]?['author_name'] ??
                                                '',
                                            articleDate: datasets['Cms fetch']
                                                    ?[index]?['article_date'] ??
                                                '',
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          }),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * (7 / 100),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(r'''Search Articles''',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 32,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                textDirection: TextDirection.ltr,
                                maxLines: 1),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height * (10 / 100),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 24,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 16,
                                    top: 8,
                                    right: 16,
                                    bottom: 8,
                                  ),
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF1F1F1),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                    border: null,
                                  ),
                                  child: TextField(
                                    onChanged: (String value) async {
                                      setState(() {
                                        search = value;
                                      });
                                    },
                                    onSubmitted: (String value) async {},
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                        ),
                                      ),
                                      hintText: r'''Search by category...''',
                                      contentPadding: const EdgeInsets.only(
                                        left: 16,
                                      ),
                                    ),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1,
                                    minLines: 1,
                                    maxLength: null,
                                    obscureText: false,
                                    showCursor: true,
                                    autocorrect: false,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    changePage = 0;
                                  });
                                },
                                onDoubleTap: () async {},
                                onLongPress: () async {},
                                child: Container(
                                  margin: EdgeInsets.zero,
                                  padding: const EdgeInsets.only(
                                    left: 9,
                                    top: 9,
                                    right: 9,
                                    bottom: 9,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF1F1F1),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                    border: Border(
                                      left: BorderSide(
                                          width: 1, color: Color(0xFF000000)),
                                      top: BorderSide(
                                          width: 1, color: Color(0xFF000000)),
                                      right: BorderSide(
                                          width: 1, color: Color(0xFF000000)),
                                      bottom: BorderSide(
                                          width: 1, color: Color(0xFF000000)),
                                    ),
                                  ),
                                  child: Icon(
                                    MdiIcons.fromString('close-circle'),
                                    size: 28,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FutureBuilder(
                          future: TetaCMS.instance.client.getCollection(
                            '629cdf8fe36c42a60410705e',
                            filters: [
                              Filter('_vis', 'public'),
                              Filter('category', '''${search}''')
                            ],
                            limit: 25,
                          ),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final list = snapshot.data as List<dynamic>?;
                            datasets['Cms fetch 2'] = list ?? const <dynamic>[];
                            const index = 0;

                            return SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  (80 / 100),
                              child: Builder(
                                builder: (context) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        this.datasets['Cms fetch 2'].length > 0
                                            ? this
                                                .datasets['Cms fetch 2']
                                                .length
                                            : 0,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          top: 24,
                                        ),
                                        child: GestureDetector(
                                          onTap: () async {
                                            await Navigator.push<void>(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PageArticleDetails(
                                                  articleImage: datasets[
                                                                  'Cms fetch 2']
                                                              ?[index]
                                                          ?['article_image'] ??
                                                      '',
                                                  category:
                                                      datasets['Cms fetch 2']
                                                                  ?[index]
                                                              ?['category'] ??
                                                          '',
                                                  title: datasets['Cms fetch 2']
                                                          ?[index]?['title'] ??
                                                      '',
                                                  authorImage: datasets[
                                                                  'Cms fetch 2']
                                                              ?[index]
                                                          ?['author_image'] ??
                                                      '',
                                                  authorName: datasets[
                                                                  'Cms fetch 2']
                                                              ?[index]
                                                          ?['author_name'] ??
                                                      '',
                                                  articleDate: datasets[
                                                                  'Cms fetch 2']
                                                              ?[index]
                                                          ?['article_date'] ??
                                                      '',
                                                  articleDescription: datasets[
                                                                  'Cms fetch 2']
                                                              ?[index]?[
                                                          'article_description'] ??
                                                      '',
                                                  articleImageOne: datasets[
                                                                  'Cms fetch 2']
                                                              ?[index]?[
                                                          'article_image_one'] ??
                                                      '',
                                                  articleImageTwo: datasets[
                                                                  'Cms fetch 2']
                                                              ?[index]?[
                                                          'article_image_two'] ??
                                                      '',
                                                  videoYTID: datasets[
                                                                  'Cms fetch 2']
                                                              ?[index]
                                                          ?['video_yt_id'] ??
                                                      '',
                                                ),
                                              ),
                                            );
                                          },
                                          onDoubleTap: () async {},
                                          onLongPress: () async {},
                                          child: PageArticleCard(
                                            articleImage:
                                                datasets['Cms fetch 2']?[index]
                                                        ?['article_image'] ??
                                                    '',
                                            category: datasets['Cms fetch 2']
                                                    ?[index]?['category'] ??
                                                '',
                                            title: datasets['Cms fetch 2']
                                                    ?[index]?['title'] ??
                                                '',
                                            authorImage: datasets['Cms fetch 2']
                                                    ?[index]?['author_image'] ??
                                                '',
                                            authorName: datasets['Cms fetch 2']
                                                    ?[index]?['author_name'] ??
                                                '',
                                            articleDate: datasets['Cms fetch 2']
                                                    ?[index]?['article_date'] ??
                                                '',
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
