
function searchPrId(){
	const child_name = document.getElementById('child_name').value;
	const phone_num = document.getElementById('phone_num').value;
	$.ajax({
		url: "child.list",
		data: {
			name: child_name,
			phone: phone_num
		},
		success: function(res){
			let str = "";
            for(let ch of res){
            	str += ("<tr>" +
                        "<td>" + ch.stuName + "</td>" +
                        "<td>" + ch.classCode + "</td>" + 
                        "<td><a onclick='inputPrId(this)'>" + ch.stuId + "</a></td>" +
                        "</tr>")
            }
			
            var element = document.getElementById('child_list');  
        	element.innerHTML += str;
		},error: function(){
			console.log("ajax통신 실패")
		}
	})
}