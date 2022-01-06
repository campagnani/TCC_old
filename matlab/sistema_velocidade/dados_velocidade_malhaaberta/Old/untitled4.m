clear
clc

teste1 = [
0	0	0	100;
0	0	0	200;
0	0	0	300;
0	0	0	400;
0	0	0	500;
0	0	0	600;
0	0	0	700;
0	0	0	801;
0	0	0	901;
0	0	0	1001;
0	0	0	1101;
0	0	0	1201;
0	0	0	1301;
0	0	0	1401;
0	0	0	1502;
0	0	0	1602;
0	0	0	1702;
0	0	0	1802;
0	0	0	1902;
0	0	0	2002;
0.5	0	6	2102;
0.5	0.029	6	2202;
0.5	0.058	6	2303;
0.5	0.1015	6	2403;
0.5	0.1305	6	2503;
0.5	0.174	6	2603;
0.5	0.1885	6	2703;
0.5	0.232	6	2803;
0.5	0.261	6	2903;
0.5	0.2755	6	3004;
0.5	0.3045	6	3104;
0.5	0.319	6	3204;
0.5	0.348	6	3304;
0.5	0.3625	6	3404;
0.5	0.3915	6	3504;
0.5	0.406	6	3604;
0.5	0.4205	6	3704;
0.5	0.4495	6	3805;
0.5	0.4495	6	3905;
0.5	0.4785	6	4005;
0.5	0.493	6	4105;
0.5	0.5075	6	4205;
0.5	0.5075	6	4305;
0.5	0.5365	6	4405;
0.5	0.5365	6	4505;
0.5	0.5655	6	4606;
0.5	0.5655	6	4706;
0.5	0.58	6	4806;
0.5	0.5655	6	4906;
0.5	0.5945	6	5006;
0.5	0.58	6	5106;
0.5	0.5945	6	5207;
0.5	0.609	6	5307;
0.5	0.609	6	5407;
0.5	0.609	6	5508;
0.5	0.6235	6	5608;
0.5	0.638	6	5708;
0.5	0.638	6	5809;
0.5	0.638	6	5909;
0.5	0.6525	6	6009;
0.5	0.6525	6	6109;
0.5	0.667	6	6209;
0.5	0.667	6	6309;
0.5	0.6815	6	6410;
0.5	0.667	6	6510;
0.5	0.6815	6	6610;
0.5	0.6815	6	6710;
0.5	0.6815	6	6810;
0.5	0.696	6	6910;
0.5	0.6815	6	7011;
0.5	0.6815	6	7111;
0.5	0.696	6	7211;
0.5	0.696	6	7311;
0.5	0.7105	6	7411;
0.5	0.7105	6	7511;
0.6	0.7105	7.2	7612;
0.6	0.725	7.2	7712;
0.6	0.7105	7.2	7812;
0.6	0.7395	7.2	7912;
0.6	0.754	7.2	8012;
0.6	0.754	7.2	8113;
0.6	0.754	7.2	8213;
0.6	0.7685	7.2	8313;
0.6	0.783	7.2	8413;
0.6	0.7685	7.2	8514;
0.6	0.7975	7.2	8614;
0.6	0.783	7.2	8714;
0.6	0.812	7.2	8814;
0.6	0.7975	7.2	8915;
0.6	0.8265	7.2	9015;
0.6	0.812	7.2	9115;
0.6	0.841	7.2	9215;
0.6	0.8265	7.2	9315;
0.6	0.8555	7.2	9416;
0.6	0.8555	7.2	9516;
0.6	0.8555	7.2	9616;
0.6	0.87	7.2	9716;
0.6	0.87	7.2	9816;
0.6	0.87	7.2	9916;
0.6	0.8845	7.2	10017;
0.6	0.8845	7.2	10117;
0.6	0.9135	7.2	10217;
0.4	0.899	4.8	10317;
0.4	0.8845	4.8	10418;
0.4	0.87	4.8	10518;
0.4	0.8555	4.8	10618;
0.4	0.87	4.8	10719;
0.4	0.841	4.8	10819;
0.4	0.841	4.8	10919;
0.4	0.841	4.8	11019;
0.4	0.8265	4.8	11119;
0.4	0.8265	4.8	11220;
0.4	0.812	4.8	11320;
0.4	0.812	4.8	11420;
0.4	0.812	4.8	11520;
0.4	0.7975	4.8	11620;
0.4	0.783	4.8	11721;
0.4	0.783	4.8	11821;
0.4	0.7685	4.8	11921;
0.4	0.783	4.8	12021;
0.4	0.754	4.8	12121;
0.4	0.754	4.8	12222;
0.4	0.754	4.8	12322;
0.4	0.754	4.8	12422;
0.4	0.725	4.8	12522;
0	0.7395	0	12622;
0	0.696	0	12722;
0	0.667	0	12823;
0	0.6235	0	12923;
0	0.609	0	13023;
0	0.58	0	13123;
0	0.5365	0	13223;
0	0.522	0	13323;
0	0.5075	0	13423;
0	0.464	0	13524;
0	0.464	0	13624;
0	0.4205	0	13724;
0	0.406	0	13824;
0	0.377	0	13924;
0	0.3625	0	14024;
0	0.319	0	14124;
0	0.319	0	14225;
0	0.29	0	14325;
0	0.29	0	14425;
0	0.2465	0	14525;
0	0.2465	0	14625;
0	0.2175	0	14725;
0	0.203	0	14825;
0	0.1885	0	14925;
0	0.174	0	15026;
0	0.174	0	15126;
0	0.145	0	15226;
0	0.1305	0	15326;
0	0.116	0	15426;
0	0.1015	0	15526;
0	0.1015	0	15626;
0	0.0725	0	15726;
0	0.0725	0	15827;
0	0.0435	0	15927;
0	0.029	0	16027;
0	0.029	0	16127;
0	0	0	16227;
0	0	0	16327];


