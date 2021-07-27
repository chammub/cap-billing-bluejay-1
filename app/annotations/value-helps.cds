using {sap.cap.billing as my} from '../../db/schema';

//
// annotations for value helps
//

annotate my.Category {
    name @Common.ValueList : {
        CollectionPath  : 'Category',
        Label           : '',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : name,
                ValueListProperty : 'name'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description'
            }
        ],
        SearchSupported : true
    };
}

annotate my.Material {

    @Measures.ISOCurrency : currencyCode_code
    tax;

    @Measures.ISOCurrency : currencyCode_code
    discount;

    @Measures.ISOCurrency : currencyCode_code
    price;

    taxType      @Common :  {
        ValueListWithFixedValues : true,
        ValueList                : {
            CollectionPath : 'VH_TaxType',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : taxType_code,
                    ValueListProperty : 'code'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'descr'
                }
            ]
        }
    };

    status       @Common :  {
        ValueListWithFixedValues : true,
        ValueList                : {
            CollectionPath : 'VH_MaterialStatus',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status_code,
                    ValueListProperty : 'code'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'descr'
                }
            ]
        }
    };

    supplier_ID  @Common :  {
        ValueListWithFixedValues : true,
        ValueList                : {
            CollectionPath : 'Supplier',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : supplier_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ]
        }
    };

    currencyCode @Common :  {
        ValueListWithFixedValues : false,
        ValueList                : {
            CollectionPath  : 'Currencies',
            Label           : '',
            Parameters      : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : currencyCode_code,
                    ValueListProperty : 'code'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'descr'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'symbol'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'minor'
                }
            ],
            SearchSupported : true
        }
    };
}

annotate my.Supplier {
    name        @Common : {
        ValueListWithFixedValues : false,
        ValueList                : {
            CollectionPath  : 'Supplier',
            Label           : '',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : name,
                ValueListProperty : 'name'
            }],
            SearchSupported : true
        }
    };

    countryCode @Common : {
        ValueListWithFixedValues : true,
        ValueList                : {
            CollectionPath : 'Countries',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : countryCode_code,
                    ValueListProperty : 'code'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'descr'
                }
            ]
        }
    };
}
