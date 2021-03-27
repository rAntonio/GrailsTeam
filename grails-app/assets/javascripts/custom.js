
$(document).on('change','.custom-input-search-select-theme-name',function (){
    console.log(this.value);
    window.location.href=""+window.location.origin+this.value;
});

$(document).on('click','.tr-link td:not(.td-checkbox)',function(){
    console.log($(this).data("href"));
    let redirect = $(this).parent().data("href");
    let fullUrl = window.origin + redirect;
    window.location.href=fullUrl;
});
$(document).on('click','button.validator',function () {
    try {
        let formId = $(this).data("form-id");
        $('#'+formId+" .fields-error").fadeOut();
        validator(formId);
        //$('#'+formID).submit();
    }
    catch (e){
        console.log("error",e.attribut);
        if(e.attribut){
            $('#'+attribut.idHtml).parent().find('.fields-error .fields-error-message')[0].html(e.message);
        }
    }
});