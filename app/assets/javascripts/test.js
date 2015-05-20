jQuery(document).ready(function() {
	jQuery('#tabs').tabs();
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
