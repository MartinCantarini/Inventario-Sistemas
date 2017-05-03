$("#new_function").validate({
  //error place
  errorPlacement: function (error, element) {
    //error.insertAfter(element.append('&nbsp;&nbsp;'));
    element.after(error).after('&nbsp;')
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
  "function[funcion]":{
    required: true
  }
  },
  // error messages
  messages: {
    "function[funcion]":{
      required: " El campo 'FUNCION' es obligatorio."
    }
  }
});