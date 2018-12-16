// JavaScript Document
		function gotoPage(processurl, page){
			//$("#curpage").val() = page;
			$("#listTable").hide();
            $("#loadingTable").show();
            $.post(processurl,
                {activeAjax: 1, curpage: page, numresult: $("#numresult").val(), order: $("#order").val()},
                function(data){
                    $("#listTable").html(data);
                    $("#loadingTable").hide();
					$("#listTable").show();
                }
            );
        };	
		
		function CheckShowhome(processurl, ID, CheckID){
			
			//$("#curpage").val() = page;
			$("#listTable").hide();
            $("#loadingTable").show();
            $.post(processurl,
                {activeAjax: 1, curpage: $("#curpage").val(), numresult: $("#numresult").val(), order: $("#order").val(), ID: ID, CheckID:CheckID},
                function(data){
                    $("#listTable").html(data);
                    $("#loadingTable").hide();
					$("#listTable").show();
                }
            );
        };	
		
		
		
		function delItems(processurl, delStr){
			if (delStr == undefined)
			{
				calculatechon();
				delStr = document.getElementById("chon").value;
			}
			if (delStr == "") {
				return false;
			}
			if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN XÓA KHÔNG?"))
			{
				return false;
			}		
			//$("#curpage").val() = page;
			$("#listTable").hide();
            $("#loadingTable").show();
            $.post(processurl,
                {activeAjax: 1, curpage: $("#curpage").val(), numresult: $("#numresult").val(), order: $("#order").val(), dlStr: delStr},
                function(data){
                    $("#listTable").html(data);
                    $("#loadingTable").hide();
					$("#listTable").show();
                }
            );
        };
		
		function reloadPage(processurl){
			$("#listTable").hide();
            $("#loadingTable").show();
            $.post(processurl,
                {activeAjax: 1, cur_pos: 0, numresult: $("#numresult").val(), order: $("#order").val()},
                function(data){			
                   $("#listTable").html(data);
                    $("#loadingTable").hide();
				$("#listTable").show();
					
                }
            );
		}
		
		function reloadPage2(processurl){
			BASIC_SetCookie('listTable',document.getElementById("listTable").clientHeight);
			var c = parseInt(BASIC_GetCookie('listTable'));
			$("#listTable").hide();
            $("#loadingTable").show();
            $.post(processurl,	
                {activeAjax: 1, cur_pos: 0, numresult: $("#numresult").val(), order: $("#order").val()},
                function(data){
                    $("#listTable").html(data);
                    $("#loadingTable").hide();
					d = (c + 300);
					document.getElementById("listTable").style.height =  d;
					$("#listTable").show();
					$("#listTable").Style.height = $("#listTable").clientHeight+"px";
					document.getElementById("listTable").style.height = document.getElementById("listTable").clientHeight+"px";
					//alert(document.getElementById("listTable").clientHeight);
					
                }
            );
		}
		
		function setAction(processurl){
			if (confirm("Bạn có thật sự muốn thay đổi không?")){
				$("#listTable").hide();
				$("#loadingTable").show();
				$.post(processurl,
					{activeAjax: 1, cur_pos: 0, numresult: $("#numresult").val(), order: $("#order").val()},
					function(data){
						alert("Mọi thay đổi đã được cập nhật");
						$("#listTable").html(data);
						$("#loadingTable").hide();
						$("#listTable").show();
					}
				);
			}
		}		