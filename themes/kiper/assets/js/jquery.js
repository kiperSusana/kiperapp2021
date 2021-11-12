$(function(){
  $('.cuadro_dialogo').hide();
  $('.cuadro_dialogo').hide();
		$('.globo').click(function () {
	// body... 
			$('.globo').hide(400);
			$('.cuadro_dialogo').show(400);

		})
		$('.cerrar').click(function () {
	// body... 
			$('.globo').show(400);
			$('.cuadro_dialogo').hide(0);

		});
    $('.slidePlanes').slick({
      centerMode: true,
      centerPadding: '60px',
      slidesToShow: 3,
      responsive: [
        {
          breakpoint: 992,
          settings: {
            arrows: false,
            centerMode: true,
            centerPadding: '40px',
            slidesToShow: 2
          }
        },
        {
          breakpoint: 480,
          settings: {
            arrows: false,
            centerMode: true,
            centerPadding: '40px',
            slidesToShow: 1
          }
        }
      ]
    });
    $('[data-check-btn]:checked + label').addClass('planesct__link--select');
    $('[data-check-btn]').each(function(){
      var idCh = $(this).attr('id');
      // console.log(idCh);
      $('#'+idCh).click(function() {
        $('[data-check-btn] + label').removeClass('planesct__link--select');
        if(this.checked) {
          $(this).next().addClass('planesct__link--select');
        }
      });
    });
    // $('#envioDatos').click(function (e) {
    //     e.preventDefault();
    //     var form = $("#form_contacto");
    //     var url = form.attr('action');
    //   var data = form.serialize();
    //   console.log("hola");
    //   console.log(url);
    //   console.log(data);
    //     $.ajax({
    //         type: 'POST',
    //         url: url,
    //         data: data,
    //         dataType: 'json',
    //         success: function (json) {
    //       console.log(json);
    //     },
    //     error: function(json){
    //       var error = '';
    
    //       console.log("error");
    //       console.log(json);
    //     }
    //     })
    // });

  // Formulario Validate
  $("#form_contacto").validate({
    errorElement: 'div',
    errorClass: 'error-line',
    rules: {
      nombre: "required",
      email: {
        required: true,
        email: true,
      },
      telefono: {
        required: true,
        number: true,
      },
      negocio: "required",
      mensaje: "required",
    },
    messages: {
      nombre: '<i class="fa fa-exclamation-triangle"></i>',
      email: {
        required: '<i class="fa fa-exclamation-triangle"></i>',
        email: '<i class="fa fa-exclamation-triangle"></i>',
      },
      telefono: {
        required: '<i class="fa fa-exclamation-triangle"></i>',
        number: '<i class="fa fa-exclamation-triangle"></i>',
      },
      negocio: '<i class="fa fa-exclamation-triangle"></i>',
      mensaje: '<i class="fa fa-exclamation-triangle"></i>',
    },
    submitHandler: function(form) {
      var form = $("#form_contacto");
      var url = form.attr('action');
      var data = form.serialize();
      console.log("hola");
      console.log(url);
      console.log(data);
      $.ajax({
        type: 'POST',
        url: url,
        data: data,
        dataType: 'json',
        success: function (json) {
          console.log(json);
        },
        error: function(json){
          var error = '';
    
          console.log("error");
          console.log(json);
        }
      });
    }
  });
  // Wow Animaciones
  wowData();
});

function wowData() {
  var wow = new WOW({
    boxClass:     'wow',      // default
    animateClass: 'animated', // default
    offset:       0,          // default
    mobile:       false,       // default
    live:         true        // default
  })
  setTimeout(function() {
    wow.init();
  }, 1000);
}






