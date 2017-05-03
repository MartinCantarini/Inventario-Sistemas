$("#new_office").validate({
  //error place
  errorPlacement: function (error, element) {
    //error.insertAfter(element.append('&nbsp;&nbsp;'));
    element.after(error).after('&nbsp;')
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
  "office[direction_id]":{
    required: true
  },
  "office[department_id]":{
    required: true
  },
  "office[nombre_encargado]":{
    required: true
  }
  },
  // error messages
  messages: {
    "office[direction_id]":{
      required: " El campo 'DIRECCIÓN' es obligatorio."
    },
    "office[department_id]":{
      required: " El campo 'DEPARTAMENTO' es obligatorio."
    },
    "office[nombre_encargado]":{
      required: " El campo 'PERSONA A CARGO' es obligatorio."
    }
  }
});
$(".edit_office").validate({
  //error place
  errorPlacement: function (error, element) {
    //error.insertAfter(element.append('&nbsp;&nbsp;'));
    element.after(error).after('&nbsp;')
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
  "office[direction_id]":{
    required: true
  },
  "office[department_id]":{
    required: true
  },
  "office[nombre_encargado]":{
    required: true
  }
  },
  // error messages
  messages: {
    "office[direction_id]":{
      required: " El campo 'DIRECCIÓN' es obligatorio."
    },
    "office[department_id]":{
      required: " El campo 'DEPARTAMENTO' es obligatorio."
    },
    "office[nombre_encargado]":{
      required: " El campo 'PERSONA A CARGO' es obligatorio."
    }
  }
});