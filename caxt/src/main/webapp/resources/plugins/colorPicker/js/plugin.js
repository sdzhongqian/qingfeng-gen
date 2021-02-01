$(function(){
	$('#picker01').colpick({flat:true});
	$('#picker02').colpick({flat:true,colorScheme:'dark'});
	
	$('#picker1').colpick();
	
	$('#picker2').colpick({
		flat:true,
		layout:'hex',
		submit:0
	});
	
	$('#picker3').colpick({
		layout:'hex',
		colorScheme:'dark',
		submit:0,
		onChange:function(hsb,hex,rgb,el,bySetColor) {
			$(el).css('border-color','#'+hex);
			// Fill the text box just if the color was set using the picker, and not the colpickSetColor function.
			if(!bySetColor) $(el).val(hex);
		}
	}).keyup(function(){
		$(this).colpickSetColor(this.value);
	});
	
	
	$('.ex-color-box').colpick({
		colorScheme:'dark',
		layout:'rgbhex',
		color:'ff8800',
		livePreview:0,
		onSubmit:function(hsb,hex,rgb,el) {
			$(el).css('background-color', '#'+hex);
			$(el).colpickHide();
		}
	})
	.css('background-color', '#ff8800');
});