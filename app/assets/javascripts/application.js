// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require ckeditor/init
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).on('page:change', function(){

	$('[id=flip]').click(function(){
		$(this).next('#panel').slideToggle('fast');
	});

	$('[id=beginNewPostButton]').click(function(){ 
		$(this).hide();

		$('[id=newPostButton]').removeClass('editing-buttons-hidden'); 
		$('[id=newPostButton]').addClass('editing-buttons-shown'); 
	});

	$('[id=newPostButton]').click(function(){ 
		$('[id=newPostButton]').addClass('editing-buttons-hidden'); 
		$('[id=newPostButton]').removeClass('editing-buttons-shown'); 

		$('[id=beginNewPostButton').show();
	});

});
