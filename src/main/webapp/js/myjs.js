
function dolike( pid,uid){
	console.log(pid+","+uid)
	const d={
		uid:uid,
		pid:pid,
		opearion: 'like'
	}
	$.ajax({
		url:"LikeServlet",
		data:d,
		success:function(data,textStatus,jqXHR){
			console.log(data);
		},
		error:function(jqXHR,textSatus,errorThrown){
			console.log(data)
		}
	});
}