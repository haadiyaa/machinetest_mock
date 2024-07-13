
class SelectCountyModel {
    bool? status;
    String? message;
    Data1? data;

    SelectCountyModel({this.status, this.message, this.data});

    SelectCountyModel.fromJson(Map<String, dynamic> json) {
        if(json["status"] is bool) {
            status = json["status"];
        }
        if(json["message"] is String) {
            message = json["message"];
        }
        if(json["data"] is Map) {
            data = json["data"] == null ? null : Data1.fromJson(json["data"]);
        }
    }

    static List<SelectCountyModel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => SelectCountyModel.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["status"] = status;
        _data["message"] = message;
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        return _data;
    }
}

class Data1 {
    String? profileStatus;
    String? role;
    dynamic selectedCountry;
    List<Countries>? countries;

    Data1({this.profileStatus, this.role, this.selectedCountry, this.countries});

    Data1.fromJson(Map<String, dynamic> json) {
        if(json["profile_status"] is String) {
            profileStatus = json["profile_status"];
        }
        if(json["role"] is String) {
            role = json["role"];
        }
        selectedCountry = json["selected_country"];
        if(json["countries"] is List) {
            countries = json["countries"] == null ? null : (json["countries"] as List).map((e) => Countries.fromJson(e)).toList();
        }
    }

    static List<Data1> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Data1.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["profile_status"] = profileStatus;
        _data["role"] = role;
        _data["selected_country"] = selectedCountry;
        if(countries != null) {
            _data["countries"] = countries?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class Countries {
    int? id;
    String? name;
    String? flag;
    String? image;

    Countries({this.id, this.name, this.flag, this.image});

    Countries.fromJson(Map<String, dynamic> json) {
        if(json["id"] is int) {
            id = json["id"];
        }
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["flag"] is String) {
            flag = json["flag"];
        }
        if(json["image"] is String) {
            image = json["image"];
        }
    }

    static List<Countries> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Countries.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        _data["flag"] = flag;
        _data["image"] = image;
        return _data;
    }
}