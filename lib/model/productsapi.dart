class ProductResponse {
  final String message;
  final String categoryName;
  final List<Product> products;
  final Pagination pagination;

  ProductResponse({
    required this.message,
    required this.categoryName,
    required this.products,
    required this.pagination,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      message: json['message'],
      categoryName: json['categoryName'],
      products: (json['products'] as List).map((e) => Product.fromJson(e)).toList(),
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

class Product {
  final String id;
  final int uid;
  final String name;
  final String slug;
  final String permalink;
  final String type;
  final String status;
  final int featured;
  final String description;
  final String shortDescription;
  final String sku;
  final String regularPrice;
  final Discount discount;
  final String salePrice;
  final Brand brand;
  final StockManagement manageStock;
  final int allowBackOrder;
  final int soldIndividually;
  final int shippingRequired;
  final int shippingTaxable;
  final List<Attribute> attributes;
  final List<Attribute> defaultAttributes;
  final List<Category> categories;
  final List<ProductImage> images;
  final String price;
  final String weightDimention;
  final List<Variation> variation;

  Product({
    required this.id,
    required this.uid,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.type,
    required this.status,
    required this.featured,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.regularPrice,
    required this.discount,
    required this.salePrice,
    required this.brand,
    required this.manageStock,
    required this.allowBackOrder,
    required this.soldIndividually,
    required this.shippingRequired,
    required this.shippingTaxable,
    required this.attributes,
    required this.defaultAttributes,
    required this.categories,
    required this.images,
    required this.price,
    required this.weightDimention,
    required this.variation,
  });

    // Override the toString() method to print meaningful details
  @override
  String toString() {
    return 'Product Details:\n'
        'ID: $id\n'
        'UID: $uid\n'
        'Name: $name\n'
        'Slug: $slug\n'
        'Permalink: $permalink\n'
        'Type: $type\n'
        'Status: $status\n'
        'Featured: $featured\n'
        'Description: $description\n'
        'Short Description: $shortDescription\n'
        'SKU: $sku\n'
        'Regular Price: $regularPrice\n'
        'Sale Price: $salePrice\n'
        'Price: $price\n'
        'Weight Dimension: $weightDimention\n'
        'Allow Back Order: $allowBackOrder\n'
        'Sold Individually: $soldIndividually\n'
        'Shipping Required: $shippingRequired\n'
        'Shipping Taxable: $shippingTaxable\n'
        'Discount: ${discount.toString()}\n'
        'Brand: ${brand.toString()}\n'
        'Manage Stock: ${manageStock.toString()}\n'
        'Categories: ${categories.map((c) => c.name).join(", ")}\n'
        'Attributes: ${attributes.map((a) => a.name).join(", ")}\n'
        // 'Images: ${images.map((i) => i.url).join(", ")}\n'
        'Variations: ${variation.map((v) => v.toString()).join("\n")}\n'; // List variations here
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      uid: json['uid'],
      name: json['name'],
      slug: json['slug'],
      permalink: json['permalink'],
      type: json['type'],
      status: json['status'],
      featured: json['featured'],
      description: json['description'],
      shortDescription: json['short_description'],
      sku: json['sku'],
      regularPrice: json['regular_price'],
      discount: Discount.fromJson(json['discount']),
      salePrice: json['sale_price'],
      brand: Brand(name: json['brand']),
      manageStock: StockManagement.fromJson(json['manage_stock']),
      allowBackOrder: json['allow_back_order'],
      soldIndividually: json['sold_individually'],
      shippingRequired: json['shipping_required'],
      shippingTaxable: json['shipping_taxable'],
      attributes: (json['attributes'] as List).map((e) => Attribute.fromJson(e)).toList(),
      defaultAttributes: (json['default_attributes'] as List).map((e) => Attribute.fromJson(e)).toList(),
      categories: (json['categories'] as List).map((e) => Category.fromJson(e)).toList(),
      images: (json['images'] as List).map((e) => ProductImage.fromJson(e)).toList(),
      price: json['price'].toString(),
      weightDimention: json['weight_dimension'],
      variation: (json['variations'] as List)
              .map((e) => Variation.fromJson(e)) // Mapping variations
              .toList(),
    );
  }
}

class Discount {
  final int isDiscountable;
  final String discountType;
  final String discountValue;

  Discount({required this.isDiscountable, required this.discountType, required this.discountValue});

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      isDiscountable: json['is_discountable'],
      discountType: json['discount_type'],
      discountValue: json['discount_value'],
    );
  }
}

