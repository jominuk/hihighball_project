$( function () {
    $('#trigger').click(function(e){
        e.preventDefault();
        $(this).toggleClass('active');
        $('#main-menu').toggleClass('active');
    });

    $(window).scroll(function() {
        var value = $(this).scrollTop();

        if(value >= 100) {$('header').addClass('changes');}
        else {$('header').removeClass('changes');}
    })
    
    $('#main-menu li').hover(function() {
        if ($(window).width() <= 1049) $(this).find('.sub-menu').stop().slideToggle();
    });
    
     $(window).scroll(function(){
        var value = $(this).scrollTop();
        var width = $(this).width();
        if (width >= 1450 ) {
            if (value >= 1100) {
                $('.rc-txt1').animate({ left:300, opacity:1 }, 1000);
            }
            if (value >= 1250) {
                $('.rc-bg1').animate({ right:200, opacity:1 }, 1200);
            } 
            if (value >= 1700) {
                $('.rc-txt2').animate({ right:300, opacity:1 }, 1000);
            } 
            if (value >= 1850) {
                $('.rc-bg2').animate({ left:200, opacity:1 }, 1200);
            }
            if (value >= 2300) {
                $('.rc-txt3').animate({ left:300, opacity:1 }, 1000);
            }
            if (value >= 2450) {
                $('.rc-bg3').animate({ right:200, opacity:1 }, 1200);
            } 
        }

        if (width >= 1036 && width <= 1449 ) {
            if (value >= 1000) {
                $('.rc-txt1').animate({ left:150, opacity:1 }, 1000);
            }
            if (value >= 1150) {
                $('.rc-bg1').animate({ right:100, opacity:1 }, 1200);
            } 
            if (value >= 1500) {
                $('.rc-txt2').animate({ right:150, opacity:1 }, 1000);
            } 
            if (value >= 1650) {
                $('.rc-bg2').animate({ left:100, opacity:1 }, 1200);
            }
            if (value >= 2000) {
                $('.rc-txt3').animate({ left:150, opacity:1 }, 1000);
            }
            if (value >= 2150) {
                $('.rc-bg3').animate({ right:100, opacity:1 }, 1200);
            } 
        }
    });
    
    
    
});

function previewImage(input) {
	var preview = document.getElementById('imagePreview');
	preview.innerHTML = '';	 	
        

    if (input.files && input.files[0]) {
    	var reader = new FileReader();

        reader.onload = function (e) {
			var img = document.createElement('img');
            img.src = e.target.result;
            preview.appendChild(img);
        }

        reader.readAsDataURL(input.files[0]);
     }
}