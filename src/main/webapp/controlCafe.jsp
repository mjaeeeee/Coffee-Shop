<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<title>Cafe Control</title>
</head>
<style>
table.bound {
	border-collapse: collapse;
	border: 1px solid silver;
	height: 500px;
	width: 260px;
	
}

td.bound {
	border: 1px solid black;
}

#selMenu, #selOrder, #selSales {
	width: 330px;
	color: tomato;
	font-family: serif;
	background-color: honeydew;
	
	
}
#selMenu1 {
	width: 330px;
	color: tomato;
	font-family: serif;
	background-color: honeydew;
	
}

#selMenu2, #selMenu3 {
	width: 285px;
	color: tomato;
	font-family: serif;
	background-color: honeydew;
}

button {
	font-family: serif;
}

body {
	background-color: honeydew;
	font-family: serif;
	font-style: italic;
	
}

h1 {
	border: 1px solid silver;
	background-color: moccasin;
	border-collapse: boder-collaspe;
	font-family: serif;
}
}
</style>
<body>
<body>
	<table>
		<tr>
			<td valign=top>
				<table class='bound'>
					<caption>MenuList</caption>
					<tr>
						<td colspan=2 align=right>
							<button id=btnMenu>메뉴관리</button>
						</td>
					</tr>
					<tr>
						<td colspan=2><select id=selMenu size=13></select></td>
					</tr>
					<tr>
						<td>Code</td>
						<td><input type=text id=_code readonly></td>
					</tr>
					<tr>
						<td>MenuName</td>
						<td><input type=text id=menuname readonly></td>
					</tr>
					<tr>
						<td>Count</td>
						<td><input type=number id=count min=0 style='width: 30px'>잔</td>
					</tr>
					<tr>
						<td>Price</td>
						<td><input type=number id=price value=0 readonly>원</td>
					</tr>
					<tr>
						<td><button id=btnReset>비우기</button></td>
						<td align=right><button id=btnAdd>메뉴추가</button></td>
					</tr>
				</table>
			</td>
			<td valign=top>
				<table class='bound' id=tbl2>
					<caption>OrderList</caption>
					<tr>
						<td colspan=2 id=td2><select id=selOrder size=13></select></td>
					</tr>
					<tr>
						<td>Total</td>
						<td><input type=number id=total style='width: 100px' readonly>Won</td>
					</tr>
					<tr>
						<td>Mobile</td>
						<td><input type=phone id=mobile size=13></td>
					</tr>
					<tr>
						<td colspan=2>&nbsp;</td>
					</tr>
					<tr>
						<td><button id=btnCancel>주문취소</button></td>
						<td align=right><button id=btnDone>주문완료</button></td>
					</tr>
				</table>
			</td>
			<td valign=top>
				<table class='bound'>
					<caption>Sales history</caption>
					<tr>
						<td colspan=2 align=right>
							<button id=btnSummary>Summary</button>
						</td>
					</tr>
					<tr>
						<td><select id=selSales size=20></select></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<div id=dlgMenu style='display: none;' title="메뉴관리">
		<table>
			<tr>
				<td><select id=selMenu1 size=10></select></td>
				<td>
					<table>
						<tr>
							<td>코드</td>
							<td><input type=text id=code
								style='width: 120px; text-align: right;'></td>
						</tr>
						<tr>
							<td>메뉴명</td>
							<td><input type=text id=_name style='width: 120px'></td>
						</tr>
						<tr>
							<td>단가(가격)</td>
							<td><input type=number id=_price min=0 step=500
								style='width: 80px; text-align: right;'>원</td>
						</tr>
						<tr>
							<td colspan=2 align=center><button id=Complete>작성완료</button>&nbsp;
								<button id=btnReset2>비우기</button></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div id=dlgSummary style='display: none;' title="판매내역">
		<table>
			<tr>
				<td><select id=selMenu2 size=10></select></td>
				<td><select id=selMenu3 size=10></select></td>
			</tr>
		</table>
	</div>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>
	// 1
	nTotal=0;
	$(document).ready(function() {
		loadMenu();
		loadselect();
	})

	.on('click', '#selMenu', function() { //메뉴목록 테이블 클릭
		str = $('#selMenu option:selected').text();
		let ar = str.split(' ');
		$('#_code').val(ar[0]);
		$('#menuname').val(ar[1]);
		$('#count').val(1);
		$('#price').val(ar[2]);
	})
	.on('change', '#count', function() { //메뉴 x count
		str = $('#selMenu option:selected').text();
		let ar = str.split(' ');
		ar[2]=parseInt(ar[2]);
		bb = $('#count').val();
		$('#price').val(ar[2] * bb);
	})

	.on('click', '#btnReset', function() { //메뉴목록 초기화
		$('#_code').val(null);
		$('#menuname').val(null);
		$('#price').val(null);
		$('#count').val(null);
	})
	.on('click','#btnReset2',function(){ //다이얼로그 초기화
		$('#code').val(null);
		$('#_name').val(null);
		$('#_price').val(null);
	})
	.on('click','#btnDone',function(){ //주문완료
		alert("주문완료 되었습니다.");
		if ($('#mobile').val() == '')
			$('#mobile').val('--');
		$('#selOrder option').each(
				function() {
					let a = $(this).text();
					let rec = a.split(' ');
					menu_code = rec[0];
					mobile = $('#mobile').val();
					Menu = rec[1];
					qty = rec[2];
					total = rec[3];
					date = rec[4];
					str = '<option>' + ' ' + menu_code + ' ' + Menu
							+ ' ' + qty + ' ' + mobile + ' ' + total
							' ' + date + '</option>'
					$('#selSales').append(str);
					$.get('diagInsert', {
						mobile : mobile,
						menu_code : menu_code,
						menu : Menu,
						qty : qty,
						total : total,
						date : date
					}, function(txt) {
						$('#mobile,#code,#count,#total,#date').val("");
					}, 'text');

				})

		$('#total').val('');
		$('#selOrder').empty();
	})
	.on('click','#btnAdd',function() { //메뉴추가
				nam = $('#menuname').val();
				cou = $('#count').val();
				pric = $('#price').val();
				pric = parseInt(pric);
				selOr = $("#selMenu option:selected").text();
				let ar = selOr.split(' ');
				strOrder = '<option>'+ ar[0] + ' ' + nam + ' '
						+ cou + ' ' + pric + '</option>'
				//'<option>'+$('#menuname').val()+' x'+$('#count').val()+' '+$('#price').val()+'</option>'
				$('#selOrder').append(strOrder);
				nTotal += pric;
				$("#total").val(nTotal);
				// let total=parseInt($('#total').val())+parseInt($('#price').val());
				$('#btnReset').trigger('click');
			})
	.on("click",'#btnCancel',function(){ //주문취소
        $('#selOrder').empty();
        nTotal=0;
        $("#total").val(nTotal);
        $("#mobile").val('');
    })
    .on('click','#btnSummary',function(){ //서머리 다이얼로그 열기
    	$('#dlgSummary').dialog({
    		width : 600,
    		open : function() {
					$('#selMenu2').empty();
					$('#selMenu3').empty();
				$.get('diagSelect', {}, function(txt) {
					if (txt == "")
						return false;
					let rec = txt.split(';');
					for (i = 0; i < rec.length; i++) {
						let fld = rec[i].split(',');
						html = '<option>' + fld[0] + ' '
								+ fld[1] + ' '+ fld[2] + '</option>';
						$('#selMenu2').append(html);
					}
				})
				$.get('diagSelect2', {}, function(txt) {
					if (txt == "")
						return false;
					let rec = txt.split(';');
					for (i = 0; i < rec.length; i++) {
						let fld = rec[i].split(',');
						html = '<option>' + fld[0] + ' '
								+ fld[1] + ' ' + fld[2] +  '</option>';
						$('#selMenu3').append(html);
					}
				})
			},
			close : function() {
				$('#selMenu2').empty();
				$('#selMenu3').empty();
			}
		});
})


	.on('click', '#btnMenu', function() { //메뉴관리 다이얼로그 열기
		$('#dlgMenu').dialog({
	        width:560,
	        open:function(){ 
	           $.get('cafeSelect',{},function(txt){
	              if (txt == "")
	                 return false;
	              let rec = txt.split(';');
	              for (i = 0; i < rec.length; i++) {
	                 let fld = rec[i].split(',');
	                 html = '<option>'+fld[0]+' '+fld[1]+' '+fld[2]+'</option>';
	                 $('#selMenu1').append(html);
	              }
	           })
	        },
	        close:function(){
	           $('#selMenu').empty();
	           $('#selMenu1').empty();
	           loadMenu();
	        }
	        });
	})
	.on('change', '#selMenu1', function() { //메뉴관리 다이얼로그 테이블창클릭
      str = $('#selMenu1 option:selected').text();
      let ar = str.split(' ');
      $('#code').val(ar[0]);
      $('#_name').val(ar[1]);
      $('#_price').val(ar[2]);
   })

	.on('click','#Complete', function() { //메뉴관리 다이얼로그 클릭이벤트
				$('#selMenu1').empty();
				let operation = '';
				if ($('#code').val() == '') {
					if ($('#_name').val() != '' && $('#_price').val() != '') {
						operation = "cafeInsert";//insert
					} else {
						alert('입력값이 모두 채워지지 않았습니다.');
						return false;
					}
				} else {
					if ($('#_name').val() != '' && $('#_price').val() != '') {
						operation = "cafeUpdate";//update
					} else {
						operation = "cafeDelete";//delete
					 }
	            }
	            $.get(operation, {
	               code : $('#code').val(),
	               name : $('#_name').val(),
	               price : $('#_price').val(),
	            }, function(txt) {
	               $('#code,#_name,#_price').val("");
	               $.get('cafeSelect',{},function(txt){
	                  if (txt == "")
	                     return false;
	                  let rec = txt.split(';');
	                  for (i = 0; i < rec.length; i++) {
	                     let fld = rec[i].split(',');
	                     html = '<option>'+fld[0]+' '+fld[1]+' '+fld[2]+'</option>';
	                     $('#selMenu1').append(html);
	                  }
	               })
				}, 'text');
				$('#code').val('');
				$('#_name').val('');
				$('#_price').val('');
				return false;
			})
			
			function loadMenu() { //메뉴관리 셀렉트
		$.get('cafeSelect', {}, function(txt) {
			if (txt == "")
				return false;
			let rec = txt.split(';');
			for (i = 0; i < rec.length; i++) {
				let fld = rec[i].split(',');
				html = '<option>' + fld[0] + ' ' + fld[1] + ' ' + fld[2]
						+ '</option>';
				$('#selMenu').append(html);
			}
		})
	}
		
	function loadsel() {
		$.get('cafeSelect', {}, function(txt) {
			if (txt == "")
				return false;
			let rec = txt.split(';');
			for (i = 0; i < rec.length; i++) {
				let fld = rec[i].split(',');
				html = '<option>' + fld[0] + ' ' + fld[1] + '</option>';
				$('#selSales,#selMenu1').append(html);
			}
		})
	}
	function loadselect(){
	      $.get('diagSelect3',{},function(txt){
	         if (txt == "") return false;
	         let rec = txt.split(';');
	         for (i = 0; i < rec.length; i++) {
	            let fld = rec[i].split(',');
	            html = '<option>'+fld[0]+' '+fld[1]+' '+fld[2]+' ' +fld[3]+' '+fld[4]+ '</option>';
	            $('#selSales').append(html);
	            console.log(html);
	         }
	      } ,"text")
	}

</script>
</html>