teste2 = [
0	0	0	100;
0	0	0	200;
0	0	0	300;
0	0	0	400;
0	0	0	500;
0	0	0	600;
0	0	0	700;
0	0	0	801;
0	0	0	901;
0	0	0	1001;
0	0	0	1101;
0	0	0	1201;
0	0	0	1301;
0	0	0	1401;
0	0	0	1502;
0	0	0	1602;
0.5	0	6	1702;
0.5	0.029	6	1802;
0.5	0.058	6	1902;
0.5	0.087	6	2002;
0.5	0.1305	6	2102;
0.5	0.1595	6	2202;
0.5	0.1885	6	2303;
0.5	0.232	6	2403;
0.5	0.232	6	2503;
0.5	0.261	6	2603;
0.5	0.29	6	2703;
0.5	0.319	6	2803;
0.5	0.3335	6	2903;
0.5	0.3625	6	3004;
0.5	0.3625	6	3104;
0.5	0.3915	6	3204;
0.5	0.406	6	3304;
0.5	0.4205	6	3404;
0.5	0.435	6	3504;
0.5	0.4495	6	3605;
0.5	0.464	6	3705;
0.5	0.493	6	3805;
0.5	0.493	6	3905;
0.5	0.493	6	4005;
0.5	0.5075	6	4106;
0.5	0.522	6	4206;
0.5	0.5365	6	4306;
0.5	0.5365	6	4406;
0.5	0.5655	6	4506;
0.5	0.551	6	4607;
0.5	0.58	6	4707;
0.5	0.5945	6	4807;
0.5	0.5945	6	4907;
0.5	0.609	6	5007;
0.5	0.609	6	5107;
0.5	0.6235	6	5208;
0.5	0.638	6	5308;
0.5	0.6235	6	5408;
0.5	0.638	6	5508;
0.5	0.638	6	5608;
0.5	0.638	6	5709;
0.5	0.667	6	5809;
0.5	0.6525	6	5909;
0.5	0.6525	6	6009;
0.5	0.6525	6	6110;
0.5	0.667	6	6210;
0.5	0.6815	6	6310;
0.5	0.696	6	6410;
0.5	0.6815	6	6510;
0.5	0.696	6	6610;
0.5	0.696	6	6711;
0.5	0.696	6	6811;
0.5	0.7105	6	6911;
0.5	0.7105	6	7011;
0.5	0.7105	6	7111;
0.5	1.4065	6	7212;
0.5	0.7105	6	7312;
0.6	0.7105	7.2	7412;
0.6	0.725	7.2	7512;
0.6	0.725	7.2	7612;
0.6	0.7395	7.2	7713;
0.6	0.7685	7.2	7813;
0.6	0.7685	7.2	7913;
0.6	0.7685	7.2	8013;
0.6	0.7975	7.2	8113;
0.6	0.7975	7.2	8213;
0.6	0.812	7.2	8314;
0.6	0.812	7.2	8414;
0.6	0.812	7.2	8514;
0.6	0.8265	7.2	8614;
0.6	0.8265	7.2	8714;
0.6	0.841	7.2	8815;
0.6	0.841	7.2	8915;
0.6	0.8555	7.2	9015;
0.6	0.8555	7.2	9115;
0.6	0.8555	7.2	9215;
0.6	0.8845	7.2	9316;
0.6	0.87	7.2	9416;
0.6	0.87	7.2	9516;
0.6	0.899	7.2	9616;
0.6	0.8845	7.2	9716;
0.6	0.899	7.2	9816;
0.6	0.899	7.2	9917;
0.6	0.899	7.2	10017;
0.6	0.9135	7.2	10117;
0.6	0.9135	7.2	10217;
0.6	0.9135	7.2	10317;
0.6	0.928	7.2	10418;
0.6	0.9135	7.2	10518;
0.6	0.928	7.2	10618;
0.6	0.928	7.2	10718;
0.6	0.9425	7.2	10818;
0.6	0.928	7.2	10919;
0.6	0.9425	7.2	11019;
0.6	0.9425	7.2	11119;
0.6	0.9425	7.2	11219;
0.6	0.9425	7.2	11319;
0.6	0.9425	7.2	11419;
0.6	0.9425	7.2	11520;
0.6	0.9425	7.2	11620;
0.6	0.957	7.2	11720;
0.6	0.9425	7.2	11820;
0.6	0.957	7.2	11920;
0.6	0.957	7.2	12020;
0.4	0.9425	4.8	12121;
0.4	0.928	4.8	12221;
0.4	0.899	4.8	12321;
0.4	0.9135	4.8	12421;
0.4	0.8845	4.8	12521;
0.4	0.8845	4.8	12622;
0.4	0.87	4.8	12722;
0.4	0.8555	4.8	12822;
0.4	0.841	4.8	12922;
0.4	0.841	4.8	13022;
0.4	0.8265	4.8	13123;
0.4	0.8265	4.8	13223;
0.4	0.8265	4.8	13323;
0.4	0.812	4.8	13423;
0.4	0.812	4.8	13524;
0.4	0.783	4.8	13624;
0.4	0.783	4.8	13724;
0.4	0.7975	4.8	13824;
0.4	0.754	4.8	13925;
0.4	0.754	4.8	14025;
0.4	0.754	4.8	14125;
0.4	0.7395	4.8	14225;
0.4	0.7395	4.8	14326;
0.4	0.7395	4.8	14426;
0.4	0.725	4.8	14526;
0.4	0.7105	4.8	14626;
0.4	0.7105	4.8	14727;
0.4	0.7105	4.8	14827;
0.4	0.6815	4.8	14927;
0.4	0.6815	4.8	15027;
0.4	0.6815	4.8	15128;
0.4	0.6525	4.8	15228;
0.4	0.667	4.8	15328;
0.4	0.6815	4.8	15428;
0.4	0.6525	4.8	15528;
0.4	0.6525	4.8	15629;
0.4	0.6525	4.8	15729;
0	0.638	0	15829;
0	0.609	0	15929;
0	0.5945	0	16029;
0	0.551	0	16130;
0	0.5365	0	16230;
0	0.5075	0	16330;
0	0.4785	0	16430;
0	0.4495	0	16531;
0	0.4205	0	16631;
0	0.406	0	16731;
0	0.377	0	16831;
0	0.3625	0	16931;
0	0.348	0	17032;
0	0.3045	0	17132;
0	0.3045	0	17232;
0	0.29	0	17332;
0	0.261	0	17432;
0	0.2465	0	17533;
0	0.232	0	17633;
0	0.203	0	17733;
0	0.1885	0	17834;
0	0.174	0	17934;
0	0.1595	0	18034;
0	0.145	0	18134;
0	0.116	0	18234;
0	0.1015	0	18334;
0	0.087	0	18435;
0	0.087	0	18535;
0	0.058	0	18635;
0	0.058	0	18735;
0	0.029	0	18835;
0	0.0145	0	18936;
0	0	0	19036;
0	0	0	19136;
0	0.0145	0	19236;
0	0	0	19337;
0	0	0	19437;
0	0	0	19537;
0	0	0	19637;
0	0	0	19738;
0	0	0	19838;
0	0	0	19938;
0	0	0	20038;
0	0	0	20138;
0	0	0	20239;
0	0	0	20339;
0	0	0	20439;
0	0	0	20539;
0	0	0	20640;
0	0	0	20740;
0	0	0	20840;
0	0	0	20940;
0	0	0	21040;
0	0	0	21140;
0	0	0	21241;
0	0	0	21341;
0	0	0	21441;
0	0	0	21541;
0	0	0	21641;
0	0	0	21742;
0	0	0	21842;
0	0	0	21942;
0	0	0	22042;
0	0	0	22142;
0	0	0	22242;
0	0	0	22343;
0	0	0	22443];

