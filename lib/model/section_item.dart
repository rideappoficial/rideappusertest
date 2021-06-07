class SectionItem {
  SectionItem({this.image, this.tour});

  SectionItem.fromMap(Map<String, dynamic> map) {
    image = map['image'];
    tour = map['tour'] as String;
  }

  dynamic image;
  String tour;

  SectionItem clone() {
    return SectionItem(
      image: image,
      tour: tour,
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'image': image,
      'tour': tour,
    };
  }

  @override
  String toString() {
    return 'SectionItem{image: $image, tour: $tour}';
  }
}
