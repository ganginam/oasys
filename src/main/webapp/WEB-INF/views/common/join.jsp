<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
      <title>Insert title here</title>
      <link rel="shortcut icon" href="/resources/images/icon.png" />
      <link rel="apple-touch-icon" href="/resources/images/icon.png" />
      <!-- [if lt IE 9]>
      <script src="../js/html5shiv.js"></script> 
      <![endif]-->
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
      <link rel="stylesheet" type="text/css" href="/resources/include/css/lightbox.css"/>
      <link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
      <link rel="stylesheet" type="text/css" href="/resources/include/css/showroom.css"/>
      
      <!-- Custom styles for this template -->
       <link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
      <style type="text/css">
         
         
         
      </style>
      <script type="text/javascript">
	      $(function(){
	    	  
	    	  
	    	  $("#m_pwd").keyup(function(){
	    		  $("#chkNotice").html("");
	    	  });
	    	  
	    	  $("#m_pwd2").keyup(function(){
	    		  if($("#m_pwd").val() != $("#m_pwd2").val()){
	    			  $("#chkNotice").html("비밀번호가 일치하지 않습니다.");
	    			  $("#chkNotice").attr("color", "#FF0000");
	    		  }else{
	    			  $("#chkNotice").html("비밀번호가 일치합니다.");
	    			  $("#chkNotice").attr("color", "#0054FF");
	    		  }
	    	  });
	    	  
				$("#btn_joinSuccess").click(function(){
					var passwd = $("#m_pwd").val();
					var passwd2 = $("#m_pwd2").val();
					
	
					if(!chkData("#m_id", "아이디를")) return;
					else if(!chkData("#m_pwd", "비밀번호를")) return;
					else if(!chkData("#m_pwd2", "변경할 비밀번호를")) return;
					else if(!chkData("#m_name", "이름을")) return;
					else if(!chkData("#first", "핸드폰 번호 앞자리를")) return;
					else if(!chkData("#middle", "핸드폰 번호 중간자리를")) return;
					else if(!chkData("#last", "핸드폰 번호 마지막 자리를")) return;
					else if(!chkData("#m_email", "이메일을")) return;
					else if(!chkData("#m_emailTail", "이메일 뒷 주소를")) return;
		
					else if($("#selectYear").val()==""){
						alert("태어난 연도를 선택해주세요");
						return;
					}else if($("#selectMonth").val()==""){
						alert("태어난 월을 선택해주세요");
						return;
					}else if($("#selectDay").val()==""){
						alert("태어난 일을 선택해주세요");
						return;
					}else if($(":radio[name='m_gender']:checked").length < 1){
						alert("성별을 선택해주세요");
						return false;
					}
					
					else if(passwd != "" || passwd2 != ""){
						if(passwd == passwd2){
							
						}else{
							alert("비밀번호가 일치하지 않습니다.");
							$("#m_pwd").focus();
							$("#m_pwd").val("");
							$("#m_pwd2").val("");
							return;
						}
					} else{
						
					}
					
					var sum_email = $("#m_email").val()+"@"+$("#m_emailTail").val();
					$("#sum_email").val(sum_email);
					
					var sum_phone = $("#first").val()+"-"+$("#middle").val()+"-"+$("#last").val();
					$("#sum_phone").val(sum_phone);
					
					var m_birthday = $("#selectYear").val()+"/"+$("#selectMonth").val()+"/"+$("#selectDay").val();
					$("#m_birthday").val(m_birthday);
					
					$("#frm_join").attr({
						"method":"post",
						"action":"/common/memberInsert"
					});
					$("#frm_join").submit();
				
				});
				
				
				//email select
				$("#selectEmail").change(function(){
			 		if($(this).val()==1){
			 			$("#m_emailTail").val("");
			 			$("#m_emailTail").focus();
			 		} else{
			 			$("#m_emailTail").val($(this).val());
			 			//$("#emailTail").attr("readonly", true);
			 		}
			 	});
				
				//id 중복 체크
				$("#idCheck").click(function(){
					var id = $("#m_id").val();
					if($("#m_id").val().replace(/\s/g,"")==""){
						alert("아이디를 입력해주세요");
					}else{
						$.ajax({
							async:true,
							type:"post",
							data:"m_id="+id,
							url:"/common/idCheck",
							dataType:"text",
							success:function(data){
								if(data=="1"){
									alert("동일한 아이디가 존재합니다");
									$("#m_id").focus();
								}else{
									alert("사용 가능한 아이디입니다.");
									idCheck=1;
								}
							},
							error:function(){
								alert("잠시후에 다시 시도해주세요");
							}
						});
					}
				});
				
				$("#btn_back").click(function(){
					window.history.back();
				});
				
				/* $("#emailCheck").click(function(){
					location.href="/common/mailForm";
					//prompt("이메일 인증 코드를 입력해주세요");
				}); */
				
				
				
			}); //최상위 $종료
			
			function showPopUp(){
				openWin = window.open("/common/mailForm", "메일 인증", "width=400, height=300, left=100, top=50");
				//document.getElementById("tomail").value = document.getElementById("m_email").value;
			}
			
			/* function send(){
				openWin.document.getElementById("tomail").value = document.getElementById("m_email").value;
			} */
		
   		</script>
   </head>
   <body>
      <div class="location">
                <ul>
                    <li><a href='/'><img src="/resources/images/hotelImages/logo.png" alt="home" class="logoImage" width="25" height="25"></a></li>
                    <li> > </li>
                    <li><a href='/common/check'>약관동의 </a></li>
                    <li> > </li>
                    <li class="current"><a href='#'>회원가입</a></li>
                </ul>
                <h1 class="text-center">회원가입</h1>
       </div>
       <br/><br/><br/><br/><br/>
   <div id="content" class="content content-suite">
      <div class="container">
   			<div> 
   				<form id="frm_join" name="frm_join" class="form-inline">
   					<table class="table table-hover">
   						<tr>
   							<td>아이디</td>
   							<td><input type="text" id="m_id" name="m_id" placeholder="아이디를 입력해주세요"/>
   								<input type="button" id="idCheck" value="중복확인" class="btn btn-sm"/> 
   							</td> 
   						</tr>
   						<tr>
   							<td>비밀번호</td>
   							<td><input type="password" id="m_pwd" name="m_pwd" placeholder="비밀번호를 입력해주세요"/></td>
   						</tr>
   						<tr>
   							<td>비밀번호 확인</td>
   							<td><input type="password" id="m_pwd2" name="m_pwd2" placeholder="동일한 비밀번호를 입력해주세요"/>
   								<font id="chkNotice" size="2"></font>
   							</td>
   						</tr>
   						<tr>
   							<td>이름</td>
   							<td><input type="text" id="m_name" name="m_name" placeholder="이름을 입력해주세요"/></td>
   						</tr> 
   						<tr>
   							<td>핸드폰</td>
   							<td>
   								<input type="text" id="first" name="first" maxlength="3" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"/>
   								<label>-</label>
   								<input type="text" id="middle" name="middle" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"/>
   								<label>-</label>
   								<input type="text" id="last" name="last" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"/>
   								<input type="hidden" id="sum_phone" name="m_phone"/>
   							</td>
   						</tr>
   						
   						<tr>
   							<td>이메일</td>
   							<td>
   							
   								<input type="text" id="m_email" name="email"/>@
   								<input type="text" id="m_emailTail" name="m_emailTail"/>
   						
   								<select id="selectEmail" name="selectEmail">
   									<option value="">직접입력</option>
   									<option value="naver.com">naver</option>
   									<option value="daum.net">daum</option>
   									<option value="nate.com">nate</option>
   									<option value="google.com">google</option>
   									<option value="hanmail.com">hanmail</option>
   								</select>
   							
   								<input type="hidden" id="sum_email" name="m_email"/>
   								
   								
   								<!-- <input type="button" value="전달" onclick="send()"/> -->
   								<input type="button" id="emailCheck" name="emailCheck" value="인증하기" onclick="showPopUp()" class="btn btn-sm"/>
   								
   								<!-- 이메일 인증 여부 표시 -->
   								<input type="text" id="emailSuccess" name="emailSuccess" readonly="readonly"/>
   								
   							</td>
   						</tr>
   						<tr>
   							<td>생년월일</td>
   							<td><select id="selectYear" name="selectYear">
   									<option value="">선택</option> 
   									<option value="1931">1931</option><option value="1932">1932</option><option value="1933">1933</option><option value="1934">1934</option><option value="1935">1935</option><option value="1936">1936</option><option value="1937">1937</option><option value="1938">1938</option><option value="1939">1939</option><option value="1940">1940</option><option value="1941">1941</option><option value="1942">1942</option><option value="1943">1943</option><option value="1944">1944</option><option value="1945">1945</option><option value="1946">1946</option><option value="1947">1947</option><option value="1948">1948</option><option value="1949">1949</option><option value="1950">1950</option><option value="1951">1951</option><option value="1952">1952</option><option value="1953">1953</option><option value="1954">1954</option><option value="1955">1955</option><option value="1956">1956</option><option value="1957">1957</option><option value="1958">1958</option><option value="1959">1959</option><option value="1960">1960</option><option value="1961">1961</option><option value="1962">1962</option><option value="1963">1963</option><option value="1964">1964</option><option value="1965">1965</option><option value="1966">1966</option><option value="1967">1967</option><option value="1968">1968</option><option value="1969">1969</option><option value="1970">1970</option><option value="1971">1971</option><option value="1972">1972</option><option value="1973">1973</option><option value="1974">1974</option><option value="1975">1975</option><option value="1976">1976</option><option value="1977">1977</option><option value="1978">1978</option><option value="1979">1979</option><option value="1980">1980</option><option value="1981">1981</option><option value="1982">1982</option><option value="1983">1983</option><option value="1984">1984</option><option value="1985">1985</option><option value="1986">1986</option><option value="1987">1987</option><option value="1988">1988</option><option value="1989">1989</option><option value="1990">1990</option><option value="1991">1991</option><option value="1992">1992</option><option value="1993">1993</option><option value="1994">1994</option><option value="1995">1995</option><option value="1996">1996</option><option value="1997">1997</option><option value="1998">1998</option><option value="1999">1999</option><option value="2000">2000</option><option value="2001">2001</option>
   								</select>
   								<label>년</label>
   								<select id="selectMonth" name="selectMonth">
   									<option value="">선택</option>
   									<option value="01">1</option>
   									<option value="02">2</option>
   									<option value="03">3</option>
   									<option value="04">4</option>
   									<option value="05">5</option>
   									<option value="06">6</option>
   									<option value="07">7</option>
   									<option value="08">8</option>
   									<option value="09">9</option>
   									<option value="10">10</option>
   									<option value="11">11</option>
   									<option value="12">12</option>
   								</select>
   								<label>월</label>
   								<select id="selectDay" name="selectDay">
   									<option value="">선택</option><option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
   								</select>
   								<label>일</label>
   								<input type="hidden" id="m_birthday" name="m_birth"/>
   							</td>
   						</tr>
   						<tr>
   							<td>성별</td>
   							<td><input type="radio" name="m_gender" value="남자">남자
   								<input type="radio" name="m_gender" value="여자">여자
   							</td>
   						</tr>
   					</table>
   					 
   					<div class="text-center">
		   				<input type="button" id="btn_joinSuccess" class="btn btn-primary" value="회원가입"/>
		   				<input type="reset" id="reset" value="초기화" class="btn btn-default"/>
		   				<input type="button" id="btn_back" value="뒤로 가기"  class="btn btn-default"/>
   					</div>
   				</form>

   			</div>
   		</div>
   </div>
   </body>
</html>