teste3 = [
0	0	0	100;
0	0	0	200;
0	0	0	300;
0	0	0	400;
0	0	0	500;
0	0	0	600;
0	0	0	700;
0	0	0	801;
0	0	0	901;
0	0	0	1001;
0	0	0	1101;
0	0	0	1201;
0	0	0	1301;
0	0	0	1401;
0	0	0	1502;
0	0	0	1602;
0	0	0	1702;
0	0	0	1802;
0	0	0	1902;
0	0	0	2002;
0	0	0	2102;
0	0	0	2202;
0	0	0	2303;
0	0	0	2403;
0	0	0	2503;
0	0	0	2603;
0	0	0	2703;
0	0	0	2803;
0	0	0	2903;
0	0	0	3004;
0	0	0	3104;
0	0	0	3204;
0	0	0	3304;
0	0	0	3404;
0	0	0	3504;
0.5	0	6	3604;
0.5	0.0435	6	3704;
0.5	0.058	6	3805;
0.5	0.1015	6	3905;
0.5	0.145	6	4005;
0.5	0.1595	6	4105;
0.5	0.203	6	4205;
0.5	0.232	6	4305;
0.5	0.2755	6	4405;
0.5	0.2755	6	4505;
0.5	0.3045	6	4606;
0.5	0.3335	6	4706;
0.5	0.348	6	4806;
0.5	0.377	6	4906;
0.5	0.377	6	5006;
0.5	0.406	6	5106;
0.5	0.435	6	5207;
0.5	0.4495	6	5307;
0.5	0.4495	6	5407;
0.5	0.493	6	5507;
0.5	0.4785	6	5607;
0.5	0.5075	6	5707;
0.5	0.522	6	5808;
0.5	0.5365	6	5908;
0.5	0.551	6	6008;
0.5	0.5655	6	6108;
0.5	0.5655	6	6208;
0.5	0.58	6	6309;
0.5	0.58	6	6409;
0.5	0.58	6	6509;
0.5	0.5945	6	6609;
0.5	0.5945	6	6709;
0.5	0.5945	6	6809;
0.5	0.609	6	6910;
0.5	0.609	6	7010;
0.5	0.638	6	7110;
0.5	0.638	6	7210;
0.5	0.638	6	7310;
0.5	0.638	6	7411;
0.5	0.6525	6	7511;
0.5	0.667	6	7611;
0.5	0.6525	6	7711;
0.5	0.667	6	7811;
0.5	0.6815	6	7911;
0.5	0.6815	6	8012;
0.5	0.696	6	8112;
0.5	0.696	6	8212;
0.5	0.696	6	8312;
0.5	0.7105	6	8412;
0.5	0.696	6	8512;
0.5	0.7105	6	8613;
0.5	0.7105	6	8713;
0.5	0.7105	6	8813;
0.5	0.696	6	8913;
0.5	0.7105	6	9013;
0.5	0.7105	6	9114;
0.5	0.696	6	9214;
0.5	0.7105	6	9314;
0.5	0.7395	6	9414;
0.5	0.725	6	9514;
0.5	0.725	6	9614;
0.5	0.725	6	9715;
0.5	0.725	6	9815;
0.5	1.45	6	9915;
0.5	0.754	6	10015;
0.5	0.754	6	10115;
0.5	0.7395	6	10216;
0.5	0.783	6	10316;
0.5	0.754	6	10416;
0.5	0.754	6	10516;
0.4	0.7395	4.8	10616;
0.4	0.7685	4.8	10716;
0.4	0.7395	4.8	10817;
0.4	0.7395	4.8	10917;
0.4	0.7395	4.8	11017;
0.4	0.7105	4.8	11117;
0.4	0.725	4.8	11217;
0.4	0.725	4.8	11317;
0.4	0.7105	4.8	11418;
0.4	0.725	4.8	11518;
0.4	0.7105	4.8	11618;
0.4	0.696	4.8	11718;
0.4	0.696	4.8	11818;
0.4	0.696	4.8	11918;
0.4	0.667	4.8	12019;
0.4	0.6815	4.8	12119;
0.4	0.6815	4.8	12219;
0.4	0.667	4.8	12319;
0.4	0.667	4.8	12419;
0.4	0.6815	4.8	12520;
0.4	0.6525	4.8	12620;
0.4	0.667	4.8	12720;
0.4	0.6525	4.8	12820;
0.4	0.6525	4.8	12920;
0.4	0.638	4.8	13020;
0.4	0.6525	4.8	13121;
0.4	0.638	4.8	13221;
0.4	0.638	4.8	13321;
0.4	0.638	4.8	13421;
0.4	0.638	4.8	13521;
0.4	0.638	4.8	13621;
0.4	0.6235	4.8	13722;
0.4	0.6235	4.8	13822;
0.4	0.638	4.8	13922;
0.4	0.6235	4.8	14022;
0.4	0.609	4.8	14122;
0.4	0.638	4.8	14223;
0.4	0.609	4.8	14323;
0.4	0.609	4.8	14423;
0.4	0.609	4.8	14523;
0.4	0.609	4.8	14623;
0.4	0.6235	4.8	14723;
0.4	0.5945	4.8	14824;
0.4	0.609	4.8	14924;
0.4	0.609	4.8	15024;
0.4	0.5945	4.8	15124;
0.6	0.5945	7.2	15224;
0.6	0.6235	7.2	15325;
0.6	0.6525	7.2	15425;
0.6	0.6815	7.2	15525;
0.6	0.667	7.2	15625;
0.6	0.7105	7.2	15725;
0.6	0.7105	7.2	15825;
0.6	0.696	7.2	15926;
0.6	0.725	7.2	16026;
0.6	0.7105	7.2	16126;
0.6	0.754	7.2	16226;
0.6	0.754	7.2	16326;
0.6	0.7685	7.2	16427;
0.6	0.7685	7.2	16527;
0.6	0.7975	7.2	16627;
0.6	0.783	7.2	16727;
0.6	0.812	7.2	16828;
0.6	0.8265	7.2	16928;
0.6	0.812	7.2	17028;
0.6	0.8265	7.2	17128;
0.6	0.812	7.2	17228;
0.6	0.841	7.2	17329;
0.6	0.8555	7.2	17429;
0.6	0.8555	7.2	17529;
0.6	0.841	7.2	17629;
0.6	0.841	7.2	17729;
0.6	0.8555	7.2	17830;
0.6	0.8555	7.2	17930;
0.6	0.8555	7.2	18030;
0.6	0.87	7.2	18130;
0.6	0.8845	7.2	18230;
0.6	0.8845	7.2	18330;
0.6	0.899	7.2	18431;
0.6	0.87	7.2	18531;
0.6	0.8845	7.2	18631;
0.6	0.9135	7.2	18731;
0.6	0.928	7.2	18831;
0.6	0.899	7.2	18931;
0.6	0.899	7.2	19032;
0.6	0.9135	7.2	19132;
0.6	0.9135	7.2	19232;
0.6	0.899	7.2	19332;
0.6	0.9135	7.2	19432;
0.6	0.9135	7.2	19533;
0.6	0.9135	7.2	19633;
0.6	0.928	7.2	19733;
0.6	0.9135	7.2	19834;
0.5	0.928	6	19934;
0.5	0.9135	6	20034;
0.5	0.9135	6	20135;
0.5	0.9135	6	20235;
0.5	0.9135	6	20335;
0.5	0.899	6	20436;
0.5	0.899	6	20536;
0.5	0.8845	6	20636;
0.5	0.899	6	20736;
0.5	0.8845	6	20837;
0.5	0.87	6	20937;
0.5	0.87	6	21037;
0.5	0.8555	6	21137;
0.5	0.87	6	21238;
0.5	0.8555	6	21338;
0.5	0.8555	6	21438;
0.5	0.8555	6	21538;
0	0.8555	0	21638;
0	0.7975	0	21739;
0	0.7685	0	21839;
0	0.754	0	21939;
0	0.7105	0	22039;
0	0.6815	0	22139;
0	0.638	0	22240;
0	0.6235	0	22340;
0	0.5945	0	22440;
0	0.551	0	22540;
0	0.522	0	22640;
0	0.493	0	22740;
0	0.4785	0	22841;
0	0.4495	0	22941;
0	0.4205	0	23041;
0	0.4205	0	23141;
0	0.377	0	23241;
0	0.377	0	23342;
0	0.348	0	23442;
0	0.3045	0	23542;
0	0.2465	0	23642;
0	0.1595	0	23742;
0	0.0435	0	23842;
0	0.0435	0	23943;
0	0.058	0	24043;
0	0.058	0	24143;
0	0.058	0	24243;
0	0.0435	0	24343;
0	0.0435	0	24443;
0	0.029	0	24544;
0	0.0145	0	24644;
0	0.0145	0	24744;
0	0	0	24844;
0	0	0	24944;
0	0	0	25045;
0	0	0	25145;
0	0	0	25245;
0	0	0	25345;
0	0	0	25445;
0	0	0	25545;
0	0	0	25646;
0	0	0	25746;
0	0	0	25846;
0	0	0	25946;
0	0.0435	0	26046;
0	0.058	0	26147;
0	0.1015	0	26247;
0	0.1015	0	26347;
0	0.116	0	26448;
0	0.087	0	26548;
0	0.1015	0	26648;
0	0.1015	0	26748;
0	0.087	0	26848];

