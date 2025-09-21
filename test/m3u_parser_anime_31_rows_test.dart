/*
 * Pusoo - IPTV Player
 * Copyright (C) 2025 Ibnul Mutaki
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:pusoo/core/utils/m3u_parser.dart';

void main() async {
  group('Anime31RowsTest', () {
    final String content = r'''
#EXTM3U

#EXTINF:-1 group-title="Hora De Aventura ova 2",Hora De Aventura ova 2
https://r6---sn-gpv7enek.googlevideo.com/videoplayback?requiressl=yes&id=561786bb9928a7cf&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:b1eb:570d:2d1d:d242&ipbits=0&expire=1497748645&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=01A7B3673E2585AAF115EF5D0E4B7B4924E0113B.150AA65F26B109981019D3849DF8DB46E8AB1C41&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enek&ms=nxu&mt=1495601061&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="filme",To Aru Majutsu no Index: Endymion no Kiseki1
https://r2---sn-gpv7enek.googlevideo.com/videoplayback?requiressl=yes&id=b2f184599cb909dd&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:b1eb:570d:2d1d:d242&ipbits=0&expire=1497749206&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=7F6288E726E854F938F568AF19D52616457232DC.0CCC95B7CF1D9468FAAC47336A57F957DDA6CCD6&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enek&ms=nxu&mt=1495601660&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="filme",To Aru Majutsu no Index: Endymion no Kiseki2
https://r4---sn-gpv7enek.googlevideo.com/videoplayback?requiressl=yes&id=b27a1ff5cceb998b&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:b1eb:570d:2d1d:d242&ipbits=0&expire=1497749206&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=1F108149190F518181BCC5262C38C59B6058745D.5091F64BF0242AB20EBF88CC44903DE7A4E65CF7&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enek&ms=nxu&mt=1495601660&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="filme",To Aru Majutsu no Index: Endymion no Kiseki3
https://r6---sn-gpv7ener.googlevideo.com/videoplayback?requiressl=yes&id=4657fb6a9375762a&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:b1eb:570d:2d1d:d242&ipbits=0&expire=1497749206&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=42045CACCF5808593E0B02C606641CACE798D5C3.62CC9EB9160611100B5042FE6E96D557175CD646&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7ener&ms=nxu&mt=1495601660&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="filme",To Aru Majutsu no Index: Endymion no Kiseki4
https://r1---sn-gpv7enek.googlevideo.com/videoplayback?requiressl=yes&id=1880c655f00c92f1&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:b1eb:570d:2d1d:d242&ipbits=0&expire=1497749206&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=482DE823364702B78402E44D0486A17EAF35DBA0.4B9DFA90EB665144CA1BC96C2B0CCC6F0AC4D628&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enek&ms=nxu&mt=1495601660&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="filme",Koe no Katachi
https://1hdph3x.oloadcdn.net/dl/l/HV2jaR7cdALzwfgm/UUnuyh3l2Js/%5BF%C3%AAnixSub_%26_ECN_Fansub%5D_Koe_no_Katashi_720p%5B8bits%5D%5B8430F5A0%5D.flv.wmv.mkv.rmvb.avi.vob.ogm.mp4?mime=true
#EXTINF:-1 group-title="filme",Kimi no Na wa
https://1fgm8k9.oloadcdn.net/dl/l/-CXCZKVgcdebRA-G/DTn209VsHA8/%5Bwww.fenixsub.com%5D_Kimi_no_na_Wa_720p.mp4?mime=true
#EXTINF:-1 group-title="Gangsta.",Gangsta.1
https://r2---sn-gpv7eney.googlevideo.com/videoplayback?requiressl=yes&id=479361c2daf5ba56&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497925479&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=3AF482A3C5C77F6F2A9E69DBFD58A58169458510.52210D4F55E8847FB75698A34CC2ABFC98925E98&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7eney&ms=nxu&mt=1495777881&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Gangsta.",Gangsta.2
https://r2---sn-gpv7ener.googlevideo.com/videoplayback?requiressl=yes&id=5298dab42fc46c39&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497925505&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=0424DD4B83372FC062F385ACB7860C83116F2E5E.5D485DF9140BD6CE3143010D15D973439A835C3C&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7ener&ms=nxu&mt=1495777943&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Gangsta.",Gangsta.3
https://r5---sn-gpv7enek.googlevideo.com/videoplayback?requiressl=yes&id=d805bde9351aef6b&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497925519&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=6C85707DBD510CE64D741C4CF475BE4D1156EF13.3CF876C6621D2DDE50F4BB8D2D7767C4AE8773D1&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enek&ms=nxu&mt=1495777943&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Gangsta.",Gangsta.4
https://r6---sn-gpv7eney.googlevideo.com/videoplayback?requiressl=yes&id=9e897067406aabe8&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497925533&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=5DAB0054BFB5B320C708CD868B2940802B821FFE.144237CCB5FDF5E8A8553C4DD6EDCEE7316BD5A0&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7eney&ms=nxu&mt=1495777943&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Gangsta.",Gangsta.5
https://r1---sn-gpv7enek.googlevideo.com/videoplayback?requiressl=yes&id=0a80ee6dd799e229&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497925556&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=737D60BA6649704CAE2142FC623F53C7FC556477.6EF58477B9B4B5337D084198A83D91E4A9B7A01F&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enek&ms=nxu&mt=1495778013&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Gangsta.",Gangsta.6
https://r4---sn-gpv7eney.googlevideo.com/videoplayback?requiressl=yes&id=cfe157ccb914f0fb&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497925565&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=5D0B4E7C52D1C3927D9250842E0CB8885E43C770.375F277C63ECE8A5E3FF0D0BC81C29D0B6F6C110&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7eney&ms=nxu&mt=1495778013&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Gangsta.",Gangsta.7
https://r4---sn-gpv7eney.googlevideo.com/videoplayback?requiressl=yes&id=39fdd9ab9d14fb50&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497925574&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=66737400EE212AE02F6BE4FE9F0BB0BFBF62A3DA.5500C43C8A83C27DC3FD94906B1E33C141F3B442&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7eney&ms=nxu&mt=1495778013&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Gangsta.",Gangsta.8
https://r4---sn-gpv7ener.googlevideo.com/videoplayback?requiressl=yes&id=a15d5d6922dc57ee&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497925587&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=4F147896DA49DB526EDBCCE85A8FED00150F5A8F.278D26EA12A9411C2CC41DBB14C2C39C652A0BEC&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7ener&ms=nxu&mt=1495778013&mv=m&pl=46&sc=yes&ir=1&rr=12
#EXTINF:-1 group-title="Gangsta.",Gangsta.9
https://r4---sn-gpv7ener.googlevideo.com/videoplayback?requiressl=yes&id=412bd569d31a3b19&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497925612&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=5421DFCEA2AD703D92E3FBE72295D1E41168FA8B.16110EE3B50449C9A5564064FA7C1DA54E118064&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7ener&ms=nxu&mt=1495778013&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Gangsta.",Gangsta.10
https://r1---sn-gpv7enek.googlevideo.com/videoplayback?requiressl=yes&id=5feb2006fff02905&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497925621&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=EDD59026732CA86DE9E2D6215418DCFF203F28.2E005E2399A8F14F3B590938C1BCFA728A383AE7&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enek&ms=nxu&mt=1495778013&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Gangsta.",Gangsta.11
https://r4---sn-gpv7enek.googlevideo.com/videoplayback?requiressl=yes&id=37c1407eb4e601ed&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497925630&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=239BC7E3B8067B948312266F8D0DD34EC17B34B6.1CC732D58403AE9B4B9C6EBD5F2F49960BE7BA50&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enek&ms=nxu&mt=1495778013&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Gangsta.",Gangsta.12
https://r6---sn-gpv7eney.googlevideo.com/videoplayback?requiressl=yes&id=bfb089d21ed67c27&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497925641&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=3E2AEB26EC6EC99F74B1198B0C7A9A62B228BBAA.31DAB74D83D684346F5D82A399068635C6C75CDA&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7eney&ms=nxu&mt=1495778013&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Occultic;Nine",Occultic;Nine1
https://r3---sn-gpv7eney.googlevideo.com/videoplayback?requiressl=yes&id=878bd56b662b9cc5&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497926000&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=0DAED2FDE66B2194F1F28C096CAB90EC35CBB5D1.3F7F21DE999DF57EC9D764367FA617E11A4F6F6C&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7eney&ms=nxu&mt=1495778423&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Occultic;Nine",Occultic;Nine2
https://r4---sn-gpv7ener.googlevideo.com/videoplayback?requiressl=yes&id=0d7be922da5c55a3&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497926019&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=59401C06FFC9DB8EFB2AF90F6FDC8DA66E169233.81080EBA6A0213E7CCCF884933F7FCC30BD524C4&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7ener&ms=nxu&mt=1495778423&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Occultic;Nine",Occultic;Nine3
https://r1---sn-gpv7enek.googlevideo.com/videoplayback?requiressl=yes&id=fd50790e5ef4d25e&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497926033&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=2A05D624520588CC3BEA45832D2DBAFDEB3F4DF8.784095B6060626DA1806AE8889690E93D5ED1839&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enek&ms=nxu&mt=1495778484&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Occultic;Nine",Occultic;Nine4
https://r4---sn-gpv7ener.googlevideo.com/videoplayback?requiressl=yes&id=c3d72125443ef292&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497926043&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=11F87703B96650D2F586B69118121DC10FB1FE03.46E390EB94EDAE82D9618323A54C61A791BAF35F&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7ener&ms=nxu&mt=1495778484&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Occultic;Nine",Occultic;Nine5
https://r5---sn-gpv7enek.googlevideo.com/videoplayback?requiressl=yes&id=d7e561f915a91fad&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497926056&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=576C181DEE7578DE73519C6DCB3244CAFB24775C.75BB45816332D6F6E181755EC34F32037DC6DF79&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enek&ms=nxu&mt=1495778484&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Occultic;Nine",Occultic;Nine6
https://r5---sn-gpv7ener.googlevideo.com/videoplayback?requiressl=yes&id=72c280669183ce6e&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497926067&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=2FB2509F7F6347EEBEA74DA6CF17013EDE1FA93F.36E8913676EC59951FA0FE700C6891270795219D&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7ener&ms=nxu&mt=1495778484&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Occultic;Nine",Occultic;Nine7
https://r5---sn-gpv7eney.googlevideo.com/videoplayback?requiressl=yes&id=8761561ef8de25ea&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497926089&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=495E701454BAEE6A046062BEDDBA481FF86E6181.0BB9C4347EBC93F574C986A8F52571E864F81EB2&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7eney&ms=nxu&mt=1495778544&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Occultic;Nine",Occultic;Nine8
https://r5---sn-gpv7enek.googlevideo.com/videoplayback?requiressl=yes&id=da8b9156480a4a98&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497926101&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=5CD12AEBFEBEC252F6D6DB1C1B65381976110B0D.3DD35B86C8126ECEBA80E3C9B3526C018FF472F8&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enek&ms=nxu&mt=1495778544&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Occultic;Nine",Occultic;Nine9
https://r6---sn-gpv7enek.googlevideo.com/videoplayback?requiressl=yes&id=ac7f83dcfaa9c5d6&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497926111&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=0D973006B1586AF7DC0A0F22FC0D4A24A4BDA9CA.6B0EE688BDF67F9855733E2AC871DD0C4A7C0879&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enek&ms=nxu&mt=1495778544&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Occultic;Nine",Occultic;Nine10
https://r3---sn-gpv7ener.googlevideo.com/videoplayback?requiressl=yes&id=9a17cd771d93f5d2&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497926120&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=3ECE0FEFFB5008992634CA26CB29A28692EEC9C3.5F910DFCDC2ED737604E8A704F7AD36BDCB715BA&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7ener&ms=nxu&mt=1495778544&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Occultic;Nine",Occultic;Nine11
https://r2---sn-gpv7ener.googlevideo.com/videoplayback?requiressl=yes&id=8385fa523a4f0969&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497926130&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=06932CDEC404E1BE67FB8AE9A83CE88525367918.0198EE385F29783180C8081899A8BC552D40ECBC&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7ener&ms=nxu&mt=1495778605&mv=m&pl=46&sc=yes
#EXTINF:-1 group-title="Occultic;Nine",Occultic;Nine12
https://r5---sn-gpv7enez.googlevideo.com/videoplayback?requiressl=yes&id=3f5cd111871980e1&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:495f:76da:dcae:d71d&ipbits=0&expire=1497926140&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=2BDC3C5DDFD01CC22D81911B2F10B063A2AEF2E4.6485B904F4B4AA9AEE877BEEC8721EE3009A290B&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enez&ms=nxu&mt=1495778544&mv=m&pl=46&sc=yes
''';

    test('test:1:listCountryShouldHave188Length', () async {
      final tracks = M3UParser.parse(content);

      // #EXTINF:-1 group-title="Hora De Aventura ova 2",Hora De Aventura ova 2
      // https://r6---sn-gpv7enek.googlevideo.com/videoplayback?requiressl=yes&id=561786bb9928a7cf&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:b1eb:570d:2d1d:d242&ipbits=0&expire=1497748645&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=01A7B3673E2585AAF115EF5D0E4B7B4924E0113B.150AA65F26B109981019D3849DF8DB46E8AB1C41&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enek&ms=nxu&mt=1495601061&mv=m&pl=46&sc=yes
      // #EXTINF:-1 group-title="filme",To Aru Majutsu no Index: Endymion no Kiseki1
      // https://r2---sn-gpv7enek.googlevideo.com/videoplayback?requiressl=yes&id=b2f184599cb909dd&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:b1eb:570d:2d1d:d242&ipbits=0&expire=1497749206&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=7F6288E726E854F938F568AF19D52616457232DC.0CCC95B7CF1D9468FAAC47336A57F957DDA6CCD6&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enek&ms=nxu&mt=1495601660&mv=m&pl=46&sc=yes
      // #EXTINF:-1 group-title="filme",To Aru Majutsu no Index: Endymion no Kiseki2
      // https://r4---sn-gpv7enek.googlevideo.com/videoplayback?requiressl=yes&id=b27a1ff5cceb998b&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:b1eb:570d:2d1d:d242&ipbits=0&expire=1497749206&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=1F108149190F518181BCC5262C38C59B6058745D.5091F64BF0242AB20EBF88CC44903DE7A4E65CF7&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enek&ms=nxu&mt=1495601660&mv=m&pl=46&sc=yes
      // #EXTINF:-1 group-title="filme",To Aru Majutsu no Index: Endymion no Kiseki3
      // https://r6---sn-gpv7ener.googlevideo.com/videoplayback?requiressl=yes&id=4657fb6a9375762a&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:b1eb:570d:2d1d:d242&ipbits=0&expire=1497749206&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=42045CACCF5808593E0B02C606641CACE798D5C3.62CC9EB9160611100B5042FE6E96D557175CD646&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7ener&ms=nxu&mt=1495601660&mv=m&pl=46&sc=yes
      // #EXTINF:-1 group-title="filme",To Aru Majutsu no Index: Endymion no Kiseki4
      // https://r1---sn-gpv7enek.googlevideo.com/videoplayback?requiressl=yes&id=1880c655f00c92f1&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:b1eb:570d:2d1d:d242&ipbits=0&expire=1497749206&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=482DE823364702B78402E44D0486A17EAF35DBA0.4B9DFA90EB665144CA1BC96C2B0CCC6F0AC4D628&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enek&ms=nxu&mt=1495601660&mv=m&pl=46&sc=yes

      expect(tracks.length, equals(31));

      expect(tracks[0].title, equals("Hora De Aventura ova 2"));
      expect(tracks[0].groupTitle, equals("Hora De Aventura ova 2"));
      expect(
        tracks[0].links.first,
        equals(
          "https://r6---sn-gpv7enek.googlevideo.com/videoplayback?requiressl=yes&id=561786bb9928a7cf&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:b1eb:570d:2d1d:d242&ipbits=0&expire=1497748645&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=01A7B3673E2585AAF115EF5D0E4B7B4924E0113B.150AA65F26B109981019D3849DF8DB46E8AB1C41&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enek&ms=nxu&mt=1495601061&mv=m&pl=46&sc=yes",
        ),
      );

      expect(
        tracks[1].title,
        equals("To Aru Majutsu no Index: Endymion no Kiseki1"),
      );

      expect(tracks[1].groupTitle, equals("filme"));
      expect(
        tracks[1].links.first,
        equals(
          "https://r2---sn-gpv7enek.googlevideo.com/videoplayback?requiressl=yes&id=b2f184599cb909dd&itag=18&source=blogger&app=blogger&ip=2804:14d:5c62:975c:b1eb:570d:2d1d:d242&ipbits=0&expire=1497749206&sparams=expire,id,ip,ipbits,itag,mm,mn,ms,mv,pl,requiressl,sc,source&signature=7F6288E726E854F938F568AF19D52616457232DC.0CCC95B7CF1D9468FAAC47336A57F957DDA6CCD6&key=cms1&cms_redirect=yes&mm=30&mn=sn-gpv7enek&ms=nxu&mt=1495601660&mv=m&pl=46&sc=yes",
        ),
      );

      // Test semua 31 track
      expect(tracks.length, equals(31));

      // Test track pertama
      expect(tracks[0].title, equals("Hora De Aventura ova 2"));
      expect(tracks[0].groupTitle, equals("Hora De Aventura ova 2"));
      expect(tracks[0].links.length, equals(1));
      expect(tracks[0].links.first, contains("googlevideo.com"));

      // Test track kedua
      expect(
        tracks[1].title,
        equals("To Aru Majutsu no Index: Endymion no Kiseki1"),
      );
      expect(tracks[1].groupTitle, equals("filme"));
      expect(tracks[1].links.length, equals(1));
      expect(tracks[1].links.first, contains("googlevideo.com"));

      // Test track ketiga
      expect(
        tracks[2].title,
        equals("To Aru Majutsu no Index: Endymion no Kiseki2"),
      );
      expect(tracks[2].groupTitle, equals("filme"));
      expect(tracks[2].links.length, equals(1));
      expect(tracks[2].links.first, contains("googlevideo.com"));

      // Test track keempat
      expect(
        tracks[3].title,
        equals("To Aru Majutsu no Index: Endymion no Kiseki3"),
      );
      expect(tracks[3].groupTitle, equals("filme"));
      expect(tracks[3].links.length, equals(1));
      expect(tracks[3].links.first, contains("googlevideo.com"));

      // Test track kelima
      expect(
        tracks[4].title,
        equals("To Aru Majutsu no Index: Endymion no Kiseki4"),
      );
      expect(tracks[4].groupTitle, equals("filme"));
      expect(tracks[4].links.length, equals(1));
      expect(tracks[4].links.first, contains("googlevideo.com"));

      // Test track keenam (Koe no Katachi)
      expect(tracks[5].title, equals("Koe no Katachi"));
      expect(tracks[5].groupTitle, equals("filme"));
      expect(tracks[5].links.length, equals(1));
      expect(tracks[5].links.first, contains("oloadcdn.net"));

      // Test track ketujuh (Kimi no Na wa)
      expect(tracks[6].title, equals("Kimi no Na wa"));
      expect(tracks[6].groupTitle, equals("filme"));
      expect(tracks[6].links.length, equals(1));
      expect(tracks[6].links.first, contains("oloadcdn.net"));

      // Test beberapa track Gangsta
      expect(tracks[7].title, equals("Gangsta.1"));
      expect(tracks[7].groupTitle, equals("Gangsta."));
      expect(tracks[7].links.length, equals(1));
      expect(tracks[7].links.first, contains("googlevideo.com"));

      expect(tracks[8].title, equals("Gangsta.2"));
      expect(tracks[8].groupTitle, equals("Gangsta."));
      expect(tracks[8].links.length, equals(1));
      expect(tracks[8].links.first, contains("googlevideo.com"));

      // Test track Gangsta.3 sampai Gangsta.12 (index 9-18)
      expect(tracks[9].title, equals("Gangsta.3"));
      expect(tracks[9].groupTitle, equals("Gangsta."));
      expect(tracks[9].links.length, equals(1));
      expect(tracks[9].links.first, contains("googlevideo.com"));

      expect(tracks[10].title, equals("Gangsta.4"));
      expect(tracks[10].groupTitle, equals("Gangsta."));
      expect(tracks[10].links.length, equals(1));
      expect(tracks[10].links.first, contains("googlevideo.com"));

      expect(tracks[11].title, equals("Gangsta.5"));
      expect(tracks[11].groupTitle, equals("Gangsta."));
      expect(tracks[11].links.length, equals(1));
      expect(tracks[11].links.first, contains("googlevideo.com"));

      expect(tracks[12].title, equals("Gangsta.6"));
      expect(tracks[12].groupTitle, equals("Gangsta."));
      expect(tracks[12].links.length, equals(1));
      expect(tracks[12].links.first, contains("googlevideo.com"));

      expect(tracks[13].title, equals("Gangsta.7"));
      expect(tracks[13].groupTitle, equals("Gangsta."));
      expect(tracks[13].links.length, equals(1));
      expect(tracks[13].links.first, contains("googlevideo.com"));

      expect(tracks[14].title, equals("Gangsta.8"));
      expect(tracks[14].groupTitle, equals("Gangsta."));
      expect(tracks[14].links.length, equals(1));
      expect(tracks[14].links.first, contains("googlevideo.com"));

      expect(tracks[15].title, equals("Gangsta.9"));
      expect(tracks[15].groupTitle, equals("Gangsta."));
      expect(tracks[15].links.length, equals(1));
      expect(tracks[15].links.first, contains("googlevideo.com"));

      expect(tracks[16].title, equals("Gangsta.10"));
      expect(tracks[16].groupTitle, equals("Gangsta."));
      expect(tracks[16].links.length, equals(1));
      expect(tracks[16].links.first, contains("googlevideo.com"));

      expect(tracks[17].title, equals("Gangsta.11"));
      expect(tracks[17].groupTitle, equals("Gangsta."));
      expect(tracks[17].links.length, equals(1));
      expect(tracks[17].links.first, contains("googlevideo.com"));

      expect(tracks[18].title, equals("Gangsta.12"));
      expect(tracks[18].groupTitle, equals("Gangsta."));
      expect(tracks[18].links.length, equals(1));
      expect(tracks[18].links.first, contains("googlevideo.com"));

      // Test track Occultic;Nine1 sampai Occultic;Nine12 (index 19-30)
      expect(tracks[19].title, equals("Occultic;Nine1"));
      expect(tracks[19].groupTitle, equals("Occultic;Nine"));
      expect(tracks[19].links.length, equals(1));
      expect(tracks[19].links.first, contains("googlevideo.com"));

      expect(tracks[20].title, equals("Occultic;Nine2"));
      expect(tracks[20].groupTitle, equals("Occultic;Nine"));
      expect(tracks[20].links.length, equals(1));
      expect(tracks[20].links.first, contains("googlevideo.com"));

      expect(tracks[21].title, equals("Occultic;Nine3"));
      expect(tracks[21].groupTitle, equals("Occultic;Nine"));
      expect(tracks[21].links.length, equals(1));
      expect(tracks[21].links.first, contains("googlevideo.com"));

      expect(tracks[22].title, equals("Occultic;Nine4"));
      expect(tracks[22].groupTitle, equals("Occultic;Nine"));
      expect(tracks[22].links.length, equals(1));
      expect(tracks[22].links.first, contains("googlevideo.com"));

      expect(tracks[23].title, equals("Occultic;Nine5"));
      expect(tracks[23].groupTitle, equals("Occultic;Nine"));
      expect(tracks[23].links.length, equals(1));
      expect(tracks[23].links.first, contains("googlevideo.com"));

      expect(tracks[24].title, equals("Occultic;Nine6"));
      expect(tracks[24].groupTitle, equals("Occultic;Nine"));
      expect(tracks[24].links.length, equals(1));
      expect(tracks[24].links.first, contains("googlevideo.com"));

      expect(tracks[25].title, equals("Occultic;Nine7"));
      expect(tracks[25].groupTitle, equals("Occultic;Nine"));
      expect(tracks[25].links.length, equals(1));
      expect(tracks[25].links.first, contains("googlevideo.com"));

      expect(tracks[26].title, equals("Occultic;Nine8"));
      expect(tracks[26].groupTitle, equals("Occultic;Nine"));
      expect(tracks[26].links.length, equals(1));
      expect(tracks[26].links.first, contains("googlevideo.com"));

      expect(tracks[27].title, equals("Occultic;Nine9"));
      expect(tracks[27].groupTitle, equals("Occultic;Nine"));
      expect(tracks[27].links.length, equals(1));
      expect(tracks[27].links.first, contains("googlevideo.com"));

      expect(tracks[28].title, equals("Occultic;Nine10"));
      expect(tracks[28].groupTitle, equals("Occultic;Nine"));
      expect(tracks[28].links.length, equals(1));
      expect(tracks[28].links.first, contains("googlevideo.com"));

      expect(tracks[29].title, equals("Occultic;Nine11"));
      expect(tracks[29].groupTitle, equals("Occultic;Nine"));
      expect(tracks[29].links.length, equals(1));
      expect(tracks[29].links.first, contains("googlevideo.com"));

      // Test track terakhir
      expect(tracks[30].title, equals("Occultic;Nine12"));
      expect(tracks[30].groupTitle, equals("Occultic;Nine"));
      expect(tracks[30].links.length, equals(1));
      expect(tracks[30].links.first, contains("googlevideo.com"));

      // Test bahwa semua track memiliki link
      for (int i = 0; i < tracks.length; i++) {
        expect(
          tracks[i].links.isNotEmpty,
          isTrue,
          reason: "Track $i (${tracks[i].title}) should have at least one link",
        );
      }
    });

    test('test:2:testGroupTitles', () async {
      final tracks = M3UParser.parse(content);

      // Test group titles
      final groupTitles = tracks.map((track) => track.groupTitle).toSet();
      expect(
        groupTitles.length,
        equals(4),
      ); // Hora De Aventura ova 2, filme, Gangsta., Occultic;Nine

      expect(groupTitles.contains("Hora De Aventura ova 2"), isTrue);
      expect(groupTitles.contains("filme"), isTrue);
      expect(groupTitles.contains("Gangsta."), isTrue);
      expect(groupTitles.contains("Occultic;Nine"), isTrue);

      // Test track count per group
      final filmeTracks = tracks
          .where((track) => track.groupTitle == "filme")
          .length;
      expect(
        filmeTracks,
        equals(6),
      ); // To Aru Majutsu no Index 1-4, Koe no Katachi, Kimi no Na wa

      final gangstaTracks = tracks
          .where((track) => track.groupTitle == "Gangsta.")
          .length;
      expect(gangstaTracks, equals(12)); // Gangsta.1 sampai Gangsta.12

      final occulticTracks = tracks
          .where((track) => track.groupTitle == "Occultic;Nine")
          .length;
      expect(
        occulticTracks,
        equals(12),
      ); // Occultic;Nine1 sampai Occultic;Nine12

      final horaTracks = tracks
          .where((track) => track.groupTitle == "Hora De Aventura ova 2")
          .length;
      expect(horaTracks, equals(1)); // Hora De Aventura ova 2
    });

    test('test:3:testUrlFormats', () async {
      final tracks = M3UParser.parse(content);

      // Test Google Video URLs
      final googleVideoTracks = tracks
          .where(
            (track) =>
                track.links.any((link) => link.contains("googlevideo.com")),
          )
          .length;
      expect(
        googleVideoTracks,
        equals(29),
      ); // Semua kecuali Koe no Katachi dan Kimi no Na wa

      // Test OLoad URLs
      final oloadTracks = tracks
          .where(
            (track) => track.links.any((link) => link.contains("oloadcdn.net")),
          )
          .length;
      expect(oloadTracks, equals(2)); // Koe no Katachi dan Kimi no Na wa

      // Test URL validation
      for (final track in tracks) {
        for (final link in track.links) {
          expect(link.startsWith("https://"), isTrue);
          expect(link.length, greaterThan(10));
        }
      }
    });

    test('test:4:testTrackProperties', () async {
      final tracks = M3UParser.parse(content);

      // Test bahwa semua track memiliki durasi 0 atau -1 (live/unknown)
      for (final track in tracks) {
        expect(track.duration, anyOf(equals(-1), equals(0)));
      }

      // Test bahwa semua track memiliki title yang tidak kosong
      for (final track in tracks) {
        expect(track.title.isNotEmpty, isTrue);
        expect(track.title.trim(), equals(track.title));
      }

      // Test bahwa semua track memiliki groupTitle yang tidak kosong
      for (final track in tracks) {
        expect(track.groupTitle.isNotEmpty, isTrue);
        expect(track.groupTitle.trim(), equals(track.groupTitle));
      }
    });

    test('test:5:testSpecificTracks', () async {
      final tracks = M3UParser.parse(content);

      // Test track dengan karakter khusus
      final koeTrack = tracks.firstWhere(
        (track) => track.title == "Koe no Katachi",
      );
      expect(koeTrack.groupTitle, equals("filme"));
      expect(koeTrack.links.first, contains("Koe_no_Katashi"));

      final kimiTrack = tracks.firstWhere(
        (track) => track.title == "Kimi no Na wa",
      );
      expect(kimiTrack.groupTitle, equals("filme"));
      expect(kimiTrack.links.first, contains("Kimi_no_na_Wa"));

      // Test track dengan titik di title
      final gangstaTracks = tracks
          .where((track) => track.groupTitle == "Gangsta.")
          .toList();
      for (int i = 0; i < gangstaTracks.length; i++) {
        expect(gangstaTracks[i].title, equals("Gangsta.${i + 1}"));
      }

      // Test track dengan semicolon di title
      final occulticTracks = tracks
          .where((track) => track.groupTitle == "Occultic;Nine")
          .toList();
      for (int i = 0; i < occulticTracks.length; i++) {
        expect(occulticTracks[i].title, equals("Occultic;Nine${i + 1}"));
      }
    });
  });
}
