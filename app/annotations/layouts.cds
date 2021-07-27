using AdminService from '../../srv/admin-service';

//
// annotatios that control the fiori layout
//

@odata.draft.enabled
annotate AdminService.Category with @UI : {
    HeaderInfo               : {
        TypeName       : '{i18n>Category}',
        TypeNamePlural : '{i18n>Categories}',
        Title          : {Value : name}
    },
    PresentationVariant      : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : name,
            Descending : true
        }]
    },
    SelectionFields          : [name],
    LineItem                 : [
        {Value : name},
        {Value : description},
    ],
    Facets                   : [
        {
            $Type  : 'UI.CollectionFacet',
            Label  : '{i18n>Category}',
            ID     : 'category',
            Facets : [{ // category details
                $Type  : 'UI.ReferenceFacet',
                ID     : 'categoryData',
                Target : '@UI.FieldGroup#CategoryData',
                Label  : '{i18n>Category}'
            }],
        },
        { // material list
            $Type  : 'UI.ReferenceFacet',
            Target : 'to_material/@UI.LineItem',
            Label  : '{i18n>Materials}'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>Admin}',
            Target : '@UI.FieldGroup#Admin'
        },
    ],
    FieldGroup #CategoryData : {Data : [
        {Value : name},
        {Value : description}
    ]},
    FieldGroup #Admin        : {Data : [
        {Value : createdBy},
        {Value : createdAt},
        {Value : modifiedBy},
        {Value : modifiedAt}
    ]}
};

// @odata.draft.enabled
annotate AdminService.Material with @(UI : {
    Identification                 : [{Value : ID}],
    HeaderInfo                     : {
        TypeName       : '{i18n>Material}',
        TypeNamePlural : '{i18n>Materials}',
        Title          : {Value : name}
    },
    PresentationVariant            : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem']
    },
    SelectionFields                : [name],
    LineItem                       : [
        {Value : name},
        {Value : description},
        {
            $Type  : 'UI.DataFieldForAnnotation',
            Label  : '{i18n>Supplier}',
            Target : 'supplier/@Communication.Contact'
        },
        {Value : stock},
        {
            Value : status_code,
            Label : '{i18n>Status}'
        },
        {
            Value : taxType_code,
            Label : '{i18n>TaxType}'
        },
        {Value : tax},
        {Value : discount},
        {Value : price},
    ],
    HeaderFacets                   : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#GeneralInformation',
        Label  : '{i18n>GeneralInformation}'
    }],
    Facets                         : [{
        $Type  : 'UI.CollectionFacet',
        Label  : '{i18n>Material}',
        ID     : 'material',
        Facets : [{ // material details
            $Type  : 'UI.ReferenceFacet',
            ID     : 'materaialData',
            Target : '@UI.FieldGroup#MaterailData',
            Label  : '{i18n>Material}'
        }]
    }],
    FieldGroup #GeneralInformation : {Data : [
        {Value : category.name},
        {
            $Type  : 'UI.DataFieldForAnnotation',
            Label  : '{i18n>Supplier}',
            Target : 'supplier/@Communication.Contact'
        }
    ]},
    FieldGroup #MaterailData       : {Data : [
        {Value : name},
        {Value : description},
        {
            Value : category.name,
            Label : '{i18n>Category}'
        },
        {
            Value : supplier.name,
            Label : '{i18n>Supplier}'
        },
        {Value : stock},
        {
            Value : status_code,
            Label : '{i18n>Status}'
        },
        {
            Value : taxType_code,
            Label : '{i18n>TaxType}'
        },
        {Value : tax},
        {Value : discount},
        {Value : price}
    ]}
});

@odata.draft.enabled
annotate AdminService.Supplier with @UI : {
    HeaderInfo               : {
        TypeName       : '{i18n>Supplier}',
        TypeNamePlural : '{i18n>Suppliers}',
        Title          : {Value : name}
    },
    PresentationVariant      : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : name,
            Descending : true
        }]
    },
    SelectionFields          : [name],
    LineItem                 : [
        {Value : name},
        {Value : street},
        {Value : city},
        {Value : state},
        {Value : postalCode},
        {
            Value                : countryCode_code,
            Label                : '{i18n>Country}',
            ![@Core.Description] : 'countryCode_name'
        },
        {Value : email},
        {Value : phone},
        {Value : fax},
    ],
    Facets                   : [
        {
            $Type  : 'UI.CollectionFacet',
            Label  : '{i18n>Supplier}',
            ID     : 'supplier',
            Facets : [{ // category details
                $Type  : 'UI.ReferenceFacet',
                ID     : 'supplierData',
                Target : '@UI.FieldGroup#SupplierData',
                Label  : '{i18n>Supplier}'
            }],
        },
        { // material list
            $Type  : 'UI.ReferenceFacet',
            Target : 'to_material/@UI.LineItem',
            Label  : '{i18n>Materials}'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>Admin}',
            Target : '@UI.FieldGroup#Admin'
        },
    ],
    FieldGroup #SupplierData : {Data : [
        {Value : name},
        {Value : street},
        {Value : city},
        {Value : state},
        {Value : postalCode},
        {
            Value                : countryCode_code,
            Label                : '{i18n>Country}',
            ![@Core.Description] : 'countryCode_name',
        },
        {Value : email},
        {Value : phone},
        {Value : fax},
    ]},
    FieldGroup #Admin        : {Data : [
        {Value : createdBy},
        {Value : createdAt},
        {Value : modifiedBy},
        {Value : modifiedAt}
    ]}
};
