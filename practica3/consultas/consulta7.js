db.createView(
    "oferta_unizar_con_notas",
    "notas_corte_unizar",[
    
    {
      $lookup:{
            from : "oferta_unizar",
            localField : "LOCALIDAD",
            localField : "ESTUDIO",
            localField : "CENTRO",
            foreignField : "LOCALIDAD",
            foreignField : "ESTUDIO",
            foreignField : "CENTRO",
            as : "oferta"}  
    },
    {
   $project : {"oferta._id" : 0, "_id":0, "oferta.CURSO_ACADEMICO" : 0,
               "oferta.LOCALIDAD" : 0,"oferta.CENTRO" : 0,
               "oferta.ESTUDIO" : 0, "FECHA_ACTUALIZACION" : 0,
               "oferta.FECHA_ACTUALIZACION" : 0,
               "oferta.TIPO_ESTUDIO" : 0,
               "PRELA_CONVO_NOTA_DEF" : 0}     
   }]);
    



db.oferta_unizar_con_notas.find({});
