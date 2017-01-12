function filterredirect()
  {
  	window.location.href = "allproducts?search="+document.getElementById('searchItem').value;
  };
  
  function enterfunction(e)
  {
	  if(e.keyCode==13)
		  {
		      window.location.href = "allproducts?search="+document.getElementById('searchItem').value;
		  }
  };
  
  $(document).ready(function() {

	$('#searchItem').autocomplete({
		serviceUrl: '${pageContext.request.contextPath}/getTags',
		paramName: "subCategoryName",
		delimiter: ",",
	   transformResult: function(response) {

		return {
		  //must convert json to javascript object before process
		  suggestions: $.map($.parseJSON(response), function(item) {

		      return { value: item.subCategoryName, data: item.subCategoryId };
		   })

		 };

            }

		
	 });
	
  });
  
