import 'dart:io';
import 'dart:math';

// import 'package:flutter/cupertino.dart';
import 'package:pusoo/core/utils/m3u_parser.dart';
import 'package:pusoo/shared/data/models/m3u_track.dart';

void main(List<String> args) async {
  final file = File('samples/sample_playlist.txt');
  final m3uContent = await file.readAsString();

  List<M3UTrack> check = M3UParser.parse(m3uContent);

  final String content1 = r'''
#EXTINF:-1 group-title="CHANNEL | VISION+" ch-number="12" tvg-logo="https://raw.githubusercontent.com/MayToko/Kopi/main/Logo%20maytoko.png",SCTV
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Linux; Android 14; SM-A245F Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/124.0.6367.204 Mobile Safari/537.36
https://op-group1-swiftservehd-1.dens.tv/h/h217/02.m3u8|user-agent=DENSGO/3.00.00 (Linux;Android 15.0.0;) ExoPlayerLib/2.19.1
''';
  List<M3UTrack> result1 = M3UParser.parse(content1);

  // final random = Random();
  // final int randomNumber = random.nextInt(check.length);

  // print(check.length.toString());
  // print(check[randomNumber].toString());
  // print(check[check.length - 1].toString());
  // print(check[0].toString());
  // debugPrint("check.length");

  print(result1);
}
