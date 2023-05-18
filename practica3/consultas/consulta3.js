db.films.aggregate([
    { $match: { "Category": "Music" } 
    },
    { $lookup : {from: "customers",
                   localField: "_id",
                   foreignField: "Rentals.filmId",
                   as : "Info_Peliculas"}
   },
   {
       $project: { "_id" : 0, "Title" : 1, "Count" : { $size : "$Info_Peliculas.Rentals" }}
    },
    {
       $sort : {"Count" : -1}
    
    },
    {
        $limit : 8
    }].pretty()
