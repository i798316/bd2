db.films.aggregate([
	{
		$match:{$and:[{"Actors.First name" : "SANDRA"},{"Actors.Last name" : "PECK"}]}
  },
  {
  	$group:{_id: "$Rating", "count":{$sum : 1}}
  },
  {
  	$project:{_id:0, Rating:"$_id", "Mas Repetido":"$count"}  
  },
  {
  	$sort:{"Mas Repetido":-1}
  },
  	$limit: 1
  }
  ]);
