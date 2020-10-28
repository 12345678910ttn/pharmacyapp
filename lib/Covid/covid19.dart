class Covid19 {
  final String date;
  final List<Township> townships;
  Covid19({
    this.date,this.townships
  });
  factory Covid19.fromJson(Map<String,dynamic> parsedjson){
     var townshipList = parsedjson['township'] as List;
     List<Township> lsttownship = townshipList.map((i)=> Township.fromJson(i)).toList();
    return new Covid19(
      date: parsedjson['date'] as String,
     
      townships: lsttownship 

    );
  }

}



class Township {
 final String townshipname;
  final int effectedcount;
  Township({this.townshipname,this.effectedcount});
  factory Township.fromJson(Map<String,dynamic> json){
    return Township (
       townshipname: json['townshipname'],
      effectedcount: json['effectedcount']
     
      );

  }



}
class TownshipGroup{
  final String townshipname;
  final int effectedcount;
  final String date;
  TownshipGroup({this.townshipname,this.effectedcount,this.date});

}




