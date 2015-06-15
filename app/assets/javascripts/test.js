jQuery(document).ready(function() {


	$(document).on('page:change', function() {
	jQuery('#tabs').ready(function() {
		jQuery('#tabs').tabs();
		
	});
	});

	
	$(document).on('page:load', function() {
		jQuery('.expand').click(function() {
		$expand = $(this);

		$info = $expand.next();
		$text = $('p.expand').text();
		$info.slideToggle(200, function() {
			
			$expand.text(function() {
				
			});

		});
	});
	
});
	
});








