db.createView(
        "PeliculasMusicalView",
        "films",
        [
        {
         $lookup : { from: "customers",
                     localField: "Title",
                     foreignField: "Rentals.Film Title",
                     as : "Customers"}
         },{
             $match : {"Category" : "Music"}
         },
         {
             $project : { "_id" : 0,
                          "Actors" : 0,
                          "Category" : 0,
                          "Description" : 0,
                          "Length" : 0,
                          "Rating" : 0,
                          "Rental Duration" : 0,
                          "Replacement Cost" : 0,
                          "Special Features" : 0,
                          "Customers._id" : 0,
                          "Customers.Address" : 0,
                          "Customers.City" : 0,
                          "Customers.District" : 0,
                          "Customers.Country" : 0,
                          "Customers.Phone" : 0,
                          "Customers.Rentals" : 0
                          }
         }]);
         
         
         
         db.PeliculasMusicalView.find();
