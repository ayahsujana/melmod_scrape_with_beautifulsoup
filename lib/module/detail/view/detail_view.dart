// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:blocwithgetit/Util/Ads/applovin.dart';
import 'package:blocwithgetit/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:blocwithgetit/Util/capitalize.dart';
import 'package:blocwithgetit/model/detail.dart';
import 'package:blocwithgetit/state_util.dart';
import 'package:blocwithgetit/widget/loading_switcher.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/detail_controller.dart';
import '../state/detail_state.dart';

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
        listener: (context, state) {},
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
                    String fileName =
                        dTail.title.replaceAll(RegExp('[^A-Za-z0-9]'), '');
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text('${table[0].toUpperCase()}:',
                                  style: GoogleFonts.cousine(fontSize: 12)),
                            ),
                            Text(
                              table[1].capitalize(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.cousine(fontSize: 12),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Text(table[2].toUpperCase(),
                                style: GoogleFonts.cousine(fontSize: 12)),
                            const Spacer(),
                            Text(
                              table[3],
                              style: GoogleFonts.cousine(fontSize: 12),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Text('${table[4].toUpperCase()}:',
                                style: GoogleFonts.cousine(fontSize: 12)),
                            const Spacer(),
                            Text(
                              table[5],
                              style: GoogleFonts.cousine(fontSize: 12),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Text(table[6].toUpperCase(),
                                style: GoogleFonts.cousine(fontSize: 12)),
                            const Spacer(),
                            Text(
                              table[7],
                              style: GoogleFonts.cousine(fontSize: 12),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Text(table[8].toUpperCase(),
                                style: GoogleFonts.cousine(fontSize: 12)),
                            const Spacer(),
                            Text(
                              table[9],
                              style: GoogleFonts.cousine(fontSize: 12),
                            )
                          ],
                        ),
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
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                              padding: EdgeInsets.all(4),
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
                                  onPressed: () {},
                                  child: Text('DOWNLOAD',
                                      style: GoogleFonts.cousine(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)))),
                        ),

                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 50,
                        //   child: BlocConsumer<DownloadCubit, DownloadState>(
                        //     builder: (context, state) {
                        //       if (state is DownloadLoading) {
                        //         return const Center(
                        //           child:
                        //               CircularProgressIndicator(color: PRIMARY_COLOR),
                        //         );
                        //       }
                        //       return Padding(
                        //         padding: const EdgeInsets.all(4.0),
                        //         child: OutlinedButton(
                        //           style: OutlinedButton.styleFrom(
                        //             foregroundColor: PRIMARY_COLOR,
                        //             side: const BorderSide(
                        //               color: PRIMARY_COLOR,
                        //             ),
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(12),
                        //             ),
                        //           ),
                        //           onPressed: () => context
                        //               .read<DownloadCubit>()
                        //               .getDownloadMelmod(
                        //                   url: dTail.zipUrl,
                        //                   fileName: '$fileName.zip'),
                        //           child: Text(
                        //             "Download",
                        //             style: GoogleFonts.cousine14(),
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //     listener: (context, state) {
                        //       if (state is DownloadSuccess) {
                        //         showDialog(
                        //           barrierDismissible: false,
                        //           context: context,
                        //           builder: (context) {
                        //             return CupertinoAlertDialog(
                        //               title: Center(
                        //                 child: Text(
                        //                   'DOWNLOAD SUCCESS',
                        //                 ),
                        //               ),
                        //               content: Center(
                        //                 child: Container(
                        //                   height: 100,
                        //                   width: double.infinity,
                        //                   decoration: BoxDecoration(
                        //                       borderRadius:
                        //                           BorderRadius.circular(10)),
                        //                   child: Column(
                        //                     crossAxisAlignment:
                        //                         CrossAxisAlignment.center,
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment.center,
                        //                     mainAxisSize: MainAxisSize.min,
                        //                     children: [
                        //                       const Text('Mod has been downloaded:'),
                        //                       Text(state.path.replaceAll(
                        //                           '/storage/emulated/0', '')),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ),
                        //               actions: [
                        //                 Padding(
                        //                   padding: const EdgeInsets.all(8.0),
                        //                   child: OutlinedButton(
                        //                     style: OutlinedButton.styleFrom(
                        //                       foregroundColor: Colors.green,
                        //                       side: const BorderSide(
                        //                         color: Colors.green,
                        //                       ),
                        //                       shape: RoundedRectangleBorder(
                        //                         borderRadius:
                        //                             BorderRadius.circular(12),
                        //                       ),
                        //                     ),
                        //                     onPressed: () {
                        //                       // AdAppLovinNetwork()
                        //                       //     .showAdIntersApplovin(null);
                        //                       Get.back();
                        //                     },
                        //                     child: Text("OKEY"),
                        //                   ),
                        //                 ),
                        //               ],
                        //             );
                        //           },
                        //         );
                        //         // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //         //     content: Text(
                        //         //         'Download Success! File store in: ${state.path}')));
                        //       }
                        //     },
                        //   ),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
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
                                onPressed: () {},
                                child: Text("Share To",
                                    style: GoogleFonts.cousine(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
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
                                  onPressed: () {}, //Get.to(const HowToUse()),
                                  child: Text("How To Install",
                                      style: GoogleFonts.cousine(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        // applovin.showNativeAppLovin(),
                      ],
                    );
                  },
                ),
              ),
            ),
    );
  }
}
