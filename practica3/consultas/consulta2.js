db.customers.aggregate([
    {
    $lookup:{from: "films",
             localField: "Rentals.filmId",
             foreignField: "_id",
             as:"Info_Peliculas"}
    },
    {
    $match:{$and:[{"Last Name": "HARRISON"},{"First Name":"WENDY"}]}
    },
    {
    $project: {_id: 0, Address: 0, City: 0, Country: 0, District: 0, "First Name": 0, "Last Name": 0, Phone: 0, Rentals: 0,
               "Info_Peliculas._id": 0, "Info_Peliculas.Actors": 0, "Info_Peliculas.Description": 0,
               "Info_Peliculas.Rating": 0, "Info_Peliculas.Rental Duration": 0, "Info_Peliculas.Replacement Cost": 0,
               "Info_Peliculas.Special Features": 0}
    }
    ]).pretty();