class Brand {
  final String name;

  Brand({required this.name});
}

class StockManagement {
  final int isStockManage;
  final String location;
  final int quantity;
  final String stockStatus;

  StockManagement({required this.isStockManage, required this.location, required this.quantity, required this.stockStatus});

  factory StockManagement.fromJson(Map<String, dynamic> json) {
    return StockManagement(
      isStockManage: json['is_stock_manage'],
      location: json['location'],
      quantity: json['quantity'],
      stockStatus: json['stock_status'],
    );
  }
}

class Attribute {
  final String id;
  final String name;
  final String type;
  final List<AttributeOption> options;

  Attribute({required this.id, required this.name, required this.type, required this.options});

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json['_id'],
      name: json['name'],
      type: json['type'],
      options: (json['options'] as List).map((e) => AttributeOption.fromJson(e)).toList(),
    );
  }
}

class AttributeOption {
  final String name;
  final String value;
  final String? id;

  AttributeOption({required this.name, required this.value,required this.id});

  factory AttributeOption.fromJson(Map<String, dynamic> json) {
    return AttributeOption(
      name: json['name'],
      value: json['value'],
      id:json['_id'],
    );
  }
}

class Category {
  final int uid;
  final String name;
  final String slug;
  final int ismain; // Add this field

  Category({
    required this.uid,
    required this.name,
    required this.slug,
    required this.ismain,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      uid: json['uid'],
      name: json['name'],
      slug: json['slug'],
      ismain: json['ismain'] ?? 0, // Default to 0 if not present
    );
  }
}


class ProductImage {
  final String imageUrl;

  ProductImage({required this.imageUrl});

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(imageUrl: json['image_url']);
  }
}

class Pagination {
  final int currentPage;
  final int perPage;
  final int totalProducts;
  final int totalPages;

  Pagination({required this.currentPage, required this.perPage, required this.totalProducts, required this.totalPages});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['currentPage'],
      perPage: json['perPage'],
      totalProducts: json['totalProducts'],
      totalPages: json['totalPages'],
    );
  }
}
///////////////////////////////////////////////////////
class Variation {
  final int uid;
  final String name;
  final String slug;
  final String permalink;
  final String type;
  final String status;
  final bool featured;
  final String description;
  final String shortDescription;
  final String sku;
  final String regularPrice;
  final VariationDiscount? discount;
  final String salePrice;
  final String taxStatus;
  final String taxClass;
  final String brand;
  final bool allowBackOrder;
  final bool soldIndividually;
  final bool shippingRequired;
  final bool shippingTaxable;
  final List<VariationAttribute> attributes;
  final bool isDefaultVariation;
  final double averageRating;
  final int ratingCount;
  final String purchaseNote;
  final String weightDimension;
  final String gtin;
  final String mpn;
  final String ean;
  final bool dealOfMonth;
  final bool bestSellingProduct;

  Variation({
    required this.uid,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.type,
    required this.status,
    required this.featured,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.regularPrice,
    this.discount,
    required this.salePrice,
    required this.taxStatus,
    required this.taxClass,
    required this.brand,
    required this.allowBackOrder,
    required this.soldIndividually,
    required this.shippingRequired,
    required this.shippingTaxable,
    required this.attributes,
    required this.isDefaultVariation,
    required this.averageRating,
    required this.ratingCount,
    required this.purchaseNote,
    required this.weightDimension,
    required this.gtin,
    required this.mpn,
    required this.ean,
    required this.dealOfMonth,
    required this.bestSellingProduct,
  });

