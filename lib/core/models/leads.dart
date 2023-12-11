class Leads {
  List<InnerLeadData>? leads;

  Leads({this.leads});

  Leads.fromJson(Map<String, dynamic> json) {
    if (json['leads'] != null) {
      leads = <InnerLeadData>[];
      json['leads'].forEach((v) {
        leads!.add(InnerLeadData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (leads != null) {
      data['leads'] = leads!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InnerLeadData {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? source;
  String? campaignName;
  String? agentName;
  dynamic agentImage;
  String? dateUpdated;

  InnerLeadData(
      {this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.source,
      this.campaignName,
      this.agentName,
      this.agentImage,
      this.dateUpdated});

  InnerLeadData.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    source = json['source'];
    campaignName = json['campaignName'];
    agentName = json['agentName'];
    agentImage = json['agentImage'];
    dateUpdated = json['dateUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['source'] = source;
    data['campaignName'] = campaignName;
    data['agentName'] = agentName;
    data['agentImage'] = agentImage;
    data['dateUpdated'] = dateUpdated;
    return data;
  }
}
