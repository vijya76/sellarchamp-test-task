$(document).on('turbolinks:load', function() {
  $('form').on('cocoon:after-insert', function(e, added_variant) {
    const productTypeId = $("#product_product_type_id").val()
    $.ajax({
      type: 'GET',
      url: `/product_type/${productTypeId}/supported_options`,
      success: function(result) {
        let listitems = "";
        $.each(result.supported_options,function(key, value) {
            listitems += '<option value="' + value + '">' + value + '</option>';
        });
        added_variant.find("#supported_options").html(listitems)
        fecthOptions(result.supported_options[0], added_variant)
      }
    });
  });

  $('#product_product_type_id').change(function() {
    $('#variants > .nested-fields').remove();
  })
});

window.updateOptions = function(e) {
  const optionType = $(e).val()
  fecthOptions(optionType, $(e).parent())
}

function fecthOptions(optionType, elm) {
  $.ajax({
    type: 'GET',
    url: `/options?type=${optionType}`,
    success: function(result) {
      let listitems = "";
      $.each(result.options,function(key, value) {
          listitems += '<option value="' + value.id + '">' + value.option_value + '</option>';
      });
      elm.find("#select_options").html(listitems)
    }
  });
}
