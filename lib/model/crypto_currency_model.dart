class CryptoCurrencyModel {
  List<Data>? data;
  Status? status;

  CryptoCurrencyModel({this.data, this.status});

  CryptoCurrencyModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status =
    json['status'] != null ? Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (status != null) {
      data['status'] = status!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? rank;
  String? name;
  String? symbol;
  String? slug;
  int? isActive;
  String? firstHistoricalData;
  String? lastHistoricalData;
  Platform? platform;

  Data(
      {this.id,
        this.rank,
        this.name,
        this.symbol,
        this.slug,
        this.isActive,
        this.firstHistoricalData,
        this.lastHistoricalData,
        this.platform});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rank = json['rank'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    isActive = json['is_active'];
    firstHistoricalData = json['first_historical_data'];
    lastHistoricalData = json['last_historical_data'];
    platform = json['platform'] != null
        ? Platform.fromJson(json['platform'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rank'] = rank;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['is_active'] = isActive;
    data['first_historical_data'] = firstHistoricalData;
    data['last_historical_data'] = lastHistoricalData;
    if (platform != null) {
      data['platform'] = platform!.toJson();
    }
    return data;
  }
}

class Platform {
  int? id;
  String? name;
  String? symbol;
  String? slug;
  String? tokenAddress;

  Platform({this.id, this.name, this.symbol, this.slug, this.tokenAddress});

  Platform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    tokenAddress = json['token_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['token_address'] = tokenAddress;
    return data;
  }
}

class Status {
  String? timestamp;
  int? errorCode;
  String? errorMessage;
  int? elapsed;
  int? creditCount;

  Status(
      {this.timestamp,
        this.errorCode,
        this.errorMessage,
        this.elapsed,
        this.creditCount});

  Status.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    errorCode = json['error_code'];
    errorMessage = json['error_message'];
    elapsed = json['elapsed'];
    creditCount = json['credit_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['error_code'] = errorCode;
    data['error_message'] = errorMessage;
    data['elapsed'] = elapsed;
    data['credit_count'] = creditCount;
    return data;
  }
}