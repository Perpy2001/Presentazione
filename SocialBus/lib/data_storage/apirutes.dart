class APIRoute {
	int routeId;
	String agencyId;
	String routeShortName;
	String routeLongName;
	String routeDesc;
	int routeType;
	String routeUrl;
	String routeColor;
	String routeTextColor;

	APIRoute({this.routeId, this.agencyId, this.routeShortName, this.routeLongName, this.routeDesc, this.routeType, this.routeUrl, this.routeColor, this.routeTextColor});

	APIRoute.fromJson(Map<String, dynamic> json) {
		routeId = json['route_id'];
		agencyId = json['agency_id'];
		routeShortName = json['route_short_name'].toString();
		routeLongName = json['route_long_name'];
		routeDesc = json['route_desc'];
		routeType = json['route_type'];
		routeUrl = json['route_url'];
		routeColor = json['route_color'].toString();
		routeTextColor = json['route_text_color'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['route_id'] = this.routeId;
		data['agency_id'] = this.agencyId;
		data['route_short_name'] = this.routeShortName;
		data['route_long_name'] = this.routeLongName;
		data['route_desc'] = this.routeDesc;
		data['route_type'] = this.routeType;
		data['route_url'] = this.routeUrl;
		data['route_color'] = this.routeColor;
		data['route_text_color'] = this.routeTextColor;
	return data;
	}
}