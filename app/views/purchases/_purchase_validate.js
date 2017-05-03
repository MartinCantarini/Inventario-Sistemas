$("#new_purchase").validate({
  //error place
  errorPlacement: function (error, element) {
    //error.insertAfter(element.append('&nbsp;&nbsp;'));
    element.after(error).after('&nbsp;')
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
  "purchase[fecha]":{
    required: true
  },
  "purchase[lugar]":{
    required: true
  }
  },
  // error messages
  messages: {
    "purchase[fecha]":{
      required: " El campo 'FECHA' es obligatorio."
    },
    "purchase[lugar]":{
      required: " El campo 'LUGAR' es obligatorio."
    }
  }
});
$(".edit_purchase").validate({
  //error place
  errorPlacement: function (error, element) {
    //error.insertAfter(element.append('&nbsp;&nbsp;'));
    element.after(error).after('&nbsp;')
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
  "purchase[fecha]":{
    required: true
  },
  "purchase[lugar]":{
    required: true
  }
  },
  // error messages
  messages: {
    "purchase[fecha]":{
      required: " El campo 'FECHA' es obligatorio."
    },
    "purchase[lugar]":{
      required: " El campo 'LUGAR' es obligatorio."
    }
  }
});
