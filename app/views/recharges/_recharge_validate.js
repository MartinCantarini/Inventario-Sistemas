$("#new_recharge").validate({
  //error place
  errorPlacement: function (error, element) {
    //error.insertAfter(element.append('&nbsp;&nbsp;'));
    element.after(error).after('&nbsp;')
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
  "recharge[cartridge_id]":{
    required: true
  },
  "recharge[lugar_recarga]":{
    required: true
  },
  "recharge[fecha_recarga_inicio]":{
    required: true
  }
  },
  // error messages
  messages: {
    "recharge[cartridge_id]":{
      required: " El campo 'ID CARTUCHO' es obligatorio."
    },
    "recharge[lugar_recarga]":{
      required: " El campo 'LUGAR DE RECARGA' es obligatorio."
    },
    "recharge[fecha_recarga_inicio]":{
      required: " El campo 'FECHA DE RECARGA' es obligatorio."
    }
  }
});
$(".edit_recharge").validate({
  //error place
  errorPlacement: function (error, element) {
    //error.insertAfter(element.append('&nbsp;&nbsp;'));
    element.after(error).after('&nbsp;')
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
  "recharge[cartridge_id]":{
    required: true
  },
  "recharge[lugar_recarga]":{
    required: true
  },
  "recharge[fecha_recarga_inicio]":{
    required: true
  }
  },
  // error messages
  messages: {
    "recharge[cartridge_id]":{
      required: " El campo 'ID CARTUCHO' es obligatorio."
    },
    "recharge[lugar_recarga]":{
      required: " El campo 'LUGAR DE RECARGA' es obligatorio."
    },
    "recharge[fecha_recarga_inicio]":{
      required: " El campo 'FECHA DE RECARGA' es obligatorio."
    }
  }
});