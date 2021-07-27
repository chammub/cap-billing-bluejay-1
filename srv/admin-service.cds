using {sap.cap.billing as my} from '../db/schema';

service AdminService @(
  path     : '/admin',
  requires : 'authenticated-user'
) {
  entity Category as projection on my.Category;
  entity Material as projection on my.Material;
  entity Orders   as projection on my.Orders;
  entity Customer as projection on my.Customer;
  entity Supplier as projection on my.Supplier;
  entity State    as projection on my.State;
}
