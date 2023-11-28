import 'dart:io';

import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:blocwithgetit/Util/Ads/applovin.dart';
import 'package:blocwithgetit/Util/helper/dialog.dart';
import 'package:blocwithgetit/Util/helper/permission_handler.dart';
import 'package:blocwithgetit/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

@singleton
class DetailController extends Cubit<DetailState> implements IBlocBase {
  DetailController() : super(DetailState());
  Permission permission = Permission.storage;

  @override
  void initState() {
    //initState event
    ApplovinAdNetwork().onInit();
    //PermissionUtil.requestAll();
  }

  checkPermission(BuildContext context) async {
    PermissionStatus storageStatus = await permission.status;
    if (!storageStatus.isGranted) {
      showExitDialog(context);
    }
  }

  @override
  void dispose() {
    //dispose event
    ApplovinAdNetwork().dispose();
  }

  @override
  void ready() {
    //ready event
  }

  showExitDialog(BuildContext context) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            'Required Permissions',
            style: GoogleFonts.cousine(),
          ),
          content: SizedBox(
            height: 50,
            child: Center(
              child: Text(
                'This app require permission to download mods files to your phone.',
                style: GoogleFonts.cousine(fontSize: 12),
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
                  PermissionUtil.requestAll();
                  Get.back();
                },
                child: Text(
                  "Oke",
                  style: GoogleFonts.cousine(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  getDownloadMelmod({required String url, required String fileName}) async {
    state.isLoad;
    Future.delayed(const Duration(seconds: 3));
    Directory directory;
    Dio dio = Dio();
    String newDirectory = "/storage/emulated/0/Download";
    state.path = "$newDirectory/ModsMelon";
    directory = Directory(state.path);
    File saveFile = File('${directory.path}/$fileName');
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    if (await directory.exists()) {
      await dio.download(
        url,
        saveFile.path,
        onReceiveProgress: (count, total) {
          state.progress = (count / total * 100);
          print(state.progress);
          if (state.progress == 100) {
            state.isLoad = false;
            emit(state.copyWith());
          }
        },
      );
    }
  }

  getMelmodDetail({required String url}) async {
    state.isLoading;

    final parser = DetailParser(url);
    parser.serviceHTML().then((body) {
      final soup = BeautifulSoup(body);
      final data = parser.parseHTML(soup);

      state.detail = data;
      state.isLoading = false;
      emit(state.copyWith());
    });
  }
}
