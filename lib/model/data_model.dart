/// Data : [{"recid":16,"recno":"110001","recdocno":null,"recbranchid":11,"branchname":"???????? ??????","recdate":"8/18/2022","recman":null,"recvalue":500.0,"recnotes":null,"recuser":"Admin","postacc":true,"vchrid":4,"ccid":null,"ccname":null,"paytypeid":1,"paytypename":"????","paychartid":143,"payref":null,"paynotes":null,"fromchartid":122,"rectype":1,"rectypename":"??? ????","recdocimg":null,"fyear":"2022","vochrno":"220000003","custid":null,"custname":null,"smanid":null,"smanname":null,"chartcode":211010,"chartname":"????? ??? ?????? ?????? ????????"},{"recid":17,"recno":"110002","recdocno":null,"recbranchid":11,"branchname":"???????? ??????","recdate":"8/18/2022","recman":null,"recvalue":115.0,"recnotes":null,"recuser":"Admin","postacc":true,"vchrid":5,"ccid":null,"ccname":null,"paytypeid":1,"paytypename":"????","paychartid":143,"payref":null,"paynotes":null,"fromchartid":137,"rectype":2,"rectypename":"??? ????","recdocimg":null,"fyear":"2022","vochrno":"220000004","custid":null,"custname":null,"smanid":null,"smanname":null,"chartcode":311102,"chartname":"???? ?????? ???? ???? ??? ???????"},{"recid":18,"recno":"110003","recdocno":null,"recbranchid":11,"branchname":"???????? ??????","recdate":"1/3/2022","recman":null,"recvalue":500.0,"recnotes":null,"recuser":"Admin","postacc":null,"vchrid":null,"ccid":null,"ccname":null,"paytypeid":1,"paytypename":"????","paychartid":143,"payref":null,"paynotes":null,"fromchartid":123,"rectype":1,"rectypename":"??? ????","recdocimg":null,"fyear":"2022","vochrno":null,"custid":null,"custname":null,"smanid":null,"smanname":null,"chartcode":211011,"chartname":"????? ?????? ???????? "},{"recid":19,"recno":"110004","recdocno":null,"recbranchid":11,"branchname":"???????? ??????","recdate":"3/8/2022","recman":null,"recvalue":9000.0,"recnotes":null,"recuser":"Admin","postacc":true,"vchrid":20,"ccid":null,"ccname":null,"paytypeid":1,"paytypename":"????","paychartid":144,"payref":null,"paynotes":null,"fromchartid":139,"rectype":1,"rectypename":"??? ????","recdocimg":null,"fyear":"2022","vochrno":"220000016","custid":null,"custname":null,"smanid":null,"smanname":null,"chartcode":511101,"chartname":"???? ????? ????????"},{"recid":20,"recno":"110005","recdocno":"","recbranchid":11,"branchname":"???????? ??????","recdate":"9/8/2022","recman":"Admin","recvalue":500.0,"recnotes":"","recuser":"Admin","postacc":false,"vchrid":null,"ccid":null,"ccname":null,"paytypeid":1,"paytypename":"????","paychartid":143,"payref":"","paynotes":"","fromchartid":94,"rectype":1,"rectypename":"??? ????","recdocimg":null,"fyear":"2022","vochrno":null,"custid":null,"custname":null,"smanid":null,"smanname":null,"chartcode":42101001,"chartname":"???? ????? ???????? ????????"},{"recid":21,"recno":"110006","recdocno":"","recbranchid":11,"branchname":"???????? ??????","recdate":"9/8/2022","recman":"Admin","recvalue":66.0,"recnotes":"","recuser":"Admin","postacc":false,"vchrid":null,"ccid":null,"ccname":null,"paytypeid":1,"paytypename":"????","paychartid":143,"payref":"","paynotes":"","fromchartid":91,"rectype":3,"rectypename":"????? ???","recdocimg":null,"fyear":"2022","vochrno":null,"custid":null,"custname":null,"smanid":null,"smanname":null,"chartcode":213002,"chartname":"???? ??????? ??????? ????"},{"recid":22,"recno":"110007","recdocno":"","recbranchid":11,"branchname":"???????? ??????","recdate":"9/8/2022","recman":"Admin","recvalue":666.0,"recnotes":"","recuser":"Admin","postacc":false,"vchrid":null,"ccid":null,"ccname":null,"paytypeid":9,"paytypename":"????? ?????","paychartid":null,"payref":"","paynotes":"","fromchartid":91,"rectype":1,"rectypename":"??? ????","recdocimg":null,"fyear":"2022","vochrno":null,"custid":null,"custname":null,"smanid":null,"smanname":null,"chartcode":213002,"chartname":"???? ??????? ??????? ????"},{"recid":23,"recno":"110008","recdocno":"","recbranchid":11,"branchname":"???????? ??????","recdate":"9/8/2022","recman":"Admin","recvalue":200.0,"recnotes":"","recuser":"Admin","postacc":false,"vchrid":null,"ccid":null,"ccname":null,"paytypeid":1,"paytypename":"????","paychartid":143,"payref":"","paynotes":"","fromchartid":93,"rectype":1,"rectypename":"??? ????","recdocimg":null,"fyear":"2022","vochrno":null,"custid":null,"custname":null,"smanid":null,"smanname":null,"chartcode":41101001,"chartname":"???? ??????"},{"recid":24,"recno":"110009","recdocno":"","recbranchid":11,"branchname":"???????? ??????","recdate":"9/8/2022","recman":"Admin","recvalue":500.0,"recnotes":"","recuser":"Admin","postacc":false,"vchrid":null,"ccid":null,"ccname":null,"paytypeid":1,"paytypename":"????","paychartid":143,"payref":"","paynotes":"","fromchartid":95,"rectype":1,"rectypename":"??? ????","recdocimg":null,"fyear":"2022","vochrno":null,"custid":null,"custname":null,"smanid":null,"smanname":null,"chartcode":113002,"chartname":"???? ???? ???????"},{"recid":25,"recno":"110010","recdocno":"","recbranchid":11,"branchname":"???????? ??????","recdate":"9/8/2022","recman":"Admin","recvalue":500.0,"recnotes":"","recuser":"Admin","postacc":false,"vchrid":null,"ccid":null,"ccname":null,"paytypeid":1,"paytypename":"????","paychartid":143,"payref":"","paynotes":"","fromchartid":113,"rectype":1,"rectypename":"??? ????","recdocimg":null,"fyear":"2022","vochrno":null,"custid":null,"custname":null,"smanid":null,"smanname":null,"chartcode":211001,"chartname":"??? ????? ??????? ????"}]