teste4 = [
0	0	0	100;
0	0	0	200;
0	0	0	300;
0	0	0	400;
0	0	0	500;
0	0	0	601;
0	0	0	701;
0	0	0	801;
0	0	0	901;
0	0	0	1001;
0	0	0	1101;
0	0	0	1202;
0	0	0	1302;
0.5	0	6	1402;
0.5	0.029	6	1503;
0.5	0.058	6	1603;
0.5	0.087	6	1704;
0.5	0.1305	6	1804;
0.5	0.1595	6	1905;
0.5	0.174	6	2005;
0.5	0.2175	6	2105;
0.5	0.232	6	2206;
0.5	0.261	6	2306;
0.5	0.2755	6	2406;
0.5	0.3045	6	2506;
0.5	0.319	6	2606;
0.5	0.348	6	2706;
0.5	0.3625	6	2807;
0.5	0.3915	6	2907;
0.5	0.406	6	3007;
0.5	0.435	6	3107;
0.5	0.4495	6	3207;
0.5	0.464	6	3308;
0.5	0.464	6	3408;
0.5	0.493	6	3508;
0.5	0.493	6	3608;
0.5	0.5075	6	3708;
0.5	0.522	6	3809;
0.5	0.5075	6	3909;
0.5	0.5365	6	4009;
0.5	0.5365	6	4109;
0.5	0.551	6	4209;
0.5	0.551	6	4309;
0.5	0.58	6	4410;
0.5	0.58	6	4510;
0.5	0.5945	6	4610;
0.5	0.609	6	4710;
0.5	0.6235	6	4810;
0.5	0.6235	6	4910;
0.5	0.6235	6	5011;
0.5	0.638	6	5111;
0.711	0.667	8.532	5211;
1	0.6525	12	5311;
1	0.725	12	5411;
1	0.7975	12	5512;
0	0.841	0	5612;
0	0.783	0	5712;
0	0.7395	0	5812;
0	0.696	0	5913;
0	0.6525	0	6013;
0.618	0.638	7.416	6113;
1	0.638	12	6213;
1	0.7105	12	6313;
1	0.783	12	6414;
0.433	0.899	5.196	6514;
0.433	0.783	5.196	6614;
0.309	0.783	3.708	6714;
0.237	0.783	2.844	6815;
0.597	0.7685	7.164	6915;
0.639	0.754	7.668	7015;
0.989	0.7685	11.868	7115;
1	0.841	12	7215;
0.762	0.9715	9.144	7316;
0.762	0.8845	9.144	7416;
0.34	0.9135	4.08	7516;
0.34	0.899	4.08	7616;
0.36	0.8845	4.32	7716;
0.783	0.8555	9.396	7817;
1	0.8845	12	7917;
1	1.015	12	8017;
0.319	1.0585	3.828	8117;
0	0.9135	0	8217;
0	0.899	0	8319;
0	0.8555	0	8419;
0.144	0.8265	1.728	8520;
0.546	0.783	6.552	8620;
1	0.783	12	8720;
1	0.87	12	8820;
1	0.899	12	8920;
1	1.0005	12	9021;
0.061	1.0585	0.732	9121;
0	0.899	0	9221;
0	0.8845	0	9321;
0	0.8265	0	9421;
0.134	0.7975	1.608	9521;
0.742	0.754	8.904	9621;
0.752	0.7685	9.024	9722;
0.958	0.8265	11.496	9822;
0.226	0.928	2.712	9922;
0.02	0.7975	0.24	10022;
0	0.783	0	10122;
0.092	0.754	1.104	10222;
0.113	0.7105	1.356	10323;
0.618	0.696	7.416	10423;
0.938	0.696	11.256	10523;
0.938	0.8265	11.256	10623;
0.731	0.841	8.772	10723;
0	0.783	0	10824;
0	0.7685	0	10924;
0	0.725	0	11024;
0	0.667	0	11124;
1	0.667	12	11224;
1	0.7395	12	11324;
1	0.841	12	11425;
0.721	0.87	8.652	11525;
0.195	0.7975	2.34	11625;
0	0.7975	0	11725;
0	0.7395	0	11825;
0	0.725	0	11926;
0	0.6815	0	12026;
0	0.6525	0	12126;
0	0.609	0	12226;
0	0.5945	0	12326;
0	0.551	0	12426;
0	0.5365	0	12527;
0	0.5075	0	12627;
0	0.4785	0	12727;
0	0.464	0	12827;
0	0.435	0	12927;
0	0.435	0	13028;
0	0.3915	0	13128;
0	0.377	0	13228;
0	0.348	0	13328;
0	0.3335	0	13428;
0	0.3045	0	13528;
0	0.3045	0	13629;
0	0.2755	0	13729;
0	0.261	0	13829;
0	0.232	0	13929;
0	0.232	0	14029;
0	0.203	0	14129;
0	0.203	0	14229;
0	0.174	0	14330;
0	0.145	0	14430;
0	0.145	0	14530;
0	0.116	0	14630;
0	0.087	0	14730;
0	0.0725	0	14831;
0	0.0435	0	14931;
0	0.029	0	15031;
0	0	0	15131;
0	0	0	15231;
0	0.0145	0	15332;
0	0.0145	0	15432;
0	0	0	15532;
0	0	0	15632;
0	0	0	15732;
0	0	0	15832;
0	0	0	15933;
0	0	0	16033;
0	0	0	16133;
0	0	0	16233];

