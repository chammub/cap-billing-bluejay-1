using {
    Currency,
    Country,
    managed,
    sap,
    cuid
} from '@sap/cds/common';

namespace sap.cap.billing;

//
// Category
//

entity Category : managed {
    key ID          : UUID;
        name        : String(100) not null @assert.unique;
        description : String(1000);

        // navigation
        to_material : Composition of many Material
                          on to_material.category = $self;
}

//
// Material
//

entity Material : managed {
    key ID           : UUID;
        name         : String(100) not null @assert.unique;
        description  : String(1000);
        stock        : Integer;
        taxType      : Composition of VH_TaxType;
        tax          : Decimal(10, 3);
        discount     : Decimal(10, 3);
        price        : Decimal(10, 3);
        currencyCode : Currency default 'INR';
        status       : Association to VH_MaterialStatus;
        // every material to mapped to single category, supplier
        category     : Association to Category;
        supplier     : Association to Supplier;
}

//
// Customer
//

entity Customer : managed {
    key ID           : UUID;
        firstName    : String(50);
        lastName     : String(50);
        doorNo       : String(50);
        street1      : String(100);
        street2      : String(100);
        street3      : String(100);
        city         : String(40) default 'Chittoor';
        state        : Association to State;
        postalCode   : String(10);
        countryCode  : Country default 'IN';
        phoneNumber  : String(30);
        eMailAddress : String(256);
}

//
// Orders
//

entity Orders : managed {
    key ID       : UUID;
        customer : Association to Customer;
        status   : Association to VH_OrderStatus; // Order_Status default 'InProgress';
        items    : Composition of many Order_Items;
}

aspect Order_Items {
    key material : Association to Material;
    quantity     : Integer;
}

//
// Supplier
//

entity Supplier : managed {
    key ID          : UUID;
        name        : String(100) not null @assert.unique;
        street      : String;
        city        : String;
        state       : String(2);
        postalCode  : String(5);
        countryCode : Country;
        email       : String;
        phone       : String;
        fax         : String;
        to_material : Association to Material
                          on to_material.supplier = $self;
}

//
// Code Lists
//

entity State : sap.common.CodeList {
    key code        : String(2);
    key countryCode : Country;
}

entity VH_TaxType : sap.common.CodeList {
    key code : String(2);
}

entity VH_PaymentMode : sap.common.CodeList {
    key code : String(3);
}

entity VH_OrderStatus : sap.common.CodeList {
    key code : String(4);
}

entity VH_MaterialStatus : sap.common.CodeList {
    key code : String(4);
}
