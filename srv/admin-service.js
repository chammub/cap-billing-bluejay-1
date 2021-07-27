const cds = require("@sap/cds");

module.exports = cds.service.impl(function () {
  // this.before("NEW", "Category", genid);
  // this.before("NEW", "Material", genid);
  /**
   * Fill in primary keys for new Category.
   * Note: In contrast to Bookings and BookingSupplements that has to happen
   * upon SAVE, as multiple users could create new Travels concurrently.
   */
  // this.before("CREATE", "Category", async (req) => {
  //   const { maxID } = await SELECT.one`max(ID) as maxID`.from(req.target);
  //   req.data.ID = maxID + 1;
  // });
  /**
   * Fill in defaults for new Material when editing Category.
   */
  // this.before("NEW", "Material", async (req) => {
  //   const { maxID } = await SELECT.one`max(ID) as maxID`
  //     .from(Material.drafts)
  //     .where({ to_materials_ID });
  //   req.data.ID = maxID + 1;
  // });
  /**
   * Fill in defaults for new BookingSupplements when editing Travels.
   */
  // this.before ('NEW', 'BookingSupplement', async (req) => {
  //   const { to_Booking_BookingUUID } = req.data
  //   const { maxID } = await SELECT.one `max(BookingSupplementID) as maxID` .from (BookingSupplement.drafts) .where ({to_Booking_BookingUUID})
  //   req.data.BookingSupplementID = maxID + 1
  // })
});

/** Generate primary keys for target entity in request */
// async function genid(req) {
//   const { ID } = await cds
//     .tx(req)
//     .run(SELECT.one.from(req.target).columns("max(ID) as ID"));
//   req.data.ID = ID - (ID % 100) + 100 + 1;
// }
