import 'dart:convert';

/// Data : "[{\"paytypeid\":1,\"paytname\":\"????\",\"paytename\":\"cash\",\"value\":0.0,\"paychartid\":143},{\"paytypeid\":2,\"paytname\":\"????\",\"paytename\":\"Network\",\"value\":0.0,\"paychartid\":null},{\"paytypeid\":3,\"paytname\":\"????\",\"paytename\":\"Visa\",\"value\":0.0,\"paychartid\":146},{\"paytypeid\":4,\"paytname\":\"????? ????\",\"paytename\":\"Bank transfer\",\"value\":0.0,\"paychartid\":null},{\"paytypeid\":5,\"paytname\":\"???\",\"paytename\":\"Check\",\"value\":0.0,\"paychartid\":null},{\"paytypeid\":9,\"paytname\":\"????? ?????\",\"paytename\":\"advance payments\",\"value\":0.0,\"paychartid\":null}]"

class PaymentTypeListModel {
  final List<DataBean>? Data;

  PaymentTypeListModel(this.Data);
  factory PaymentTypeListModel.fromRawJson(String str) =>
      PaymentTypeListModel.fromMap(json.decode(str));

  static PaymentTypeListModel fromMap(Map<String, dynamic> map) {
    PaymentTypeListModel dataModelBean = PaymentTypeListModel(
      map['Data'] != null
          ? ([]..addAll((map['Data'] as List).map((o) {
              return DataBean.fromRawJson(o);
            })))
          : null,
    );
    return dataModelBean;
  }

  Map toJson(data) => {
        "Data": Data?.map((o) => o.toJson()).toList(growable: false),
      }..removeWhere((k, v) => v == null);
}

class DataBean {
  final int? paytypeid;
  final String? paytname;

  final double? value;

  DataBean(this.paytypeid, this.paytname, this.value);
  factory DataBean.fromRawJson(String str) =>
      DataBean.fromMap(json.decode(str));
  static DataBean fromMap(Map<String, dynamic> map) {
    DataBean dataBean = DataBean(
      map['paytypeid'],
      map['paytname'],
      map['value'],
    );
    return dataBean;
  }

  Map toJson() => {
        "paytypeid": paytypeid,
        "paytname": paytname,
        "value": value,
      }..removeWhere((k, v) => v == null);
}
