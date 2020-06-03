enum OrderBy { DATE, PRICE }

/* Bit flags */
const VENDOR_TYPE_PARTICULAR = 1 << 0;
const VENDOR_TYPE_PROFESSIONAL = 1 << 1;

class Filter {
  Filter({
    this.search,
    this.orderBy = OrderBy.DATE,
    this.minPrice = 0,
    this.maxPrice = 100,
    this.vendorType = VENDOR_TYPE_PARTICULAR | VENDOR_TYPE_PROFESSIONAL,
  });

  String search;

  OrderBy orderBy;
  int minPrice;
  int maxPrice;
  int vendorType;
}
