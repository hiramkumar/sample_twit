// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function integer_only(e)
        {
		    var key;
		    var keychar;
		    if (window.event) 
		    	key = window.event.keyCode;
		    else 
		        if (e) 
		            key = e.which;
		        else 
		            return true;
		    keychar = String.fromCharCode(key);
		    // control keys
		    if ((key == null) || (key == 0) || (key == 8) || (key == 9) || (key == 13) || (key == 27)) 
		    	return true;
		    else if ((("0123456789").indexOf(keychar) > -1)) 
				if((e.element().value == "" || parseInt(e.element().value) < 1000000000 ) && !(key == 46 && e.element().value.include(".")))
		        	return true;
				else
			    	return false;
			else
		        return false;
        }

function update_all_post()
{
	var myAjax = new Ajax.Updater("load_def", '/login/create_own_post',{method:'get',parameters:50})
}