setTimeout(function(){
  var btn = document.createElement("h3");
  var t = document.createTextNode(decodeURI("C%C3%92N")+" "+final_dis + " "+ decodeURI("%C4%90%E1%BA%BEN")+ " THE COFFEE HOUSE");
  var btn_2 = document.createElement("h3"); 
  var t_2 = document.createTextNode((destination_location).toUpperCase());
  btn.appendChild(t);
  btn_2.appendChild(t_2);
  document.getElementById("ab").appendChild(btn);
  document.getElementById("ab").appendChild(btn_2);

//  Change color Character
var change_color = document.getElementById("ab");
change_color.innerHTML= change_color.innerHTML.replace(decodeURI("C%C3%92N"), "<span style='color:black;'>"+decodeURI("C%C3%92N")+"</span>");
change_color.innerHTML= change_color.innerHTML.replace(decodeURI("%C4%90%E1%BA%BEN"), "<span style='color:black;'>"+decodeURI("%C4%90%E1%BA%BEN")+"</span>");

 destination_url = "https://maps.google.com/?saddr=" + latitude_1+"," + longitude_1+"&daddr="+ store_lat+"," + store_lng;;
// });
}, 400);

