function post_goto(option_code) {
	var form = document.createElement('form');
    var obj1,obj2, value;

    obj1 = document.createElement('input');
    obj1.setAttribute('type', 'hidden');
    obj1.setAttribute('name', 'searchOption');
    obj1.setAttribute('value', option_code);
    form.appendChild(obj1);
    
    obj2 = document.createElement('input');
    obj2.setAttribute('type', 'hidden');
    obj2.setAttribute('name', 'roomType');
    obj2.setAttribute('value', '');
    form.appendChild(obj2);

    form.setAttribute('method', 'post');
    form.setAttribute('action', '/CBangProj/Search/Map.do');
	document.body.appendChild(form);
	form.submit();
}
function post_goto1(room_type) {
	var form = document.createElement('form');
    var obj, obj2, value;

    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'roomType');
    obj.setAttribute('value', room_type);
    form.appendChild(obj);
    
    obj2 = document.createElement('input');
    obj2.setAttribute('type', 'hidden');
    obj2.setAttribute('name', 'searchOption');
    obj2.setAttribute('value', '');
    form.appendChild(obj2);

    form.setAttribute('method', 'post');
    form.setAttribute('action', '/CBangProj/Search/Map.do');
	document.body.appendChild(form);
	form.submit();
}