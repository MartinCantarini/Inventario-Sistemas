$("#new_printer").validate({
  //error place
  errorPlacement: function (error, element) {
    //error.insertAfter(element.append('&nbsp;&nbsp;'));
    element.after(error).after('&nbsp;')
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
  "printer[brand_id]":{
    required: true
  },
  "printer[modelo]":{
    required: true,
    maxlength: 30,
    minlength: 3,
  },
  "printer[functions_id]":{
    required: true
  }
  },
  // error messages
  messages: {
    "printer[brand_id]":{
      required: " El campo 'MARCA' es obligatorio."
    },
    "printer[modelo]":{
      required: " El campo 'MODELO' es obligatorio."
    },
    "printer[functions_id]":{
      required: " El campo 'FUNCION' es obligatorio."
    }

  }
});
$(".edit_printer").validate({
  //error place
  errorPlacement: function (error, element) {
    //error.insertAfter(element.append('&nbsp;&nbsp;'));
    element.after(error).after('&nbsp;')
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
  "printer[brand_id]":{
    required: true
  },
  "printer[modelo]":{
    required: true,
    maxlength: 30,
    minlength: 3,
  },
  "printer[functions_id]":{
    required: true
  }
  },
  // error messages
  messages: {
    "printer[brand_id]":{
      required: " El campo 'MARCA' es obligatorio."
    },
    "printer[modelo]":{
      required: " El campo 'MODELO' es obligatorio."
    },
    "printer[functions_id]":{
      required: " El campo 'FUNCION' es obligatorio."
    }

  }
});