class DataModel {
  final List<DataBean>? Data;

  DataModel(this.Data);

  static DataModel fromMap(Map<String, dynamic> map) {
    DataModel dataModelBean = DataModel(
      map['Data'] != null
          ? ([]..addAll((map['Data'] as List).map((o) => DataBean.fromMap(o))))
          : null,
    );
    return dataModelBean;
  }

  Map toJson() => {
        "Data": Data?.map((o) => o.toJson()).toList(growable: false),
      }..removeWhere((k, v) => v == null);
}

class DataBean {
  final int? recid;
  final String? recno;

  final String? branchname;

  final double? recvalue;

  final String? paytypename;

  final String? rectypename;

  DataBean(
    this.recid,
    this.recno,
    this.branchname,
    this.recvalue,
    this.paytypename,
    this.rectypename,
  );

  static DataBean fromMap(Map<String, dynamic> map) {
    DataBean dataBean = DataBean(
      map['recid'],
      map['recno'],
      map['branchname'],
      map['recvalue'],
      map['paytypename'],
      map['rectypename'],
    );
    return dataBean;
  }

  Map toJson() => {
        "recid": recid,
        "recno": recno,
        "branchname": branchname,
        "recvalue": recvalue,
        "paytypename": paytypename,
        "rectypename": rectypename,
      }..removeWhere((k, v) => v == null);
}
