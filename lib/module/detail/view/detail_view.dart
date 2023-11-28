// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:blocwithgetit/Util/Ads/applovin.dart';
import 'package:blocwithgetit/Util/Constant/app_info.dart';
import 'package:blocwithgetit/Util/helper/permission_handler.dart';
import 'package:blocwithgetit/core.dart';
import 'package:blocwithgetit/module/detail/widget/download_button.dart';
import 'package:blocwithgetit/module/detail/widget/how_install.dart';
import 'package:blocwithgetit/module/detail/widget/share_button.dart';
import 'package:blocwithgetit/module/howto.dart/how_to_install.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:blocwithgetit/model/detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class DetailView extends StatefulWidget {
  const DetailView({
    Key? key,
    required this.url,
    required this.image,
  }) : super(key: key);
  final String url;
  final String image;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  DetailController controller = DetailController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<DetailController>()) {
      GetIt.I.unregister<DetailController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    controller.getMelmodDetail(url: widget.url);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<DetailController, DetailState>(
        listener: (context, state) {
          controller.checkPermission(context);
          if (!state.isLoad) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Center(
                    child: Text(
                      'DOWNLOAD SUCCESS',
                      style: GoogleFonts.cousine(fontWeight: FontWeight.bold),
                    ),
                  ),
                  content: Center(
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Mod melon playground has been downloaded in folder:',
                            style: GoogleFonts.cousine(),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            state.path
                                .replaceAll('/storage/emulated/0', '')
                                .replaceAll('&nbsp;', ''),
                            style: GoogleFonts.cousine(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.green,
                          side: const BorderSide(
                            color: Colors.green,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          //AdAppLovinNetwork().showAdIntersApplovin(null);
                          Get.back();
                        },
                        child: Text("Oke",
                            style: GoogleFonts.cousine(
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: BlocBuilder<DetailController, DetailState>(
          builder: (context, state) {
            final bloc = context.read<DetailController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    DetailController controller,
    DetailState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Melmod',
            style:
                GoogleFonts.cousine(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: state.isLoading
          ? loading()
          : LoadingSwitcher(
              loading: state.isLoading,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.detail.length,
                  itemBuilder: (context, index) {
                    DetailMelmodModel dTail = state.detail[index];
                    final table = dTail.table.split(' => ');
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 175.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                widget.image,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(dTail.title.toUpperCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.cousine(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Divider(
                          color: Colors.green,
                          thickness: 3,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        RowDetailMelmod(title1: table[0], title2: table[1]),
                        const SizedBox(
                          height: 5.0,
                        ),
                        RowDetailMelmod(title1: table[2], title2: table[3]),
                        const SizedBox(
                          height: 5.0,
                        ),
                        RowDetailMelmod(title1: table[4], title2: table[5]),
                        const SizedBox(
                          height: 5.0,
                        ),
                        RowDetailMelmod(title1: table[6], title2: table[7]),
                        const SizedBox(
                          height: 5.0,
                        ),
                        RowDetailMelmod(title1: table[8], title2: table[9]),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Divider(
                          color: Colors.green,
                          thickness: 3,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        ApplovinAdNetwork().showNativeBannerAppLovin(),
                        const SizedBox(
                          height: 5.0,
                        ),
                        DownloadMelmodButton(
                            melmod: dTail, controller: controller),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ShareMelmodButton(
                              melmod: dTail.title,
                            ),
                            Expanded(
                              child: HowToInstallMelmod(),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
    );
  }

  RowDetailMelmod({required String title1, required String title2}) {
    return Row(
      children: [
        Text(title1.toUpperCase(), style: GoogleFonts.cousine(fontSize: 12)),
        const Spacer(),
        Text(
          title2,
          style: GoogleFonts.cousine(fontSize: 12),
        )
      ],
    );
  }
}
