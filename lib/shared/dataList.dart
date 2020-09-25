List<ListWords>  listWords = [
  ListWords('Vegetables', 'OneWord definition'),
  ListWords('Fruits', 'TwoWord definition.'),
  ListWords('Offers', 'TreeWord definition'),
];

class ListWords {
  String titlelist;
  String definitionlist;

  ListWords(String titlelist, String definitionlist) {
    this.titlelist = titlelist;
    this.definitionlist = definitionlist;
  }
}