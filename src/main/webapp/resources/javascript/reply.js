

console.log("모듈모듈");

var replyService = (function() {


    function add(reply, callback){
        console.log("reply.............");
        
           $.ajax({
            type : 'post',
            url : '/replies/new',
            data : JSON.stringify(reply),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr){
                if(callback){
                    callback(result);
                }
            },
            error : function(xhr, status, er){
                if(error){
                    error(er);
                }
            }
        })
  
	}
	
	 function getList(param, callback, error){
        var b_seq = param.b_seq;
        var page = param.page || 1;

        $.getJSON("/replies/pages/" + b_seq + "/" + page + ".json",
        function(data){
            if(callback){
               // callback(data); 댓글 목록만 가져오는 경우
               callback(data.replyCnt, data.list); //"b_replyCnt로 수정했어"
            }
        }).fail(function(xhr, status, err){
            if(error){
                error();
            }
        });
        
    }
    
    function remove(r_seq, callback,error) {
		$.ajax({
		type:"delete",
		url : "/replies/" +r_seq,
		success :function(deleteResult, status, xhr) {
		if(callback) {
		callback(deleteResult);
		}
		},
		error : function(xhr,status,err) {
			if(error) {
			error(err);
			}
			}
			});
			}
			
	function update(reply, callback, error){

        console.log("R_SEQ: " + reply.r_seq);

        $.ajax({
            type : 'put',
            url : '/replies/' + reply.r_seq,
            data : JSON.stringify(reply),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr){
                if(callback){
                    callback(result);
                }
            },
            error : function(xhr, status, er){
                if(error){
                    error(er);
                }
            }


        });

    } 
    
    function get(r_seq, callback, error) {
    $.get("/replies/" + r_seq + ".json", function(result) {
    
    console.log("리절트" + result);
    
    
    	if(callback) {
    	console.log("글자써?");
    	callback(result);
    	
    	}
    }).fail(function(xhr, status, err) {
    
    console.log("실패함");
    	if(error) {
    	console.log("에러떠?")
    		error();
    		}
    	});
    } 	
    
    function displayTime(timeValue) {

      var today = new Date();
      var gap = today.getTime() - timeValue;

      var dateObj = new Date(timeValue);
      var str = "";

      if (gap < (1000 * 60 * 60 * 24)) {

         var hh = dateObj.getHours();
         var mi = dateObj.getMinutes();
         var ss = dateObj.getSeconds();

         return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
               ':', (ss > 9 ? '' : '0') + ss ].join('');

      } else {
         var yy = dateObj.getFullYear();
         var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
         var dd = dateObj.getDate();

         return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
               (dd > 9 ? '' : '0') + dd ].join('');
      }
   }		
	
	
	return  {
	add:add, 
	getList : getList,
	remove : remove,
	update : update,
	get : get,
	displayTime : displayTime
	
	};


}) ();





 