using {sap.cap.billing as schema} from '../../db/schema';

/**
 * Annotations for field level control
 */


annotate schema.Supplier with @(Communication : {Contact : {
    fn    : name,
    role  : '{i18n>Supplier}',
    photo : 'sap-icon://supplier',
    email : [{
        type    : #work,
        address : email
    }],
    tel   : [
        {
            type : #work,
            uri  : phone
        },
        {
            type : #fax,
            uri  : fax
        }
    ]
}});
