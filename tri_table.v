module tri_table(input [8:0]address,
                 output reg[13:0]data);
always @(*)
begin
    case (address)
        9'd0: data   <= 14'd8192;
        9'd1: data   <= 14'd8256;
        9'd2: data   <= 14'd8320;
        9'd3: data   <= 14'd8384;
        9'd4: data   <= 14'd8448;
        9'd5: data   <= 14'd8512;
        9'd6: data   <= 14'd8576;
        9'd7: data   <= 14'd8640;
        9'd8: data   <= 14'd8704;
        9'd9: data   <= 14'd8768;
        9'd10: data  <= 14'd8832;
        9'd11: data  <= 14'd8896;
        9'd12: data  <= 14'd8960;
        9'd13: data  <= 14'd9024;
        9'd14: data  <= 14'd9088;
        9'd15: data  <= 14'd9152;
        9'd16: data  <= 14'd9216;
        9'd17: data  <= 14'd9280;
        9'd18: data  <= 14'd9344;
        9'd19: data  <= 14'd9408;
        9'd20: data  <= 14'd9472;
        9'd21: data  <= 14'd9536;
        9'd22: data  <= 14'd9600;
        9'd23: data  <= 14'd9664;
        9'd24: data  <= 14'd9728;
        9'd25: data  <= 14'd9792;
        9'd26: data  <= 14'd9856;
        9'd27: data  <= 14'd9920;
        9'd28: data  <= 14'd9984;
        9'd29: data  <= 14'd10048;
        9'd30: data  <= 14'd10112;
        9'd31: data  <= 14'd10176;
        9'd32: data  <= 14'd10240;
        9'd33: data  <= 14'd10304;
        9'd34: data  <= 14'd10368;
        9'd35: data  <= 14'd10432;
        9'd36: data  <= 14'd10496;
        9'd37: data  <= 14'd10560;
        9'd38: data  <= 14'd10624;
        9'd39: data  <= 14'd10688;
        9'd40: data  <= 14'd10752;
        9'd41: data  <= 14'd10816;
        9'd42: data  <= 14'd10880;
        9'd43: data  <= 14'd10944;
        9'd44: data  <= 14'd11008;
        9'd45: data  <= 14'd11072;
        9'd46: data  <= 14'd11136;
        9'd47: data  <= 14'd11200;
        9'd48: data  <= 14'd11264;
        9'd49: data  <= 14'd11328;
        9'd50: data  <= 14'd11392;
        9'd51: data  <= 14'd11456;
        9'd52: data  <= 14'd11520;
        9'd53: data  <= 14'd11584;
        9'd54: data  <= 14'd11648;
        9'd55: data  <= 14'd11712;
        9'd56: data  <= 14'd11776;
        9'd57: data  <= 14'd11840;
        9'd58: data  <= 14'd11904;
        9'd59: data  <= 14'd11968;
        9'd60: data  <= 14'd12032;
        9'd61: data  <= 14'd12096;
        9'd62: data  <= 14'd12160;
        9'd63: data  <= 14'd12224;
        9'd64: data  <= 14'd12288;
        9'd65: data  <= 14'd12352;
        9'd66: data  <= 14'd12416;
        9'd67: data  <= 14'd12480;
        9'd68: data  <= 14'd12544;
        9'd69: data  <= 14'd12608;
        9'd70: data  <= 14'd12672;
        9'd71: data  <= 14'd12736;
        9'd72: data  <= 14'd12800;
        9'd73: data  <= 14'd12864;
        9'd74: data  <= 14'd12928;
        9'd75: data  <= 14'd12992;
        9'd76: data  <= 14'd13056;
        9'd77: data  <= 14'd13120;
        9'd78: data  <= 14'd13184;
        9'd79: data  <= 14'd13248;
        9'd80: data  <= 14'd13312;
        9'd81: data  <= 14'd13376;
        9'd82: data  <= 14'd13440;
        9'd83: data  <= 14'd13504;
        9'd84: data  <= 14'd13568;
        9'd85: data  <= 14'd13632;
        9'd86: data  <= 14'd13696;
        9'd87: data  <= 14'd13760;
        9'd88: data  <= 14'd13824;
        9'd89: data  <= 14'd13888;
        9'd90: data  <= 14'd13952;
        9'd91: data  <= 14'd14016;
        9'd92: data  <= 14'd14080;
        9'd93: data  <= 14'd14144;
        9'd94: data  <= 14'd14208;
        9'd95: data  <= 14'd14272;
        9'd96: data  <= 14'd14336;
        9'd97: data  <= 14'd14400;
        9'd98: data  <= 14'd14464;
        9'd99: data  <= 14'd14528;
        9'd100: data <= 14'd14592;
        9'd101: data <= 14'd14656;
        9'd102: data <= 14'd14720;
        9'd103: data <= 14'd14784;
        9'd104: data <= 14'd14848;
        9'd105: data <= 14'd14912;
        9'd106: data <= 14'd14976;
        9'd107: data <= 14'd15040;
        9'd108: data <= 14'd15104;
        9'd109: data <= 14'd15168;
        9'd110: data <= 14'd15232;
        9'd111: data <= 14'd15296;
        9'd112: data <= 14'd15360;
        9'd113: data <= 14'd15424;
        9'd114: data <= 14'd15488;
        9'd115: data <= 14'd15552;
        9'd116: data <= 14'd15616;
        9'd117: data <= 14'd15680;
        9'd118: data <= 14'd15744;
        9'd119: data <= 14'd15808;
        9'd120: data <= 14'd15872;
        9'd121: data <= 14'd15936;
        9'd122: data <= 14'd16000;
        9'd123: data <= 14'd16064;
        9'd124: data <= 14'd16128;
        9'd125: data <= 14'd16192;
        9'd126: data <= 14'd16256;
        9'd127: data <= 14'd16320;
        9'd128: data <= 14'd16384;
        9'd129: data <= 14'd16320;
        9'd130: data <= 14'd16256;
        9'd131: data <= 14'd16192;
        9'd132: data <= 14'd16128;
        9'd133: data <= 14'd16064;
        9'd134: data <= 14'd16000;
        9'd135: data <= 14'd15936;
        9'd136: data <= 14'd15872;
        9'd137: data <= 14'd15808;
        9'd138: data <= 14'd15744;
        9'd139: data <= 14'd15680;
        9'd140: data <= 14'd15616;
        9'd141: data <= 14'd15552;
        9'd142: data <= 14'd15488;
        9'd143: data <= 14'd15424;
        9'd144: data <= 14'd15360;
        9'd145: data <= 14'd15296;
        9'd146: data <= 14'd15232;
        9'd147: data <= 14'd15168;
        9'd148: data <= 14'd15104;
        9'd149: data <= 14'd15040;
        9'd150: data <= 14'd14976;
        9'd151: data <= 14'd14912;
        9'd152: data <= 14'd14848;
        9'd153: data <= 14'd14784;
        9'd154: data <= 14'd14720;
        9'd155: data <= 14'd14656;
        9'd156: data <= 14'd14592;
        9'd157: data <= 14'd14528;
        9'd158: data <= 14'd14464;
        9'd159: data <= 14'd14400;
        9'd160: data <= 14'd14336;
        9'd161: data <= 14'd14272;
        9'd162: data <= 14'd14208;
        9'd163: data <= 14'd14144;
        9'd164: data <= 14'd14080;
        9'd165: data <= 14'd14016;
        9'd166: data <= 14'd13951;
        9'd167: data <= 14'd13887;
        9'd168: data <= 14'd13824;
        9'd169: data <= 14'd13760;
        9'd170: data <= 14'd13696;
        9'd171: data <= 14'd13632;
        9'd172: data <= 14'd13568;
        9'd173: data <= 14'd13504;
        9'd174: data <= 14'd13440;
        9'd175: data <= 14'd13376;
        9'd176: data <= 14'd13312;
        9'd177: data <= 14'd13247;
        9'd178: data <= 14'd13183;
        9'd179: data <= 14'd13120;
        9'd180: data <= 14'd13056;
        9'd181: data <= 14'd12992;
        9'd182: data <= 14'd12928;
        9'd183: data <= 14'd12864;
        9'd184: data <= 14'd12800;
        9'd185: data <= 14'd12736;
        9'd186: data <= 14'd12672;
        9'd187: data <= 14'd12607;
        9'd188: data <= 14'd12543;
        9'd189: data <= 14'd12479;
        9'd190: data <= 14'd12416;
        9'd191: data <= 14'd12352;
        9'd192: data <= 14'd12288;
        9'd193: data <= 14'd12224;
        9'd194: data <= 14'd12160;
        9'd195: data <= 14'd12096;
        9'd196: data <= 14'd12032;
        9'd197: data <= 14'd11968;
        9'd198: data <= 14'd11903;
        9'd199: data <= 14'd11839;
        9'd200: data <= 14'd11776;
        9'd201: data <= 14'd11712;
        9'd202: data <= 14'd11648;
        9'd203: data <= 14'd11584;
        9'd204: data <= 14'd11520;
        9'd205: data <= 14'd11456;
        9'd206: data <= 14'd11392;
        9'd207: data <= 14'd11328;
        9'd208: data <= 14'd11263;
        9'd209: data <= 14'd11199;
        9'd210: data <= 14'd11135;
        9'd211: data <= 14'd11072;
        9'd212: data <= 14'd11008;
        9'd213: data <= 14'd10944;
        9'd214: data <= 14'd10880;
        9'd215: data <= 14'd10816;
        9'd216: data <= 14'd10752;
        9'd217: data <= 14'd10688;
        9'd218: data <= 14'd10624;
        9'd219: data <= 14'd10559;
        9'd220: data <= 14'd10495;
        9'd221: data <= 14'd10431;
        9'd222: data <= 14'd10368;
        9'd223: data <= 14'd10304;
        9'd224: data <= 14'd10240;
        9'd225: data <= 14'd10176;
        9'd226: data <= 14'd10112;
        9'd227: data <= 14'd10048;
        9'd228: data <= 14'd9984;
        9'd229: data <= 14'd9920;
        9'd230: data <= 14'd9855;
        9'd231: data <= 14'd9791;
        9'd232: data <= 14'd9727;
        9'd233: data <= 14'd9664;
        9'd234: data <= 14'd9600;
        9'd235: data <= 14'd9536;
        9'd236: data <= 14'd9472;
        9'd237: data <= 14'd9408;
        9'd238: data <= 14'd9344;
        9'd239: data <= 14'd9280;
        9'd240: data <= 14'd9216;
        9'd241: data <= 14'd9151;
        9'd242: data <= 14'd9087;
        9'd243: data <= 14'd9024;
        9'd244: data <= 14'd8960;
        9'd245: data <= 14'd8896;
        9'd246: data <= 14'd8832;
        9'd247: data <= 14'd8768;
        9'd248: data <= 14'd8704;
        9'd249: data <= 14'd8640;
        9'd250: data <= 14'd8576;
        9'd251: data <= 14'd8511;
        9'd252: data <= 14'd8447;
        9'd253: data <= 14'd8383;
        9'd254: data <= 14'd8320;
        9'd255: data <= 14'd8256;
        9'd256: data <= 14'd8192;
        9'd257: data <= 14'd8128;
        9'd258: data <= 14'd8064;
        9'd259: data <= 14'd8000;
        9'd260: data <= 14'd7936;
        9'd261: data <= 14'd7872;
        9'd262: data <= 14'd7808;
        9'd263: data <= 14'd7744;
        9'd264: data <= 14'd7680;
        9'd265: data <= 14'd7616;
        9'd266: data <= 14'd7552;
        9'd267: data <= 14'd7488;
        9'd268: data <= 14'd7424;
        9'd269: data <= 14'd7360;
        9'd270: data <= 14'd7296;
        9'd271: data <= 14'd7232;
        9'd272: data <= 14'd7168;
        9'd273: data <= 14'd7104;
        9'd274: data <= 14'd7040;
        9'd275: data <= 14'd6976;
        9'd276: data <= 14'd6912;
        9'd277: data <= 14'd6848;
        9'd278: data <= 14'd6784;
        9'd279: data <= 14'd6720;
        9'd280: data <= 14'd6656;
        9'd281: data <= 14'd6592;
        9'd282: data <= 14'd6528;
        9'd283: data <= 14'd6464;
        9'd284: data <= 14'd6400;
        9'd285: data <= 14'd6336;
        9'd286: data <= 14'd6272;
        9'd287: data <= 14'd6208;
        9'd288: data <= 14'd6144;
        9'd289: data <= 14'd6080;
        9'd290: data <= 14'd6016;
        9'd291: data <= 14'd5952;
        9'd292: data <= 14'd5888;
        9'd293: data <= 14'd5824;
        9'd294: data <= 14'd5760;
        9'd295: data <= 14'd5696;
        9'd296: data <= 14'd5632;
        9'd297: data <= 14'd5568;
        9'd298: data <= 14'd5504;
        9'd299: data <= 14'd5440;
        9'd300: data <= 14'd5376;
        9'd301: data <= 14'd5312;
        9'd302: data <= 14'd5248;
        9'd303: data <= 14'd5184;
        9'd304: data <= 14'd5120;
        9'd305: data <= 14'd5056;
        9'd306: data <= 14'd4992;
        9'd307: data <= 14'd4928;
        9'd308: data <= 14'd4864;
        9'd309: data <= 14'd4800;
        9'd310: data <= 14'd4736;
        9'd311: data <= 14'd4672;
        9'd312: data <= 14'd4608;
        9'd313: data <= 14'd4544;
        9'd314: data <= 14'd4480;
        9'd315: data <= 14'd4416;
        9'd316: data <= 14'd4352;
        9'd317: data <= 14'd4288;
        9'd318: data <= 14'd4224;
        9'd319: data <= 14'd4160;
        9'd320: data <= 14'd4096;
        9'd321: data <= 14'd4032;
        9'd322: data <= 14'd3968;
        9'd323: data <= 14'd3904;
        9'd324: data <= 14'd3840;
        9'd325: data <= 14'd3776;
        9'd326: data <= 14'd3712;
        9'd327: data <= 14'd3648;
        9'd328: data <= 14'd3584;
        9'd329: data <= 14'd3520;
        9'd330: data <= 14'd3456;
        9'd331: data <= 14'd3392;
        9'd332: data <= 14'd3327;
        9'd333: data <= 14'd3264;
        9'd334: data <= 14'd3199;
        9'd335: data <= 14'd3136;
        9'd336: data <= 14'd3072;
        9'd337: data <= 14'd3008;
        9'd338: data <= 14'd2944;
        9'd339: data <= 14'd2880;
        9'd340: data <= 14'd2816;
        9'd341: data <= 14'd2752;
        9'd342: data <= 14'd2688;
        9'd343: data <= 14'd2623;
        9'd344: data <= 14'd2560;
        9'd345: data <= 14'd2495;
        9'd346: data <= 14'd2432;
        9'd347: data <= 14'd2368;
        9'd348: data <= 14'd2304;
        9'd349: data <= 14'd2240;
        9'd350: data <= 14'd2176;
        9'd351: data <= 14'd2112;
        9'd352: data <= 14'd2048;
        9'd353: data <= 14'd1984;
        9'd354: data <= 14'd1919;
        9'd355: data <= 14'd1856;
        9'd356: data <= 14'd1791;
        9'd357: data <= 14'd1728;
        9'd358: data <= 14'd1664;
        9'd359: data <= 14'd1600;
        9'd360: data <= 14'd1536;
        9'd361: data <= 14'd1472;
        9'd362: data <= 14'd1408;
        9'd363: data <= 14'd1343;
        9'd364: data <= 14'd1280;
        9'd365: data <= 14'd1215;
        9'd366: data <= 14'd1152;
        9'd367: data <= 14'd1087;
        9'd368: data <= 14'd1024;
        9'd369: data <= 14'd960;
        9'd370: data <= 14'd896;
        9'd371: data <= 14'd832;
        9'd372: data <= 14'd768;
        9'd373: data <= 14'd704;
        9'd374: data <= 14'd639;
        9'd375: data <= 14'd576;
        9'd376: data <= 14'd511;
        9'd377: data <= 14'd448;
        9'd378: data <= 14'd383;
        9'd379: data <= 14'd320;
        9'd380: data <= 14'd256;
        9'd381: data <= 14'd192;
        9'd382: data <= 14'd128;
        9'd383: data <= 14'd64;
        9'd384: data <= 14'd0;
        9'd385: data <= 14'd64;
        9'd386: data <= 14'd128;
        9'd387: data <= 14'd192;
        9'd388: data <= 14'd256;
        9'd389: data <= 14'd320;
        9'd390: data <= 14'd384;
        9'd391: data <= 14'd448;
        9'd392: data <= 14'd512;
        9'd393: data <= 14'd576;
        9'd394: data <= 14'd640;
        9'd395: data <= 14'd704;
        9'd396: data <= 14'd768;
        9'd397: data <= 14'd832;
        9'd398: data <= 14'd896;
        9'd399: data <= 14'd960;
        9'd400: data <= 14'd1024;
        9'd401: data <= 14'd1088;
        9'd402: data <= 14'd1152;
        9'd403: data <= 14'd1216;
        9'd404: data <= 14'd1280;
        9'd405: data <= 14'd1344;
        9'd406: data <= 14'd1408;
        9'd407: data <= 14'd1472;
        9'd408: data <= 14'd1536;
        9'd409: data <= 14'd1600;
        9'd410: data <= 14'd1664;
        9'd411: data <= 14'd1728;
        9'd412: data <= 14'd1792;
        9'd413: data <= 14'd1856;
        9'd414: data <= 14'd1920;
        9'd415: data <= 14'd1984;
        9'd416: data <= 14'd2048;
        9'd417: data <= 14'd2112;
        9'd418: data <= 14'd2176;
        9'd419: data <= 14'd2240;
        9'd420: data <= 14'd2304;
        9'd421: data <= 14'd2368;
        9'd422: data <= 14'd2432;
        9'd423: data <= 14'd2496;
        9'd424: data <= 14'd2560;
        9'd425: data <= 14'd2624;
        9'd426: data <= 14'd2688;
        9'd427: data <= 14'd2752;
        9'd428: data <= 14'd2816;
        9'd429: data <= 14'd2880;
        9'd430: data <= 14'd2944;
        9'd431: data <= 14'd3008;
        9'd432: data <= 14'd3072;
        9'd433: data <= 14'd3136;
        9'd434: data <= 14'd3200;
        9'd435: data <= 14'd3264;
        9'd436: data <= 14'd3328;
        9'd437: data <= 14'd3392;
        9'd438: data <= 14'd3456;
        9'd439: data <= 14'd3520;
        9'd440: data <= 14'd3584;
        9'd441: data <= 14'd3648;
        9'd442: data <= 14'd3712;
        9'd443: data <= 14'd3776;
        9'd444: data <= 14'd3840;
        9'd445: data <= 14'd3904;
        9'd446: data <= 14'd3968;
        9'd447: data <= 14'd4032;
        9'd448: data <= 14'd4096;
        9'd449: data <= 14'd4160;
        9'd450: data <= 14'd4224;
        9'd451: data <= 14'd4288;
        9'd452: data <= 14'd4352;
        9'd453: data <= 14'd4416;
        9'd454: data <= 14'd4480;
        9'd455: data <= 14'd4544;
        9'd456: data <= 14'd4608;
        9'd457: data <= 14'd4672;
        9'd458: data <= 14'd4736;
        9'd459: data <= 14'd4800;
        9'd460: data <= 14'd4864;
        9'd461: data <= 14'd4928;
        9'd462: data <= 14'd4992;
        9'd463: data <= 14'd5056;
        9'd464: data <= 14'd5120;
        9'd465: data <= 14'd5184;
        9'd466: data <= 14'd5248;
        9'd467: data <= 14'd5312;
        9'd468: data <= 14'd5376;
        9'd469: data <= 14'd5440;
        9'd470: data <= 14'd5504;
        9'd471: data <= 14'd5568;
        9'd472: data <= 14'd5632;
        9'd473: data <= 14'd5696;
        9'd474: data <= 14'd5760;
        9'd475: data <= 14'd5824;
        9'd476: data <= 14'd5888;
        9'd477: data <= 14'd5952;
        9'd478: data <= 14'd6016;
        9'd479: data <= 14'd6080;
        9'd480: data <= 14'd6144;
        9'd481: data <= 14'd6208;
        9'd482: data <= 14'd6272;
        9'd483: data <= 14'd6336;
        9'd484: data <= 14'd6400;
        9'd485: data <= 14'd6464;
        9'd486: data <= 14'd6528;
        9'd487: data <= 14'd6592;
        9'd488: data <= 14'd6656;
        9'd489: data <= 14'd6720;
        9'd490: data <= 14'd6784;
        9'd491: data <= 14'd6848;
        9'd492: data <= 14'd6912;
        9'd493: data <= 14'd6976;
        9'd494: data <= 14'd7040;
        9'd495: data <= 14'd7104;
        9'd496: data <= 14'd7168;
        9'd497: data <= 14'd7232;
        9'd498: data <= 14'd7296;
        9'd499: data <= 14'd7360;
        9'd500: data <= 14'd7424;
        9'd501: data <= 14'd7488;
        9'd502: data <= 14'd7552;
        9'd503: data <= 14'd7616;
        9'd504: data <= 14'd7680;
        9'd505: data <= 14'd7744;
        9'd506: data <= 14'd7808;
        9'd507: data <= 14'd7872;
        9'd508: data <= 14'd7936;
        9'd509: data <= 14'd8000;
        9'd510: data <= 14'd8064;
        9'd511: data <= 14'd8128;
        
    endcase
end
endmodule
