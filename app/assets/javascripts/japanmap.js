$(function(){

    var areaLinks = {
		"北海道地方" : "prefs/1",
		"青森県" : "prefs/2",
		"岩手県" : "prefs/3",
		"宮城県": "prefs/4",
		"秋田県": "prefs/5",
		"山形県": "prefs/6",
		'福島県': "prefs/7",
		'茨城県': "prefs/8",
		'栃木県': "prefs/9",
		'群馬県': "prefs/10",
		'埼玉県': "prefs/11",
		'千葉県': "prefs/12",
		'東京都': "prefs/13",
		'神奈川県'	: "prefs/14",
		'新潟県': "prefs/15",
		'富山県': "prefs/16",
		'石川県': "prefs/17",
		'福井県': "prefs/18",
		'山梨県': "prefs/19",
		'長野県': "prefs/20",
		'岐阜県': "prefs/21",
		'静岡県': "prefs/22",
		'愛知県': "prefs/23",
		'三重県': "prefs/24",
		'滋賀県': "prefs/25",
		'京都府': "prefs/26",
		'大阪府': "prefs/27",
		'兵庫県': "prefs/28",
		'奈良県': "prefs/29",
		'和歌山県': "prefs/30",
		'鳥取県': "prefs/31",
		'島根県': "prefs/32",
		'岡山県': "prefs/33",
		'広島県': "prefs/34",
		'山口県': "prefs/35",
		'徳島県': "prefs/36",
		'香川県': "prefs/37",
		'愛媛県': "prefs/38",
		'高知県': "prefs/39",
		'福岡県': "prefs/40",
		'佐賀県': "prefs/41",
		'長崎県': "prefs/42",
		'熊本県': "prefs/43",
		'大分県': "prefs/44",
		'宮崎県': "prefs/45",
		'鹿児島県': "prefs/26",
		'沖縄県': "prefs/47",
	};
	//地域を設定
	//{"code":[地域のコード], "name": [地域の名前], "color":[地域につける色], "hoverColor":[地域をマウスでホバーしたときの色], "prefectures":[地域に含まれる都道府県のコード]}
	var areas = [
		{"code": 1 , "name":"北海道地方", "color":"#ffffc1", "hoverColor":"#e0b1fb", "prefectures":[1]},
		{"code": 2 , "name":"青森県", "color":"#ffffc1", "hoverColor":"#e0b1fb", "prefectures":[2]},
		{"code": 3, "name":"岩手県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[3]},
		{"code": 4, "name":"宮城県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[4]},
		{"code": 5, "name":"秋田県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[5]},
		{"code": 6, "name":"山形県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[6]},
		{"code": 7, "name":"福島県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[7]},
		{"code": 8, "name":"茨城県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[8]},
		{"code": 9, "name":"栃木県", "color":"#ffffc1", "hoverColor":"#e0b1fb", "prefectures":[9]},
		{"code": 10, "name":"群馬県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[10]},
		{"code": 11, "name":"埼玉県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[11]},
		{"code": 12, "name":"千葉県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[12]},
		{"code": 13, "name":"東京都", "color":"#ffffc1", "hoverColor":"red", "prefectures":[13]},
		{"code": 14, "name":"神奈川県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[14]},
		{"code": 15, "name":"新潟県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[15]},
		{"code": 16, "name":"富山県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[16]},
		{"code": 17, "name":"石川県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[17]},
		{"code": 18, "name":"福井県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[18]},
		{"code": 19, "name":"山梨県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[19]},
		{"code": 20, "name":"長野県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[20]},
		{"code": 21, "name":"岐阜県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[21]},
		{"code": 22, "name":"静岡県", "color":"#ffffc1", "hoverColor":"#e0b1fb", "prefectures":[22]},
		{"code": 23, "name":"愛知県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[23]},
		{"code": 24, "name":"三重県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[24]},
		{"code": 25, "name":"滋賀県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[25]},
		{"code": 26, "name":"京都府", "color":"#ffffc1", "hoverColor":"red", "prefectures":[26]},
		{"code": 27, "name":"大阪府", "color":"#ffffc1", "hoverColor":"red", "prefectures":[27]},
		{"code": 28, "name":"兵庫県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[28]},
		{"code": 29, "name":"奈良県", "color":"#ffffc1", "hoverColor":"#e0b1fb", "prefectures":[29]},
		{"code": 30, "name":"和歌山県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[30]},
		{"code": 31, "name":"鳥取県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[31]},
		{"code": 32, "name":"島根県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[32]},
		{"code": 33, "name":"岡山県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[33]},
		{"code": 34, "name":"広島県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[34]},
		{"code": 35, "name":"山口県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[35]},
		{"code": 36, "name":"徳島県", "color":"#ffffc1", "hoverColor":"#e0b1fb", "prefectures":[36]},
		{"code": 37, "name":"香川県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[37]},
		{"code": 38, "name":"愛媛県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[38]},
		{"code": 39, "name":"高知県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[39]},
		{"code": 40, "name":"福岡県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[40]},
		{"code": 41, "name":"佐賀県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[41]},
		{"code": 42, "name":"長崎県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[42]},
		{"code": 43, "name":"熊本県", "color":"#ffffc1", "hoverColor":"#e0b1fb", "prefectures":[43]},
		{"code": 44, "name":"大分県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[44]},
		{"code": 45, "name":"宮崎県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[45]},
		{"code": 46, "name":"鹿児島県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[46]},
		{"code": 47, "name":"沖縄県", "color":"#ffffc1", "hoverColor":"red", "prefectures":[47]},
	];

	$("#map").japanMap(
		{
			areas  : areas, //上で設定したエリアの情報
			selection : "prefecture", //選ぶことができる範囲(県→prefecture、エリア→area)
			borderLineWidth: 0.15, //線の幅
			borderLineColor: "#545454",
			drawsBoxLine : false, //canvasを線で囲む場合はtrue
			movesIslands : true, //南西諸島を左上に移動させるときはtrue、移動させないときはfalse
			showsAreaName : true, //エリア名を表示しない場合はfalse
			width: 800, //canvasのwidth。別途heightも指定可。
			backgroundColor: "white", //canvasの背景色
			font : "San serif", //地図に表示する文字のフォント
			fontSize : 5, //地図に表示する文字のサイズ
			fontColor : "areaColor", //地図に表示する文字の色。"areaColor"でエリアの色に合わせる

			onSelect:function(data){ //選択範囲をクリックしたときに実行
				location.href = areaLinks[data.area.name]; //data.area.nameは選択したエリアの名前
			},
		}
	);



});
