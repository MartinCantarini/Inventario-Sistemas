$("#new_department").validate({
  //error place
  errorPlacement: function (error, element) {
    //error.insertAfter(element.append('&nbsp;&nbsp;'));
    element.after(error).after('&nbsp;')
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
  "department[nombre]":{
    required: true
  }
  },
  // error messages
  messages: {
    "department[nombre]":{
      required: " El campo 'NOMBRE' es obligatorio."
    }
  }
});
$(".edit_department").validate({
  //error place
  errorPlacement: function (error, element) {
    //error.insertAfter(element.append('&nbsp;&nbsp;'));
    element.after(error).after('&nbsp;')
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
  "department[nombre]":{
    required: true
  }
  },
  // error messages
  messages: {
    "department[nombre]":{
      required: " El campo 'NOMBRE' es obligatorio."
    }
  }
});