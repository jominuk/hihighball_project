$( function() {

      $('#id').on("input", function() {
          var idValue = $(this).val();
          var idInvalid = /[^a-zA-Z0-9^]/g.test(idValue);

          $("#warning").toggle(idInvalid);
      });

      $('#pwd-check').on("input", function() {
          var pwdValue = $(this).val();
          var rule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#%^*-])[A-Za-z0-9!@#%^*-]{8,15}$/;
          var pwdInvalid = !rule.test(pwdValue);

          $('#warning2').toggle(pwdInvalid);
      });

      $("#repwd-check").on("input", function() {
          var pwdInput = $("#pwd-check").val();
          var repwdInput = $(this).val();

          if(pwdInput !== repwdInput) {
              $('#warning3').show();
          }else {
              $('#warning3').hide();
          }
      })

      $("#tel-check").on("input", function() {
		  var pNreg = /^\d{11}$/;
		  var repwdInput = $(this).val();
		  
   	      var pwdInvalid = !pNreg.test(repwdInput);

          $('#warning5').toggle(pwdInvalid);
	  })
      // 

      $('#email-check').on('input', function() {
          var emailInput = $(this).val()
          var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/
          var emailInvalid = !emailRule.test(emailInput);

          $('#warning4').toggle(emailInvalid);
      })
  });