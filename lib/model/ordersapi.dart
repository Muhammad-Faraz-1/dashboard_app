class Order {
  final String? id;
  final int? uid;
  final String? status;
  final String? currency;
  final Billing? billing;
  final String? paymentMethod;
  final List<OrderItem>? items;
  final double? subTotal;
  final double? discount;
  final double? tax;
  final int? cartProtected;
  final double? cartProtectionPrice;
  final int? professionalAssembled; 
  final double? professionalAssembledPrice;
  final int? isShipping;
  final double? shippingCost;
  final double? total;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Order({
     this.id,
     this.uid,
     this.status,
     this.currency,
     this.billing,
     this.paymentMethod,
     this.items,
     this.subTotal,
     this.discount,
     this.tax,
     this.cartProtected,
     this.cartProtectionPrice,
     this.professionalAssembled,
     this.professionalAssembledPrice,
     this.isShipping,
     this.shippingCost,
     this.total,
     this.createdAt,
     this.updatedAt,
  });

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        id: json["_id"],
        uid: json["uid"],
        status: json["status"],
        currency: json["currency"],
        billing: Billing.fromMap(json["billing"]),
        paymentMethod: json["payment_method"],
        items:
            List<OrderItem>.from(json["items"].map((x) => OrderItem.fromMap(x))),
        subTotal: (json["sub_total"] as num).toDouble(),
        discount: (json["discount"] as num).toDouble(),
        tax: (json["tax"] as num).toDouble(),
        cartProtected: json["cart_protected"],
        cartProtectionPrice: (json["cart_protection_price"] as num).toDouble(),
        isShipping: json["is_shipping"],
        shippingCost: (json["shipping_cost"] as num).toDouble(),
        total: (json["total"] as num).toDouble(),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        professionalAssembled:json["professional_assembled"],
        professionalAssembledPrice: (json["professional_assembled_price"] as num?)?.toDouble() ?? 0.0,

      );
}

class Billing {
  final String firstName;
  final String lastName;
  final String address1;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String email;
  final String phone;
  final String id;

  Billing({
    required this.firstName,
    required this.lastName,
    required this.address1,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.email,
    required this.phone,
    required this.id,
  });

  factory Billing.fromMap(Map<String, dynamic> json) => Billing(
        firstName: json["first_name"],
        lastName: json["last_name"],
        address1: json["address_1"],
        city: json["city"],
        state: json["state"],
        postalCode: json["postal_code"],
        country: json["country"],
        email: json["email"],
        phone: json["phone"],
        id: json["_id"],
      );
}

class OrderItem {
  final List<dynamic> attributes;
  final String name;
  final int productId;
  final int quantity;
  final double subTotal;
  final int isProtected;
  final double protectedPrice;
  final double total;
  final String sku;
  final String image;
  final String id;

  OrderItem({
    required this.attributes,
    required this.name,
    required this.productId,
    required this.quantity,
    required this.subTotal,
    required this.isProtected,
    required this.protectedPrice,
    required this.total,
    required this.sku,
    required this.image,
    required this.id,
  });

  factory OrderItem.fromMap(Map<String, dynamic> json) => OrderItem(
        attributes: List<dynamic>.from(json["attributes"]),
        name: json["name"],
        productId: json["product_id"],
        quantity: json["quantity"],
        subTotal: (json["sub_total"] as num).toDouble(),
        isProtected: json["is_protected"],
        protectedPrice: (json["protected_price"] as num).toDouble(),
        total: (json["total"] as num).toDouble(),
        sku: json["sku"],
        image: json["image"],
        id: json["_id"],
      );
}