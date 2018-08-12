// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require materialize
//= require_tree .

function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            $("#avatarPreview").attr("src", e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$( document ).on("turbolinks:load", function() {
    // Add materialcss javascript to fields and menu
    $(".dropdown-trigger").dropdown();
    M.updateTextFields();
    if ($(".textarea-main").length > 0) {
        M.textareaAutoResize($(".textarea-main"));
    }

    // Avatar preview on profile in settings
    $("#avatar-file").change(function() {
        readURL(this);
    });

    $("#replaceImage").click(function () {
        $("#avatar-file").trigger("click");
    });

    // Toggle likes on click
    $("#likeButton").on("click", function(event){
        let investId = $(this).data('investId');

        $.ajax({
            type: "POST",
            beforeSend: function(xhr) {xhr.setRequestHeader("X-CSRF-Token", $("meta[name='csrf-token']").attr("content"))},
            url: "/invests/"+ investId + "/likes",
            success: function(response) {
                $("#likeCount")[0].innerText = response["invest_likes"];
            },
            error: function(error) {}
        });
        event.preventDefault();
    });
});