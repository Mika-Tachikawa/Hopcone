//$(".tag-select").select2({
  //placeholder: "選択"
//});

//<script>
$('.tag-select').select2({
  multiple: true, //複数選択可能
  placeholder: "選択してください", //プレースホルダーを設定
  allowClear: true, //下矢印を消去
});
//</script>