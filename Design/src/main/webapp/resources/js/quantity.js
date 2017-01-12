function redirect()
				  {
				 	if(document.getElementById('quantity').value < 1 || document.getElementById('quantity').value > 3)
				 		{
				 		window.location.href = document.getElementById('quantityUrl').getAttribute("dummyhref")+"1";
				 		}
				 	else
				 		{
				 		window.location.href = document.getElementById('quantityUrl').getAttribute("dummyhref")+""+document.getElementById('quantity').value.substring(0, 1);
				 		}
				 	
				  }