$("#new_order").validate({
  //error place
  errorPlacement: function (error, element) {
    //error.insertAfter(element.append('&nbsp;&nbsp;'));
    element.after(error).after('&nbsp;')
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
  "order[fecha]":{
    required: true
  },
  "order[office_id]":{
    required: true
  }
  },
  // error messages
  messages: {
    "order[fecha]":{
      required: " El campo 'FECHA' es obligatorio."
    },
    "order[office_id]":{
      required: " El campo 'OFICINA' es obligatorio."
    }
  }
});
$(".edit_order").validate({
  //error place
  errorPlacement: function (error, element) {
    //error.insertAfter(element.append('&nbsp;&nbsp;'));
    element.after(error).after('&nbsp;')
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
  "order[fecha]":{
    required: true
  },
  "order[office_id]":{
    required: true
  }
  },
  // error messages
  messages: {
    "order[fecha]":{
      required: " El campo 'FECHA' es obligatorio."
    },
    "order[office_id]":{
      required: " El campo 'OFICINA' es obligatorio."
    }
  }
});
