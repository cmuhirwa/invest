(function($){
    "use strict";
    $(document).ready(function() {
		/* ---------------------------------------------
			Scripts initialization
		--------------------------------------------- */
		
        calculatorTopmenu(); /* calculator top menu*/
        calculatorVerticalmenu(); // calculator Vertical megamenu
		$(window).resize(function(){
			calculatorTopmenu(); /* calculator top menu*/
			calculatorVerticalmenu(); // calculator Vertical megamenu
		});

        
        /** HOME SLIDE**/
		var slider = $('#home-slider #contenhomeslider').bxSlider({
				nextText:'<i class="fa fa-angle-right"></i>',
				prevText:'<i class="fa fa-angle-left"></i>',
				auto: true,
			});

        /** OWL CAROUSEL**/
        $(".owl-carousel").each(function(index, el) {
          var config = $(this).data();
          config.navText = ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'];
          if($(this).hasClass('owl-style2')){
            config.animateOut="fadeOut";
            config.animateIn="fadeIn";    
          }
          $(this).owlCarousel(config);
        });
        
        /** COUNT DOWN **/
        if($('.countdown-lastest').length >0){
            var labels = ['Years', 'Months', 'Weeks', 'Days', 'Hrs', 'Mins', 'Secs'];
            var layout = '<span class="box-count"><span class="number">{dnn}</span> <span class="text">Days</span></span><span class="dot">:</span><span class="box-count"><span class="number">{hnn}</span> <span class="text">Hrs</span></span><span class="dot">:</span><span class="box-count"><span class="number">{mnn}</span> <span class="text">Mins</span></span><span class="dot">:</span><span class="box-count"><span class="number">{snn}</span> <span class="text">Secs</span></span>';
            $('.countdown-lastest').each(function() {
                var austDay = new Date($(this).data('y'),$(this).data('m') - 1,$(this).data('d'),$(this).data('h'),$(this).data('i'),$(this).data('s'));
                $(this).countdown({
                    until: austDay,
                    labels: labels, 
                    layout: layout
                });
            });
        }

        /** SEARCH SELECT CATEGORY **/
        $('.select-category').select2();
		
        if($('.form-category .box-category').length > 0){
            $('.form-category .box-category').select2({
                placeholder: 'All category',
            });
        }

        
        /** Mega menu Action **/
        $('.toggle-header').click(function() {
            $('#left-vertical').toggleClass('head-open');
            $(this).toggleClass('active');
        });
		
        // fixed menu toggle
        $('.menu-toggle, .menu-toggle-close').on('click', function () {
            if ($('.navigation').hasClass('opened')) {
                $('.navigation').removeClass('opened').addClass('closed');
            } else {
                $('.navigation').removeClass('closed').addClass('opened');
            }
        });

        if($(window).width() <= 767){
            $('.nav-menu .sub-menu').click(function(){
                $(this).closest('.nav-menu').find('.nav-tab').slideToggle("fast");
            });
        }
		
        // tree menu category
        $(document).on('click','.tree-menu li.has-child span',function(){
            $(this).closest('li').children('ul').slideToggle();
            $(this).closest('li').toggleClass('active');
            return false;
        })
		
        /* Open vertical menu */
        $(document).on('click','.box-vertical-megamenus .title',function(){
            $(this).toggleClass('active').parent().find('.vertical-menu-content').slideToggle();
        })

		var verticalMenu = $('.vertical-menu-content');
		var catplus =  verticalMenu.find('.vertical-menu-list > li:hidden');
		if(!catplus.length) verticalMenu.find('.all-category').hide();
		else verticalMenu.find('.all-category').click(function(event) {$(this).children().toggle(); catplus.slideToggle('slow');});
		
        $('.toggle-icon, .toggle-shop').click(function(){
            $(this).parent().toggleClass('toggle-open').find('.toggle-mobile').toggleClass('open');
        });

        // if($(window).width() < 992)
        $('.click-mobile').hover(function(){
            $(this).parent().find('.click-mobile-open').toggleClass('visibe');
        });
		
		/** Category Products Action **/
        // View grid list product 
        $(document).on('click','#view-product .view-as-grid',function(){
            $('#view-type').find('.product-list').addClass('grid').removeClass('list');
            $(this).addClass('selected');
            $('#view-product .view-as-list').removeClass('selected');
            return false;
        })
		
		
        // View list list product 
        $(document).on('click','#view-product .view-as-list',function(){
            $('#view-type').find('.product-list').addClass('list').removeClass('grid');
            $(this).addClass('selected');
            $('#view-product .view-as-grid').removeClass('selected');
            return false;
        })

		
		/* ---------------------------------------------
			popup-newsletter
		--------------------------------------------- */		
        var screen_width = parseInt($(window).width());
        if($('body').hasClass('home') && screen_width > 768){
            $.get('popup-newsletter.html', function(response){
                $.fancybox(response, {
                  // fancybox API options
                  autoScale: true,
                  fitToView: false,
                  autoSize: false,
                  closeClick: false,
                  openEffect: 'none',
                  closeEffect: 'none',
                  padding: 35,
                  width: 700,
                  height: 300,
                  beforeShow : function(){
                    $("#popup-newsletter").closest('.fancybox-wrap').addClass('fancybox-newsletter');
                  },
                });
            });
        }

		/* ---------------------------------------------
			Quick View
		--------------------------------------------- */	
        $(document).on('click','.action .quickview',function(){

            $.get('quick_view.html', function(response){
                $.fancybox(response, {
                    // fancybox API options
                    fitToView: false,
                    autoSize: false,
                    closeClick: false,
                    openEffect: true,
                    closeEffect: 'none',
                    width:720,
                    height: 'auto',
                    afterClose : function(){ $('.zoomContainer').remove();},
                    afterShow : function(){
						var productZoom = $('#product-zoom');
						if(productZoom.length >0) createZoom(productZoom);
						$('.block-quickview .product-img-thumb .bxslider').bxSlider({
							mode: 'vertical',
							slideMargin: 30,
							pager: false,
							minSlides: 3,
							maxSlides: 4,
							moveSlides: 1,
							responsive: true
						});
                    },
                }); // fancybox

            });
            return false;
        })
		
		/* ---------------------------------------------
			Detail Page View
		--------------------------------------------- */
        /* Zoom image */
		var productZoom = $('#product-zoom');
		if(productZoom.length >0) createZoom(productZoom);
		
       
        /* Product qty */
        $(document).on('click','.custom-qty .down',function(){
            var value = parseInt($(this).closest('.qty').find('.option-product-qty').val());
            value = value-1;
            if(value <=0) return false;
            $(this).closest('.qty').find('.option-product-qty').val(value);
            return false;
        })
        $(document).on('click','.custom-qty .up',function(){
            var value = parseInt($(this).closest('.qty').find('.option-product-qty').val());
            value = value + 1;
            if(value <=0) return false;
            $(this).closest('.qty').find('.option-product-qty').val(value);
            return false;
        })
		
		var detailThumb = $('.detail-page .product-img-thumb .bxslider');
        if(detailThumb.length >0){
            var screen_width = parseInt($(window).width());
            var min_slide;
            if(screen_width < 992 && screen_width > 767 || screen_width <= 480){
                min_slide = 2;
            }else{
                min_slide = 3;
            }
			var slideMargin = ($(this).hasClass('full-width')) ? 37: 30 ;
			detailThumb.bxSlider({
				mode: 'vertical',
				slideMargin: slideMargin,
				pager: false,
				minSlides: min_slide,
				maxSlides: 4,
				moveSlides: 1
			});
        }

        $(document).on('click','.product-img-thumb img',function(){
            var image = $(this).data('zoom-image');
            $(this).closest('.product-image').find('.product-full img').data('zoom-image',image).attr('src',image);
            var productZoom = $('#product-zoom');
			if(productZoom.length >0) createZoom(productZoom);
            return false;
        })

        /* Zoom Fancybox Lighbox */
		$(document).on('click','.product-image .product-full img',function(e){
            e.preventDefault();
            var currentImage = $(this).data('zoom-image');
            var gallerylist = [];
            var thumb = $('.product-img-thumb .item').not('.bx-clone');
            thumb.each(function(index, el) {
                var image = $(this).find('img');
                var img_src = image.data('zoom-image');       
                if(img_src == currentImage){
                    gallerylist.unshift({
                        href: ''+img_src+'',
                        title: image.attr("title"),
                        openEffect  : 'elastic'
                    }); 
                }else {
                    gallerylist.push({
                        href: ''+img_src+'',
                        title: image.attr("title"),
                        openEffect  : 'elastic'
                    });
                }       
            });
            $.fancybox(gallerylist);
        })
       
    });


	/* scroll top */ 
	$(document).on('click','.scroll_top',function(){
		$('body,html').animate({scrollTop:0},400);
		return false;
	})	
    /* ---------------------------------------------
     Scripts scroll
     --------------------------------------------- */
    $(window).scroll(function(){
        /* Show hide scrolltop button */
        if( $(window).scrollTop() == 0 ) {
            $('.scroll_top').stop(false,true).fadeOut(600);
        }else{
            $('.scroll_top').stop(false,true).fadeIn(600);
        }
        /* Main menu on top */
        var h = $(window).scrollTop();
        var h_vertical = $('.vertical-menu-content').height();
        var width = $(window).width();
        var scroll_h = $('#header').height();
        var min_width = $('#main-menu').width();
        var inherit_width = $('.inherit-width').innerWidth();
        if(width > 991){
            if( h > scroll_h + h_vertical){
                // fix top menu
                $('#nav-top-menu').addClass('nav-ontop').css({
                    'min-width': inherit_width+'px'
                });

                $('#header').find('.vertical-menu-content').hide();
            }else{
                $('#nav-top-menu').removeClass('nav-ontop').css({
                    'min-width': 'auto'
                });
                if($('body').hasClass('home')){
                    $('#nav-top-menu').find('.vertical-menu-content').removeAttr('style');
                    if(width > 1024){
                        $('#nav-top-menu').find('.vertical-menu-content').show();
                        $('.home #header').find('.vertical-menu-content').show();
                    }else{
                        $('#nav-top-menu').find('.vertical-menu-content').hide();
                    }
                     $('#nav-top-menu').find('.vertical-menu-content').removeAttr('style');
                }
            }
        }
    });


    /**==============================
    ***  All Function
    ===============================**/	
	function createZoom(productZoom)
	{
		$('.zoomContainer').remove();
		productZoom.elevateZoom({
			zoomType: "inner",
			cursor: "crosshair",
			zoomWindowFadeIn: 500,
			zoomWindowFadeOut: 500,
			gallery:'gallery_01'
		});
	}
	
    /**==============================
    ***  calculator width megamenu
    ===============================**/
    function calculatorTopmenu(){
        if($(window).width() >= 768){
            var main_menu_w = $('#main-menu .navbar').innerWidth();
            var inherit_width = $('.inherit-width').innerWidth();
            var inherit_custom_width = $('.inherit-custom-width').innerWidth();
            $("#main-menu ul.mega_dropdown").each(function(){
                var menu_width = $(this).innerWidth();
                var offset_left = $(this).position().left;
                if($(this).hasClass('page') && !$('#main-menu').hasClass('menu-index9') && $(window).width() > 991){
                    var t = main_menu_w - menu_width;
                    var offset_left_page = $(this).closest('.dropdown').position().left;
                    var element_width_page = $(this).closest('.dropdown').width();
                    if(t/2 + menu_width < offset_left_page + element_width_page){
                        $(this).css({
                            'left': offset_left_page + element_width_page - menu_width + 'px',
                        });
                    }else{
                        $(this).css({
                        'left': t/2 + 'px',
                        });
                    }
                }else{
                    if($('#main-menu').hasClass('menu-index9') && $(window).width() >= 992){
                        $(this).css({
                            'width': inherit_custom_width,
                            'left': '0'
                        });
                    }else{
                        $(this).css({
                            'width': inherit_width,
                            'left': '0'
                        });
                    }
                }
            });
        }

    }	

    function calculatorVerticalmenu(){
        var full_width = parseInt($('.container').innerWidth());
        var sub_width = parseInt($(".vertical-groups .mega-group").innerWidth());
        var menu_width = parseInt($('.vertical-menu-content').innerWidth());
        $('.vertical-menu-content').find('.vertical-dropdown-menu').each(function(){
            var isFull = $(this).hasClass('isFull');
            if(isFull){
                $(this).find('.vertical-groups').children('.mega-group').removeClass('width');
                $(this).width(full_width - menu_width);
            }else{
                var subIndex = $(this).find('.vertical-groups').children('.mega-group').length;
                $(this).width(subIndex*sub_width);
            }
        });
        var screen_height = parseInt($(window).height());
        var screen_width = parseInt($(window).width());
        
            $('.left-menu-content').find('.custom-dropdown-menu').each(function(){
                if(screen_width > 991){
                    if(screen_width < 1200){
                        $(this).width(screen_width - 300);
                    }else{
                        $(this).width(1000);
                    }
                }else{
                    $(this).css({
                        'width': 'auto',
                    });
                }
                var offset_head = parseInt($('#header').offset().top);
                var offset_top = parseInt($(this).parent().offset().top);
                var real_offset = offset_top - offset_head;
                var h_parent = parseInt($(this).parent().height());
                var temp = screen_height - real_offset - h_parent/2;
                var t = temp - $(this).height();
                if(t < 0){
                    var top = $(this).height() - temp - h_parent/2;
                    $(this).css('top', -top +'px');
                }else{
                    $(this).css('top', -$(this).height()/2+h_parent/2+'px');
                }
            });
    }

})(jQuery);