teste5 = [
0	0	0	100;
0	0	0	200;
0	0	0	300;
0	0	0	400;
0	0	0	500;
0	0	0	600;
0	0	0	700;
0	0	0	801;
0	0	0	901;
0	0	0	1001;
0	0	0	1101;
0	0	0	1201;
0	0	0	1301;
0	0	0	1401;
0	0	0	1502;
0	0	0	1602;
0	0	0	1702;
0	0	0	1802;
0	0	0	1902;
0	0	0	2002;
0	0	0	2102;
0	0	0	2202;
0	0	0	2303;
0.5	0	6	2403;
0.5	0.029	6	2503;
0.5	0.058	6	2603;
0.5	0.1015	6	2703;
0.5	0.1305	6	2803;
0.5	0.1595	6	2903;
0.5	0.203	6	3003;
0.5	0.2465	6	3104;
0.5	0.261	6	3204;
0.5	0.2755	6	3304;
0.5	0.319	6	3404;
0.5	0.319	6	3504;
0.5	0.348	6	3604;
0.5	0.377	6	3704;
0.5	0.3915	6	3804;
0.5	0.4205	6	3905;
0.5	0.4205	6	4005;
0.5	0.4495	6	4105;
0.5	0.4495	6	4205;
0.5	0.4785	6	4305;
0.5	0.493	6	4405;
0.5	0.5075	6	4505;
0.5	0.5075	6	4606;
0.5	0.522	6	4706;
0.5	0.5655	6	4806;
0.5	0.5655	6	4906;
0.5	0.58	6	5006;
0.5	0.5945	6	5106;
0.5	0.58	6	5206;
0.5	0.58	6	5307;
0.5	0.58	6	5407;
0.5	0.609	6	5507;
0.5	0.5945	6	5607;
0.5	0.609	6	5707;
0.5	0.6235	6	5807;
0.5	0.6235	6	5908;
0.5	0.638	6	6008;
0.5	0.638	6	6108;
0.5	1.2905	6	6208;
0.5	0.667	6	6308;
0.5	0.6525	6	6409;
0.5	0.667	6	6509;
0.5	0.667	6	6609;
0.5	0.6815	6	6709;
0.5	0.696	6	6809;
0.5	0.696	6	6909;
0.5	0.696	6	7010;
0.5	0.696	6	7110;
0.5	0.7105	6	7210;
0.5	0.7105	6	7310;
0.5	0.7105	6	7410;
0.5	0.7105	6	7510;
0.5	0.696	6	7611;
0.5	0.7105	6	7711;
0.5	0.7105	6	7811;
0.5	0.7105	6	7911;
0.5	0.7105	6	8011;
0.5	0.725	6	8112;
0.5	0.725	6	8212;
0.5	0.7395	6	8312;
0.5	0.725	6	8412;
0.5	0.7395	6	8512;
0.5	0.7395	6	8613;
0.6	0.7395	7.2	8713;
0.6	0.783	7.2	8813;
0.6	0.754	7.2	8913;
0.6	0.7685	7.2	9013;
0.6	0.7975	7.2	9113;
0.6	0.7975	7.2	9214;
0.6	0.783	7.2	9314;
0.6	0.812	7.2	9414;
0.6	0.812	7.2	9514;
0.6	0.8265	7.2	9614;
0.6	0.8265	7.2	9714;
0.6	0.841	7.2	9815;
0.6	0.8555	7.2	9915;
0.6	0.841	7.2	10015;
0.4	0.87	4.8	10115;
0.4	0.8555	4.8	10215;
0.4	0.841	4.8	10316;
0.4	0.841	4.8	10416;
0.4	0.8265	4.8	10516;
0.4	0.8265	4.8	10616;
0.4	0.812	4.8	10716;
0.4	0.7975	4.8	10817;
0.4	0.7975	4.8	10917;
0.4	0.7975	4.8	11017;
0.4	0.7685	4.8	11117;
0.4	0.7685	4.8	11217;
0.4	0.7685	4.8	11318;
0.4	0.7685	4.8	11418;
0.6	0.754	7.2	11518;
0.6	0.7685	7.2	11618;
0.6	0.783	7.2	11718;
0.6	0.7685	7.2	11818;
0.6	0.812	7.2	11919;
0.6	0.7975	7.2	12019;
0.6	0.841	7.2	12119;
0.6	0.8265	7.2	12219;
0.6	0.812	7.2	12319;
0.6	0.8265	7.2	12420;
0.6	0.841	7.2	12520;
0.6	0.841	7.2	12620;
0.6	0.8555	7.2	12720;
0.6	0.8555	7.2	12820;
0.4	0.8555	4.8	12920;
0.4	0.8555	4.8	13021;
0.4	0.812	4.8	13121;
0.4	0.8265	4.8	13221;
0.4	0.8265	4.8	13321;
0.4	0.812	4.8	13421;
0.4	0.812	4.8	13521;
0.4	0.7975	4.8	13622;
0.4	0.783	4.8	13722;
0.4	0.7685	4.8	13822;
0.4	0.7685	4.8	13922;
0.4	0.7685	4.8	14022;
0.4	0.7685	4.8	14122;
0.4	0.754	4.8	14223;
0.4	0.754	4.8	14323;
0.4	0.7395	4.8	14423;
0.4	0.7395	4.8	14523;
0.6	0.7395	7.2	14624;
0.6	0.754	7.2	14724;
0.6	0.7685	7.2	14824;
0.6	0.783	7.2	14925;
0.6	0.783	7.2	15025;
0.6	0.812	7.2	15125;
0.6	0.7975	7.2	15225;
0.6	0.7975	7.2	15326;
0.6	0.812	7.2	15426;
0.6	0.841	7.2	15526;
0.6	0.8265	7.2	15626;
0.6	0.841	7.2	15726;
0.6	0.8555	7.2	15826;
0.6	0.841	7.2	15927;
0.4	0.8845	4.8	16027;
0.4	0.841	4.8	16127;
0.4	0.8265	4.8	16227;
0.4	0.8265	4.8	16327;
0.4	0.8265	4.8	16427;
0.4	0.8265	4.8	16527;
0.4	0.812	4.8	16628;
0.4	0.812	4.8	16728;
0.4	0.783	4.8	16828;
0.4	0.783	4.8	16928;
0.4	0.7685	4.8	17028;
0.4	0.754	4.8	17128;
0.4	0.754	4.8	17228;
0.4	0.754	4.8	17328;
0.4	0.7395	4.8	17429;
0.4	0.725	4.8	17529;
0.4	0.7395	4.8	17629;
0	0.7105	0	17729;
0	0.696	0	17829;
0	0.6525	0	17929;
0	0.638	0	18029;
0	0.5945	0	18129;
0	0.5655	0	18230;
0	0.5365	0	18330;
0	0.5075	0	18430;
0	0.4785	0	18530;
0	0.464	0	18630;
0	0.435	0	18730;
0	0.406	0	18830;
0	0.377	0	18931;
0	0.377	0	19031;
0	0.348	0	19131;
0	0.3045	0	19231;
0	0.3045	0	19331;
0	0.29	0	19431;
0	0.261	0	19531;
0	0.261	0	19632;
0	0.232	0	19732;
0	0.232	0	19832;
0	0.203	0	19932;
0	0.203	0	20032;
0	0.174	0	20132;
0	0.174	0	20233;
0	0.145	0	20333;
0	0.145	0	20433;
0	0.1305	0	20533;
0	0.1015	0	20633;
0	0.1015	0	20733;
0	0.087	0	20833;
0	0.0725	0	20934;
0	0.058	0	21034;
0	0.058	0	21134;
0	0.029	0	21234;
0	0.029	0	21334;
0	0	0	21434;
0	0	0	21534;
0	0	0	21635;
0	0	0	21735;
0	0	0	21835;
0	0	0	21935;
0	0	0	22035;
0	0	0	22135;
0	0	0	22236;
0	0	0	22336;
0	0	0	22436;
0	0	0	22536];

