class AuthenticatedUser {
  Data? data;
  Response? response;

  AuthenticatedUser({this.data, this.response});

  AuthenticatedUser.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    response = json['response'] != null
        ? Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class Data {
  String? address;
  CustomFields? customFields;
  Data? data;
  String? dateVerified;
  String? email;
  FbIntegration? fbIntegration;
  Null fbIntegrationTerminated;
  String? id;
  String? industry;
  List<Labels>? labels;
  String? logo;
  String? name;
  String? orgId;
  String? orgStatus;
  String? phoneNumber;
  String? planAnnualDiscount;
  String? planPriceIntl;
  String? planPricePk;
  String? planQuarterlyDiscount;
  String? referralCode;
  String? role;
  Subscription? subscription;
  TiktokIntegration? tiktokIntegration;
  Null tiktokIntegrationTerminated;
  String? token;
  String? userStatus;
  String? username;

  Data(
      {this.address,
      this.customFields,
      this.data,
      this.dateVerified,
      this.email,
      this.fbIntegration,
      this.fbIntegrationTerminated,
      this.id,
      this.industry,
      this.labels,
      this.logo,
      this.name,
      this.orgId,
      this.orgStatus,
      this.phoneNumber,
      this.planAnnualDiscount,
      this.planPriceIntl,
      this.planPricePk,
      this.planQuarterlyDiscount,
      this.referralCode,
      this.role,
      this.subscription,
      this.tiktokIntegration,
      this.tiktokIntegrationTerminated,
      this.token,
      this.userStatus,
      this.username});

  Data.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    customFields = json['custom_fields'] != null
        ? CustomFields.fromJson(json['custom_fields'])
        : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    dateVerified = json['date_verified'];
    email = json['email'];
    fbIntegration = json['fb_integration'] != null
        ? FbIntegration.fromJson(json['fb_integration'])
        : null;
    fbIntegrationTerminated = json['fb_integration_terminated'];
    id = json['id'];
    industry = json['industry'];
    if (json['labels'] != null) {
      labels = <Labels>[];
      json['labels'].forEach((v) {
        labels!.add(Labels.fromJson(v));
      });
    }
    logo = json['logo'];
    name = json['name'];
    orgId = json['org_id'];
    orgStatus = json['org_status'];
    phoneNumber = json['phone_number'];
    planAnnualDiscount = json['plan_annual_discount'];
    planPriceIntl = json['plan_price_intl'];
    planPricePk = json['plan_price_pk'];
    planQuarterlyDiscount = json['plan_quarterly_discount'];
    referralCode = json['referral_code'];
    role = json['role'];
    subscription = json['subscription'] != null
        ? Subscription.fromJson(json['subscription'])
        : null;
    tiktokIntegration = json['tiktok_integration'] != null
        ? TiktokIntegration.fromJson(json['tiktok_integration'])
        : null;
    tiktokIntegrationTerminated = json['tiktok_integration_terminated'];
    token = json['token'];
    userStatus = json['user_status'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    if (customFields != null) {
      data['custom_fields'] = customFields!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['date_verified'] = dateVerified;
    data['email'] = email;
    if (fbIntegration != null) {
      data['fb_integration'] = fbIntegration!.toJson();
    }
    data['fb_integration_terminated'] = fbIntegrationTerminated;
    data['id'] = id;
    data['industry'] = industry;
    if (labels != null) {
      data['labels'] = labels!.map((v) => v.toJson()).toList();
    }
    data['logo'] = logo;
    data['name'] = name;
    data['org_id'] = orgId;
    data['org_status'] = orgStatus;
    data['phone_number'] = phoneNumber;
    data['plan_annual_discount'] = planAnnualDiscount;
    data['plan_price_intl'] = planPriceIntl;
    data['plan_price_pk'] = planPricePk;
    data['plan_quarterly_discount'] = planQuarterlyDiscount;
    data['referral_code'] = referralCode;
    data['role'] = role;
    if (subscription != null) {
      data['subscription'] = subscription!.toJson();
    }
    if (tiktokIntegration != null) {
      data['tiktok_integration'] = tiktokIntegration!.toJson();
    }
    data['tiktok_integration_terminated'] = tiktokIntegrationTerminated;
    data['token'] = token;
    data['user_status'] = userStatus;
    data['username'] = username;
    return data;
  }
}

class CustomFields {
  DealValue? dealValue;

  CustomFields({this.dealValue});

  CustomFields.fromJson(Map<String, dynamic> json) {
    dealValue = json['dealValue'] != null
        ? DealValue.fromJson(json['dealValue'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dealValue != null) {
      data['dealValue'] = dealValue!.toJson();
    }
    return data;
  }
}

class DealValue {
  Currency? currency;
  bool? isEnabled;

  DealValue({this.currency, this.isEnabled});

  DealValue.fromJson(Map<String, dynamic> json) {
    currency = json['currency'] != null
        ? Currency.fromJson(json['currency'])
        : null;
    isEnabled = json['is_enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    data['is_enabled'] = isEnabled;
    return data;
  }
}

class Currency {
  String? countryCode;
  String? countryName;
  String? currencyCode;

  Currency({this.countryCode, this.countryName, this.currencyCode});

  Currency.fromJson(Map<String, dynamic> json) {
    countryCode = json['countryCode'];
    countryName = json['countryName'];
    currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['countryCode'] = countryCode;
    data['countryName'] = countryName;
    data['currencyCode'] = currencyCode;
    return data;
  }
}

class DataInner {
  String? orgAddress;
  String? orgAdminPosition;
  String? orgIndustry;
  Null orgTeamSize;

  DataInner(
      {this.orgAddress,
      this.orgAdminPosition,
      this.orgIndustry,
      this.orgTeamSize});

  DataInner.fromJson(Map<String, dynamic> json) {
    orgAddress = json['org_address'];
    orgAdminPosition = json['org_admin_position'];
    orgIndustry = json['org_industry'];
    orgTeamSize = json['org_team_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['org_address'] = orgAddress;
    data['org_admin_position'] = orgAdminPosition;
    data['org_industry'] = orgIndustry;
    data['org_team_size'] = orgTeamSize;
    return data;
  }
}

class FbIntegration {
  String? fbIntegration;

  FbIntegration({this.fbIntegration});

  FbIntegration.fromJson(Map<String, dynamic> json) {
    fbIntegration = json['fb_integration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fb_integration'] = fbIntegration;
    return data;
  }
}

class Labels {
  String? color;
  String? labelId;
  String? name;

  Labels({this.color, this.labelId, this.name});

  Labels.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    labelId = json['label_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['color'] = color;
    data['label_id'] = labelId;
    data['name'] = name;
    return data;
  }
}

class Subscription {
  String? subscriptionAllowedAgents;
  String? subscriptionAmount;
  String? subscriptionCustomerId;
  String? subscriptionDateAdded;
  String? subscriptionJson;
  String? subscriptionLastUpdated;
  String? subscriptionPackage;
  String? subscriptionPackageInterval;
  String? subscriptionRefresh;
  String? subscriptionStatus;
  String? subscriptionStripeId;
  String? subscriptionValidTill;

  Subscription(
      {this.subscriptionAllowedAgents,
      this.subscriptionAmount,
      this.subscriptionCustomerId,
      this.subscriptionDateAdded,
      this.subscriptionJson,
      this.subscriptionLastUpdated,
      this.subscriptionPackage,
      this.subscriptionPackageInterval,
      this.subscriptionRefresh,
      this.subscriptionStatus,
      this.subscriptionStripeId,
      this.subscriptionValidTill});

  Subscription.fromJson(Map<String, dynamic> json) {
    subscriptionAllowedAgents = json['subscription_allowed_agents'];
    subscriptionAmount = json['subscription_amount'];
    subscriptionCustomerId = json['subscription_customer_id'];
    subscriptionDateAdded = json['subscription_date_added'];
    subscriptionJson = json['subscription_json'];
    subscriptionLastUpdated = json['subscription_last_updated'];
    subscriptionPackage = json['subscription_package'];
    subscriptionPackageInterval = json['subscription_package_interval'];
    subscriptionRefresh = json['subscription_refresh'];
    subscriptionStatus = json['subscription_status'];
    subscriptionStripeId = json['subscription_stripe_id'];
    subscriptionValidTill = json['subscription_valid_till'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subscription_allowed_agents'] = subscriptionAllowedAgents;
    data['subscription_amount'] = subscriptionAmount;
    data['subscription_customer_id'] = subscriptionCustomerId;
    data['subscription_date_added'] = subscriptionDateAdded;
    data['subscription_json'] = subscriptionJson;
    data['subscription_last_updated'] = subscriptionLastUpdated;
    data['subscription_package'] = subscriptionPackage;
    data['subscription_package_interval'] = subscriptionPackageInterval;
    data['subscription_refresh'] = subscriptionRefresh;
    data['subscription_status'] = subscriptionStatus;
    data['subscription_stripe_id'] = subscriptionStripeId;
    data['subscription_valid_till'] = subscriptionValidTill;
    return data;
  }
}

class TiktokIntegration {
  Null advertiserAccounts;
  Null tiktokIdentifierState;
  String? tiktokIntegration;
  Null tiktokOauthKey;

  TiktokIntegration(
      {this.advertiserAccounts,
      this.tiktokIdentifierState,
      this.tiktokIntegration,
      this.tiktokOauthKey});

  TiktokIntegration.fromJson(Map<String, dynamic> json) {
    advertiserAccounts = json['advertiser_accounts'];
    tiktokIdentifierState = json['tiktok_identifier_state'];
    tiktokIntegration = json['tiktok_integration'];
    tiktokOauthKey = json['tiktok_oauth_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['advertiser_accounts'] = advertiserAccounts;
    data['tiktok_identifier_state'] = tiktokIdentifierState;
    data['tiktok_integration'] = tiktokIntegration;
    data['tiktok_oauth_key'] = tiktokOauthKey;
    return data;
  }
}

class Response {
  String? message;
  String? result;
  int? statusCode;

  Response({this.message, this.result, this.statusCode});

  Response.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    result = json['result'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['result'] = result;
    data['status_code'] = statusCode;
    return data;
  }
}
