
$(document).on('change','.custom-input-search-select-theme-name',function (){
    console.log(this.value);
    window.location.href=""+window.location.origin+this.value;
});