teste6 = [
0	0	0	100;
0	0	0	200;
0	0	0	300;
0	0	0	400;
0	0	0	500;
0	0	0	600;
0	0	0	700;
0	0	0	801;
0	0	0	901;
0	0	0	1001;
0	0	0	1101;
0	0	0	1201;
0	0	0	1301;
0	0	0	1401;
0.5	0	6	1501;
0.5	0.0145	6	1602;
0.5	0.0435	6	1702;
0.5	0.087	6	1802;
0.5	0.1305	6	1902;
0.5	0.145	6	2002;
0.5	0.1885	6	2102;
0.5	0.203	6	2202;
0.5	0.232	6	2302;
0.5	0.261	6	2403;
0.5	0.29	6	2503;
0.5	0.3045	6	2603;
0.5	0.3335	6	2703;
0.5	0.3625	6	2803;
0.5	0.377	6	2903;
0.5	0.3915	6	3003;
0.5	0.4205	6	3104;
0.5	0.435	6	3204;
0.5	0.4495	6	3304;
0.5	0.464	6	3404;
0.5	0.4785	6	3504;
0.5	0.493	6	3604;
0.5	0.5075	6	3704;
0.5	0.522	6	3804;
0.5	0.5365	6	3905;
0.5	0.5365	6	4005;
1	0.5655	12	4105;
1	0.6235	12	4205;
1	0.7105	12	4305;
1	0.7685	12	4405;
1	0.8265	12	4505;
1	0.87	12	4606;
1	0.9425	12	4706;
1	1.0005	12	4806;
1	1.0005	12	4906;
1	1.0295	12	5006;
1	1.102	12	5106;
1	1.1455	12	5207;
1	1.16	12	5307;
1	1.218	12	5407;
1	1.247	12	5507;
1	1.247	12	5607;
1	1.2325	12	5707;
1	1.247	12	5808;
1	1.2905	12	5908;
1	1.2905	12	6008;
1	1.276	12	6108;
1	1.3775	12	6208;
1	1.305	12	6309;
1	1.4065	12	6409;
1	1.479	12	6509;
1	1.4065	12	6609;
1	1.479	12	6709;
1	1.479	12	6810;
1	1.4935	12	6910;
1	1.537	12	7010;
1	1.4935	12	7110;
1	1.508	12	7210;
1	1.537	12	7310;
1	1.566	12	7411;
1	1.5225	12	7511;
1	1.508	12	7611;
1	1.5515	12	7711;
1	1.5805	12	7811;
1	1.6095	12	7912;
1	1.5805	12	8012;
1	1.595	12	8112;
1	1.5805	12	8212;
1	1.6095	12	8313;
1	1.6095	12	8413;
1	1.6385	12	8513;
1	1.624	12	8613;
1	1.624	12	8713;
1	1.653	12	8813;
1	1.624	12	8914;
1	1.6385	12	9014;
1	1.653	12	9114;
1	1.682	12	9214;
1	1.653	12	9314;
1	1.6965	12	9415;
1	1.682	12	9515;
1	1.711	12	9615;
1	1.6675	12	9715;
1	1.682	12	9815;
0	1.6965	0	9915;
0	1.7255	0	10016;
0	1.537	0	10116;
0	1.3485	0	10216;
0	1.334	0	10316;
0	1.276	0	10416;
0	1.3195	0	10516;
0	1.2035	0	10617;
0	1.218	0	10717;
0	1.131	0	10817;
0	1.0875	0	10917;
0	1.0295	0	11018;
0	0.986	0	11118;
0	0.9425	0	11218;
0	0.9135	0	11318;
0	0.87	0	11418;
0	0.8265	0	11519;
0	0.7975	0	11619;
0	0.7685	0	11719;
0	0.7395	0	11819;
0	0.696	0	11919;
0	0.6525	0	12019;
0	0.6235	0	12120;
0	0.5945	0	12220;
0	0.5655	0	12320;
0	0.5365	0	12420;
0	0.5075	0	12520;
0	0.4785	0	12620;
0	0.4785	0	12721;
0	0.435	0	12821;
0	0.406	0	12921;
0	0.406	0	13021;
0	0.3625	0	13121;
0	0.348	0	13221;
0	0.3335	0	13322;
0	0.3045	0	13422;
0	0.3045	0	13522;
0	0.2755	0	13622;
0	0.261	0	13722;
0	0.2465	0	13823;
0	0.2465	0	13923;
0	0.232	0	14023;
0	0.2175	0	14123;
0	0.203	0	14223;
0	0.1885	0	14323;
0	0.1885	0	14424;
0	0.1595	0	14524;
0	0.1595	0	14624;
0	0.145	0	14724;
0	0.116	0	14824;
0	0.116	0	14925;
0	0.116	0	15025;
0	0.087	0	15125;
0	0.087	0	15225;
0	0.174	0	15325;
0	0.0725	0	15426;
0	0.058	0	15526;
0	0.0435	0	15626;
0	0.058	0	15726;
0	0.029	0	15827;
0	0.029	0	15927;
0	0.0145	0	16027;
0	0	0	16127;
0	0	0	16228;
0	0	0	16328;
0	0	0	16428;
0	0	0	16528;
0	0	0	16628;
0	0	0	16728;
0	0	0	16829;
0	0	0	16929;
0	0	0	17029;
0	0	0	17129;
0	0	0	17229;
0	0	0	17330];

