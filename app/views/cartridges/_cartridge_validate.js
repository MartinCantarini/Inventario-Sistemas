$("#new_cartridge").validate({
  //error place
  errorPlacement: function (error, element) {
    //error.insertAfter(element.append('&nbsp;&nbsp;'));
    element.after(error).after('&nbsp;')
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
  "cartridge[brand_id]":{
    required: true
  },
  "cartridge[model_id]":{
    required: true
  },
  "cartridge[purchase_id]":{
    required: true
  },
  "cartridge[estado]":{
    required: true
  },
  "cartridge[color]":{
    required: true
  }
  },
  // error messages
  messages: {
    "cartridge[brand_id]":{
      required: " El campo 'MARCA' es obligatorio."
    },
    "cartridge[model_id]":{
      required: " El campo 'MODELO' es obligatorio."
    },
    "cartridge[purchase_id]":{
      required: " El campo 'SE OBTUVO EN LA COMPRA' es obligatorio."
    },
    "cartridge[estado]":{
      required: " El campo 'ESTADO' es obligatorio."
    },
    "cartridge[color]":{
      required: " El campo 'COLOR' es obligatorio."
    }
  }
});
$(".edit_cartridge").validate({
  //error place
  errorPlacement: function (error, element) {
    //error.insertAfter(element.append('&nbsp;&nbsp;'));
    element.after(error).after('&nbsp;')
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
  "cartridge[brand_id]":{
    required: true
  },
  "cartridge[model_id]":{
    required: true
  },
  "cartridge[purchase_id]":{
    required: true
  },
  "cartridge[estado]":{
    required: true
  },
  "cartridge[color]":{
    required: true
  }
  },
  // error messages
  messages: {
    "cartridge[brand_id]":{
      required: " El campo 'MARCA' es obligatorio."
    },
    "cartridge[model_id]":{
      required: " El campo 'MODELO' es obligatorio."
    },
    "cartridge[purchase_id]":{
      required: " El campo 'SE OBTUVO EN LA COMPRA' es obligatorio."
    },
    "cartridge[fecha_estado]":{
      required: " El campo 'FECHA DE ESTADO' es obligatorio."
    },

    "cartridge[color]":{
      required: " El campo 'COLOR' es obligatorio."
    }
  }
});