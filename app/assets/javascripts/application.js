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
//= require popper
//= require bootstrap
//= require_tree .

$(document).ready(function()
{
  //sale functions
  $('#onChoose').on('change', function()
  {
      var maxi = $(this).find('option:selected').attr("name");
      var price = $(this).find('option:selected').attr("id");

      if(typeof price !== 'undefined')
      {
        $("#available_amount").val(maxi);
        $("#cost_price").val("R$ " + price);
        $("#deny_keyboard").val(1);
        $("#deny_keyboard").attr({"max": maxi});

        updateTotalPriceSale();
      } else {
        $("#available_amount").val("");
        $("#cost_price").val("");
        $("#deny_keyboard").val(0);
        $("#deny_keyboard").attr({"max": 0});
      }
  });

  $("#deny_keyboard").keypress(function (evt)
  {
      evt.preventDefault();
  });

  $('#sale_unit_price').keypress(function (evt)
  {
      if(evt.which != 8 && isNaN(String.fromCharCode(evt.which)) && evt.which != 46 || evt.which == 32)
      {
         evt.preventDefault();
      }
  });

  $('#sale_unit_price').keyup(function (evt)
  {
      updateTotalPriceSale();
  });

  $('#sale_unit_price').on('change', function()
  {
      updateTotalPriceSale();
  });

  $('#deny_keyboard').on('change', function()
  {
      updateTotalPriceSale();
  });

  function updateTotalPriceSale()
  {
    var amount = $('#deny_keyboard').val();
    var unit_price = $("#sale_unit_price").val();

    $("#total_price_sale").val("R$ " + (Math.round((amount * unit_price)*100)/100));
  }

  //purchase functions
  $('#purchase_item_id').on('change', function()
  {
      var id = $(this).find('option:selected').attr("value");
      var price = $("#" + id).attr("name");
      $("#price").val("R$ " + price);
      updateTotalPrice();
  });

  $('#purchase_amount').keypress(function (evt)
  {
      if(evt.which != 8 && isNaN(String.fromCharCode(evt.which)) || evt.which == 32)
      {
         evt.preventDefault();
      }
  });

  $('#purchase_amount').keyup(function (evt)
  {
      updateTotalPrice();
  });

  function updateTotalPrice()
  {
    var amount = $('#purchase_amount').val();
    var unit_price = $("#price").val().split(" ");
    $("#total_price").val("R$ " + (Math.round((amount * unit_price[1])*100)/100));
  }
});