  factory Variation.fromJson(Map<String, dynamic> json) {
    return Variation(
      uid: json["uid"],
      name: json["name"],
      slug: json["slug"],
      permalink: json["permalink"],
      type: json["type"],
      status: json["status"],
      featured: json["featured"] == 1,
      description: json["description"] ?? "",
      shortDescription: json["short_description"] ?? "",
      sku: json["sku"] ?? "",
      regularPrice: json["regular_price"] ?? "",
      discount: json["discount"] != null ? VariationDiscount.fromJson(json["discount"]) : null,
      salePrice: json["sale_price"] ?? "",
      taxStatus: json["tax_status"] ?? "",
      taxClass: json["tax_class"] ?? "",
      brand: json["brand"] ?? "",
      allowBackOrder: json["allow_back_order"] == 1,
      soldIndividually: json["sold_individually"] == 1,
      shippingRequired: json["shipping_required"] == 1,
      shippingTaxable: json["shipping_taxable"] == 1,
      attributes: (json["attributes"] as List?)
              ?.map((attr) => VariationAttribute.fromJson(attr))
              .toList() ??
          [],
      isDefaultVariation: json["is_default_variation"] == 1,
      averageRating: double.tryParse(json["average_rating"].toString()) ?? 0.0,
      ratingCount: json["rating_count"] ?? 0,
      purchaseNote: json["purchase_note"] ?? "",
      weightDimension: json["weight_dimension"] ?? "",
      gtin: json["gtin"] ?? "",
      mpn: json["mpn"] ?? "",
      ean: json["ean"] ?? "",
      dealOfMonth: json["deal_of_month"] == 1,
      bestSellingProduct: json["best_selling_product"] == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "slug": slug,
      "permalink": permalink,
      "type": type,
      "status": status,
      "featured": featured ? 1 : 0,
      "description": description,
      "short_description": shortDescription,
      "sku": sku,
      "regular_price": regularPrice,
      "discount": discount?.toJson(),
      "sale_price": salePrice,
      "tax_status": taxStatus,
      "tax_class": taxClass,
      "brand": brand,
      "allow_back_order": allowBackOrder ? 1 : 0,
      "sold_individually": soldIndividually ? 1 : 0,
      "shipping_required": shippingRequired ? 1 : 0,
      "shipping_taxable": shippingTaxable ? 1 : 0,
      "attributes": attributes.map((attr) => attr.toJson()).toList(),
      "is_default_variation": isDefaultVariation ? 1 : 0,
      "average_rating": averageRating.toString(),
      "rating_count": ratingCount,
      "purchase_note": purchaseNote,
      "weight_dimension": weightDimension,
      "gtin": gtin,
      "mpn": mpn,
      "ean": ean,
      "deal_of_month": dealOfMonth ? 1 : 0,
      "best_selling_product": bestSellingProduct ? 1 : 0,
    };
  }
}

class VariationDiscount {
  final String salePrice;

  VariationDiscount({required this.salePrice});

  factory VariationDiscount.fromJson(Map<String, dynamic> json) {
    return VariationDiscount(salePrice: json["sale_price"] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {"sale_price": salePrice};
  }
}

class VariationAttribute {
  final String id;
  final String name;
  final String type;
  final List<VariationOption> options;

  VariationAttribute({
    required this.id,
    required this.name,
    required this.type,
    required this.options,
  });

  factory VariationAttribute.fromJson(Map<String, dynamic> json) {
    return VariationAttribute(
      id: json["_id"],
      name: json["name"],
      type: json["type"],
      options: (json["options"] as List?)
              ?.map((option) => VariationOption.fromJson(option))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "type": type,
      "options": options.map((option) => option.toJson()).toList(),
    };
  }
}

class VariationOption {
  final String id;
  final String name;
  final String value;

  VariationOption({
    required this.id,
    required this.name,
    required this.value,
  });

  factory VariationOption.fromJson(Map<String, dynamic> json) {
    return VariationOption(
      id: json["_id"],
      name: json["name"],
      value: json["value"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "value": value,
    };
  }
}
