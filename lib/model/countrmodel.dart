
class Country {
    bool? status;
    String? message;
    List<Data>? data;

    Country({this.status, this.message, this.data});

    Country.fromJson(Map<String, dynamic> json) {
        if(json["status"] is bool) {
            status = json["status"];
        }
        if(json["message"] is String) {
            message = json["message"];
        }
        if(json["data"] is List) {
            data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
        }
    }

    static List<Country> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Country.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["status"] = status;
        _data["message"] = message;
        if(data != null) {
            _data["data"] = data?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class Data {
    int? id;
    String? name;
    String? code;
    String? telCode;
    dynamic timezone;
    String? flag;
    String? createdAt;
    String? updatedAt;

    Data({this.id, this.name, this.code, this.telCode, this.timezone, this.flag, this.createdAt, this.updatedAt});

    Data.fromJson(Map<String, dynamic> json) {
        if(json["id"] is int) {
            id = json["id"];
        }
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["code"] is String) {
            code = json["code"];
        }
        if(json["tel_code"] is String) {
            telCode = json["tel_code"];
        }
        timezone = json["timezone"];
        if(json["flag"] is String) {
            flag = json["flag"];
        }
        if(json["created_at"] is String) {
            createdAt = json["created_at"];
        }
        if(json["updated_at"] is String) {
            updatedAt = json["updated_at"];
        }
    }

    static List<Data> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Data.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        _data["code"] = code;
        _data["tel_code"] = telCode;
        _data["timezone"] = timezone;
        _data["flag"] = flag;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        return _data;
    }
}