teste7 = [
0	0	0	100;
0	0	0	200;
0	0	0	300;
0	0	0	400;
0	0	0	500;
0	0	0	601;
0	0	0	701;
0	0	0	801;
0	0	0	901;
0	0	0	1001;
0	0	0	1101;
0	0	0	1201;
0	0	0	1302;
0	0	0	1402;
0	0	0	1502;
0	0	0	1602;
0	0	0	1702;
0	0	0	1802;
0	0	0	1902;
0	0	0	2003;
0	0	0	2103;
0	0	0	2203;
0	0	0	2303;
0	0	0	2403;
0	0	0	2503;
0	0	0	2603;
0.5	0	6	2703;
0.5	0.0145	6	2804;
0.5	0.0725	6	2904;
0.5	0.1015	6	3004;
0.5	0.1305	6	3104;
0.5	0.1595	6	3204;
0.5	0.203	6	3304;
0.5	0.232	6	3404;
0.5	0.261	6	3504;
0.5	0.2755	6	3605;
0.5	0.319	6	3705;
0.5	0.3335	6	3805;
0.5	0.3625	6	3905;
0.5	0.377	6	4005;
0.5	0.3915	6	4105;
0.5	0.4205	6	4206;
0.5	0.4205	6	4306;
0.5	0.464	6	4406;
0.5	0.4495	6	4506;
0.5	0.493	6	4606;
0.5	0.493	6	4707;
0.5	0.5075	6	4807;
0.5	0.5365	6	4907;
0.5	0.522	6	5007;
0.5	0.551	6	5108;
0.5	0.58	6	5208;
0.5	0.58	6	5308;
0.5	0.5945	6	5408;
0.5	0.5945	6	5508;
0.5	1.189	6	5608;
0.6	0.609	7.2	5709;
0.6	0.6235	7.2	5809;
0.6	0.638	7.2	5909;
0.6	0.638	7.2	6009;
0.6	0.667	7.2	6109;
0.6	0.667	7.2	6209;
0.6	0.696	7.2	6310;
0.6	0.7105	7.2	6410;
0.6	0.7395	7.2	6510;
0.6	0.725	7.2	6610;
0.6	0.754	7.2	6710;
0.6	0.754	7.2	6811;
0.6	0.7685	7.2	6911;
0.6	0.7975	7.2	7011;
0.6	0.7975	7.2	7111;
0.6	0.8265	7.2	7212;
0.6	0.7975	7.2	7312;
0.6	0.8265	7.2	7412;
0.4	0.8265	4.8	7512;
0.4	0.8265	4.8	7613;
0.4	0.812	4.8	7714;
0.4	0.783	4.8	7814;
0.4	0.7975	4.8	7914;
0.4	0.783	4.8	8014;
0.4	0.783	4.8	8115;
0.4	0.7685	4.8	8215;
0.4	0.783	4.8	8316;
0.4	0.783	4.8	8417;
0.4	0.754	4.8	8517;
0.4	0.7685	4.8	8617;
0.4	0.754	4.8	8717;
1	0.754	12	8817;
1	0.8555	12	8918;
1	0.899	12	9018;
1	0.928	12	9118;
1	0.986	12	9218;
1	1.015	12	9318;
1	1.073	12	9418;
1	1.073	12	9519;
1	1.131	12	9619;
1	1.189	12	9719;
1	1.1745	12	9819;
1	1.2615	12	9919;
1	1.218	12	10020;
1	1.2325	12	10120;
1	1.247	12	10220;
1	1.334	12	10320;
1	1.2905	12	10420;
1	1.3485	12	10520;
1	1.3775	12	10621;
1	1.3775	12	10721;
1	1.4355	12	10821;
1	1.479	12	10921;
1	1.45	12	11021;
1	1.4645	12	11122;
1	1.479	12	11222;
1	1.479	12	11322;
1	1.537	12	11422;
1	1.566	12	11522;
1	1.6385	12	11622;
1	1.6385	12	11723;
1	1.5805	12	11823;
1	1.595	12	11923;
1	1.6095	12	12023;
1	1.6095	12	12123;
1	1.6095	12	12223;
1	1.595	12	12323;
1	1.653	12	12423;
1	1.624	12	12524;
0	1.711	0	12624;
0	1.5805	0	12724;
0	1.45	0	12825;
0	1.363	0	12925;
0	1.305	0	13025;
0	1.276	0	13126;
0	1.218	0	13226;
0	1.247	0	13326;
0	1.1455	0	13426;
0	1.102	0	13526;
0	1.015	0	13626;
0	0.9715	0	13726;
0	0.957	0	13826;
0	0.9135	0	13927;
0	0.841	0	14027;
0	0.8265	0	14127;
0	0.812	0	14227;
0	0.754	0	14327;
0	0.725	0	14427;
0	0.696	0	14527;
0	0.638	0	14628;
0	0.6235	0	14728;
0	0.5945	0	14828;
0	0.58	0	14928;
0	0.522	0	15028;
0	0.522	0	15128;
0	0.493	0	15228;
0	0.464	0	15329;
0	0.435	0	15429;
0	0.4205	0	15529;
0	0.3915	0	15629;
0	0.377	0	15729;
0	0.3625	0	15829;
0	0.3335	0	15930;
0	0.3045	0	16030;
0	0.3045	0	16130;
0	0.261	0	16230;
0	0.261	0	16331;
0	0.2465	0	16431;
0	0.2175	0	16531;
0	0.2175	0	16631;
0	0.1885	0	16732;
0	0.1885	0	16832;
0	0.1595	0	16932;
0	0.145	0	17032;
0	0.145	0	17133;
0	0.116	0	17233;
0	0.116	0	17333;
0	0.1015	0	17434;
0	0.0725	0	17534;
0	0.087	0	17634;
0	0.058	0	17735;
0	0.0435	0	17835;
0	0.029	0	17935;
0	0.0145	0	18035;
0	0.0145	0	18136;
0	0.0145	0	18236;
0	0	0	18336;
0	0	0	18437;
0	0	0	18537;
0	0	0	18637;
0	0	0	18737;
0	0	0	18838;
0	0	0	18938;
0	0	0	19038;
0	0	0	19139;
0	0	0	19239;
0	0	0	19339;
0	0	0	19440];
