class Item {
    Item({
      this.id,
      this.name,
      this.description,
      this.isExpanded = false,
    });
  
    int? id;
    String? name;
    String? description;
    bool? isExpanded;
  }