using {sap.cap.billing as schema} from '../../db/schema';

//
// annotations that control rendering of fields and labels
//

annotate schema.Category with @title : '{i18n>Category}' {
    ID          @UI.Hidden;
    name        @title               : '{i18n>Name}';
    description @title               : '{i18n>Description}';
}

annotate schema.Material with @title : '{i18n>Product}' {
    ID          @UI.Hidden;
    name        @title               : '{i18n>Name}';
    description @title               : '{i18n>Description}';
    stock       @title               : '{i18n>Stock}';
    tax         @title               : '{i18n>Tax}';
    discount    @title               : '{i18n>Discount}';
    price       @title               : '{i18n>Price}';
    taxType     @title               : '{i18n>TaxType}';
    status      @title               : '{i18n>Status}';
}

annotate schema.Supplier with @title : '{i18n>Supplier}' {
    ID         @UI.Hidden;
    name       @title                : '{i18n>Name}';
    street     @title                : '{i18n>Street}';
    city       @title                : '{i18n>City}';
    state      @title                : '{i18n>State}';
    postalCode @title                : '{i18n>PostalCode}';
    email      @title                : '{i18n>Email}';
    phone      @title                : '{i18n>Phone}';
    fax        @title                : '{i18n>Fax}';
}
