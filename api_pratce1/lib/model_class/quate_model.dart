
class QuoteModel{
  int id;
  String quote;
  String author;

  QuoteModel({required this.id,required this.author , required this.quote});

  /// fromJson
factory QuoteModel.fromJson(Map<String,dynamic> json){
  return QuoteModel(
      id: json['id'],
      author: json['author'],
      quote: json['quote']);
}
}

class QuotesDataModel{
  int limit;
  int skip;
  int total;

  List<QuoteModel> quotes;
  QuotesDataModel({required this.limit ,required this.skip,required this.total,required this.quotes});

  /// fromjson
  factory QuotesDataModel.fromJson(Map<String,dynamic> json){
    List<QuoteModel> mQuotes=[];
    for(Map<String,dynamic> eachQuote in json['quotes']){
      mQuotes.add(QuoteModel.fromJson(eachQuote));
    }
    return QuotesDataModel(
        limit: json['limit'],
        skip: json['skip'],
        total: json['total'],
        quotes: mQuotes);
  }

}