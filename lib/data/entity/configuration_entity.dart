import 'dart:convert';
import 'dart:ffi';

class ConfigurationEntity {
	late ConfigurationData data;
	late List<Promotion> promotions;

	ConfigurationEntity({
		required this.data,
		required this.promotions,
	});

	factory ConfigurationEntity.fromJson(Map<String, dynamic> json) => ConfigurationEntity(
		data: ConfigurationData.fromJson(json["data"]),
		promotions: List<Promotion>.from(json["promotions"].map((x) => Promotion.fromJson(x))),
	);

	Map<String, dynamic> toJson() => {
		"data": data.toJson(),
		"promotions": List<dynamic>.from(promotions.map((x) => x.toJson())),
	};

	@override
	String toString() {
		return jsonEncode(this);
	}
}

class ConfigurationData {
	String webviewUrl = "";
	String includeUrl = "";
	Style style = Style();
	String? guestUser = "false";
	List<String> elements = List.empty();
	List<String> injectJsOnStart = List.empty();
	List<String> injectJsOnProgress = List.empty();
	List<String> injectJsOnLoad = List.empty();
	List<String> injectJs = List.empty();
	List<String> injectJsOnEnd = List.empty();
	List<String> injectJsOnNavigationStateChange = List.empty();
	ConfigurationData();

	ConfigurationData.fromJson(Map<String, dynamic> json)
	{
		webviewUrl = json["WEBVIEW_URL"];
		includeUrl =  json["INCLUDE_URL"];
		style =  Style.fromJson(json["STYLE"]);
		elements =  List<String>.from(json["ELEMENTS"].map((x) => x));
		injectJsOnStart =  List<String>.from(json["INJECT_JS_ON_START"].map((x) => x));
		injectJsOnProgress =  List<String>.from(json["INJECT_JS_ON_PROGRESS"].map((x) => x));
		injectJsOnLoad =  List<String>.from(json["INJECT_JS_ON_LOAD"].map((x) => x));
		injectJs =  List<String>.from(json["INJECT_JS"].map((x) => x));
		injectJsOnEnd =  List<String>.from(json["INJECT_JS_ON_END"].map((x) => x));
		injectJsOnNavigationStateChange =  List<String>.from(json["INJECT_JS_ON_NAVIGATION_STATE_CHANGE"].map((x) => x));
		guestUser = json["guest_user"]??"false";
	}

	Map<String, dynamic> toJson() => {
		"WEBVIEW_URL": webviewUrl,
		"INCLUDE_URL": includeUrl,
		"STYLE": style.toJson(),
		"guest_user": guestUser??"false",
		"ELEMENTS": List<dynamic>.from(elements.map((x) => x)),
		"INJECT_JS_ON_START": List<dynamic>.from(injectJsOnStart.map((x) => x)),
		"INJECT_JS_ON_PROGRESS": List<dynamic>.from(injectJsOnProgress.map((x) => x)),
		"INJECT_JS_ON_LOAD": List<dynamic>.from(injectJsOnLoad.map((x) => x)),
		"INJECT_JS": List<dynamic>.from(injectJs.map((x) => x)),
		"INJECT_JS_ON_END": List<dynamic>.from(injectJsOnEnd.map((x) => x)),
		"INJECT_JS_ON_NAVIGATION_STATE_CHANGE": List<dynamic>.from(injectJsOnNavigationStateChange.map((x) => x)),
	};


	@override
	String toString() {
		return jsonEncode(this);
	}
}

class Style {
	String mainColor = "";
	String buttonColor = "";
	String buttonTextColor = "";
	String privacyPolicyUrl = "";
	String tncUrl = "";
	String supportUrl = "";
	String faqUrl = "";

	Style();

	Style.fromJson(Map<String, dynamic> json) {
		mainColor = json["MAIN_COLOR"];
		buttonColor = json["BUTTON_COLOR"];
		buttonTextColor = json["BUTTON_TEXT_COLOR"];
		privacyPolicyUrl =  json["PRIVACY_POLICY"];
		tncUrl =  json["TERM_CONDITIONS"];
		supportUrl =  json["SUPPORT"];
		faqUrl =  json["FAQ"];
	}

	Map<String, dynamic> toJson() => {
		"MAIN_COLOR": mainColor,
		"BUTTON_COLOR": buttonColor,
		"BUTTON_TEXT_COLOR": buttonTextColor,
		"PRIVACY_POLICY": privacyPolicyUrl,
		"TERM_CONDITIONS": tncUrl,
		"SUPPORT": supportUrl,
		"FAQ": faqUrl,
	};
}

class Info {
	Moneyline moneyline = Moneyline();
	Moneyline spread = Moneyline();
	Moneyline total = Moneyline();
	Moneyline straight = Moneyline();
	Moneyline parlay = Moneyline();
	Moneyline transition = Moneyline();

	Info();

	Info.fromJson(Map<String, dynamic> json){
		moneyline = Moneyline.fromJson(json["moneyline"]);
		spread = Moneyline.fromJson(json["spread"]);
		total = Moneyline.fromJson(json["total"]);
		straight = Moneyline.fromJson(json["straight"]);
		parlay = Moneyline.fromJson(json["parlay"]);
		transition = Moneyline.fromJson(json["transition"]);
	}

	Map<String, dynamic> toJson() => {
		"moneyline": moneyline.toJson(),
		"spread": spread.toJson(),
		"total": total.toJson(),
		"straight": straight.toJson(),
		"parlay": parlay.toJson(),
		"transition": transition.toJson()
	};
}

class Moneyline {
	String header = "";
	String text = "";

	Moneyline();

	Moneyline.fromJson(Map<String, dynamic> json){
		header = json["header"];
		text = json["text"];
	}

	Map<String, dynamic> toJson() => {
		"header": header,
		"text": text,
	};
}

class Promotion {
	int id;
	String key;
	String type;
	String linkType;
	String link;
	String label;
	String? image;
	bool geoFlagged;

	Promotion({
		required this.id,
		required this.key,
		required this.type,
		required this.linkType,
		required this.link,
		required this.label,
		required this.image,
		required this.geoFlagged,
	});

	factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
		id: json["id"],
		key: json["key"],
		type: json["type"],
		linkType: json["link_type"],
		link: json["link"],
		label: json["label"],
		image: json["image"] as String?,
		geoFlagged: json["geo_flagged"],
	);

	Map<String, dynamic> toJson() => {
		"id": id,
		"key": key,
		"type": type,
		"link_type": linkType,
		"link": link,
		"label": label,
		"image": image,
		"geo_flagged": geoFlagged,
	};
}