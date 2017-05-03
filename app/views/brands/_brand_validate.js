$("#new_brand").validate({
  //error place
  errorPlacement: function (error, element) {
    //error.insertAfter(element.append('&nbsp;&nbsp;'));
    element.after(error).after('&nbsp;')
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
  "brand[nombre]":{
    required: true
  }
  },
  // error messages
  messages: {
    "brand[nombre]":{
      required: " El campo 'NOMBRE' es obligatorio."
    }
  }
});
$(".edit_brand").validate({
  //error place
  errorPlacement: function (error, element) {
    //error.insertAfter(element.append('&nbsp;&nbsp;'));
    element.after(error).after('&nbsp;')
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
  "brand[nombre]":{
    required: true
  }
  },
  // error messages
  messages: {
    "brand[nombre]":{
      required: " El campo 'NOMBRE' es obligatorio."
    }
  }
});