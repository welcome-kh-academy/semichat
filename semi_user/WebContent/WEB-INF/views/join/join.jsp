<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

/* 회원가입 메시지(로고) */
#joinlogo {
	text-align: center;
}

/* 빨간색으로 나와야할 글씨 스타일  지정 */
#redText{
	color:red;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	
	var divIdcheck = $('#divId');
	
	//아이디 중복 검사(1 = 중복 / 0 = 중복 아님)
    function IdCheckFunction(){
        var id = $("#id").val();
        $.ajax({
           type: 'get',
           url: '/join/idCheck', 
           data: {id: id},
           dataType: "json",
           success: function(data) {
        	  console.log(data.result); 
        	   
              if(data.result == 1) {
            	  //1 : 아이디가 중복
       			$("#id_check").text("사용중인 아이디 입니다.");
       			$("#id_check").css("color", "red");
				$("#btnJoin").attr("disabled", true);
				divIdcheck.removeClass("has-success");
        		divIdcheck.addClass("has-error");
       			 $('#id').focus();
       	        return false;
              
              }
              // 0 : 아이디 중복 없음
              else {
            	  var divId = $('#divId');
            	  //빈칸 입력 했을경우
                  if($('#id').val()==""){
                	   divId.removeClass("has-error");
                       divId.addClass("has-success");
                       $("#id_check").text("아이디를 입력해 주세요");
                       $("#id_check").css("color", "red");
                       $('#id').focus();
                  }
            	  // 제대로 입력했을 경우
                  else{
                    divId.removeClass("has-success");
                    divId.addClass("has-error");
                    $("#id_check").text("사용할 수 있는 아이디 입니다.");
                    $("#id_check").css("color", "green");
                    $('#password').focus();
                 }
                  
       			$("#btnJoin").attr("disabled", false)
        	    return false;
              }
           }
        });
     }

	 //최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 marketingAgree, privacyInfoAgree인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=privacyInfoAgree]").prop("checked",true);
            $("input[name=marketingAgree]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 marketingAgree, privacyInfoAgree인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=privacyInfoAgree]").prop("checked",false);
            $("input[name=marketingAgree]").prop("checked",false);
        }
    })
	
	//페이지 첫 접속 시 입력창으로 포커스 이동(안됨)
	$("input").eq(0).focus();
	
	//패스워드 입력 창에서 엔터 입력 시 form submit
	$("input").eq(1).keydown(function(key) {
		if(key.keyCode == 13) {
			$(this).parents("form").submit();
		}
	})

	//회원가입 버튼 클릭 시 form submit
	$("#btnJoin").click(function() {
		$(this).parents("form").submit();
	})
	
	//취소 버튼 누르면 뒤로가기
	$("#btnCancel").click(function() {
		history.go(-1);
	})
	
	//아이디 중복 검사
	$("#idCheck").click(function() {
		IdCheckFunction();
		console.log("아이디 중복 버튼 클릭");
	})
	
	//닉네임 중복 검사
	$("#nicknameCheck").click(function() {
		console.log("닉네임 중복 버튼 클릭");
	})
	
	 $(function(){
         //모달을 전역변수로 선언
         var modalContents = $(".modal-contents");
         var modal = $("#defaultModal");
          
         //아이디 - 숫자 or 알파벳만 입력할 수 있도록, 숫자 or 알파벳이 아니라면 빈칸으로 대체됨(지워짐)
         $('.onlyAlphabetAndNumber').keyup(function(event){
             if (!(event.keyCode >=37 && event.keyCode<=40)) {
                 var inputVal = $(this).val();
                 $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
             }
         });
          
       //이름 - 한글만 입력할 수 있도록, 한글이 아니라면 빈칸으로 대체됨(지워짐)
         $(".onlyHangul").keyup(function(event){
             if (!(event.keyCode >=37 && event.keyCode<=40)) {
                 var inputVal = $(this).val();
                 $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
             }
         });
      
         //휴대폰 번호 - 숫자만 입력할 수 있도록, 숫자가 아니라면 빈칸으로 대체됨(지워짐)
         $(".onlyNumber").keyup(function(event){
             if (!(event.keyCode >=37 && event.keyCode<=40)) {
                 var inputVal = $(this).val();
                 $(this).val(inputVal.replace(/[^0-9]/gi,''));
             }
         });
          
         //필수 입력사항 검사
         //빈칸 여부 검사
         
         $('#id').keyup(function(event){
              
             var divId = $('#divId');
              
             if($('#id').val()==""){
                 divId.removeClass("has-success");
                 divId.addClass("has-error");
             }else{
                 divId.removeClass("has-error");
                 divId.addClass("has-success");
             }
         });
          
         $('#password').keyup(function(event){
              
             var divPassword = $('#divPassword');
              
             if($('#password').val()==""){
                 divPassword.removeClass("has-success");
                 divPassword.addClass("has-error");
             }else{
                 divPassword.removeClass("has-error");
                 divPassword.addClass("has-success");
             }
         });
          
         $('#passwordCheck').keyup(function(event){
              
             var passwordCheck = $('#passwordCheck').val();
             var password = $('#password').val();
             var divPasswordCheck = $('#divPasswordCheck');
              
             if((passwordCheck=="") || (password!=passwordCheck)){
                 divPasswordCheck.removeClass("has-success");
                 divPasswordCheck.addClass("has-error");
             }else{
                 divPasswordCheck.removeClass("has-error");
                 divPasswordCheck.addClass("has-success");
             }
         });
          
         $('#name').keyup(function(event){
              
             var divName = $('#divName');
              
             if($.trim($('#name').val())==""){
                 divName.removeClass("has-success");
                 divName.addClass("has-error");
             }else{
                 divName.removeClass("has-error");
                 divName.addClass("has-success");
             }
         });
          
         $('#nickname').keyup(function(event){
              
             var divNickname = $('#divNickname');
              
             if($.trim($('#nickname').val())==""){
                 divNickname.removeClass("has-success");
                 divNickname.addClass("has-error");
             }else{
                 divNickname.removeClass("has-error");
                 divNickname.addClass("has-success");
             }
         });
          
         $('#email').keyup(function(event){
              
             var divEmail = $('#divEmail');
              
             if($.trim($('#email').val())==""){
                 divEmail.removeClass("has-success");
                 divEmail.addClass("has-error");
             }else{
                 divEmail.removeClass("has-error");
                 divEmail.addClass("has-success");
             }
         });
          
         $('#phoneNumber').keyup(function(event){
              
             var divPhoneNumber = $('#divPhoneNumber');
              
             if($.trim($('#phoneNumber').val())==""){
                 divPhoneNumber.removeClass("has-success");
                 divPhoneNumber.addClass("has-error");
             }else{
                 divPhoneNumber.removeClass("has-error");
                 divPhoneNumber.addClass("has-success");
             }
         });
         
         $('#enterprise').keyup(function(event){
             
             var divEnterprise = $('#divEnterprise');
              
             if($.trim($('#enterprise').val())==""){
            	 divEnterprise.removeClass("has-success");
            	 divEnterprise.addClass("has-error");
             }else{
            	 divEnterprise.removeClass("has-error");
            	 divEnterprise.addClass("has-success");
             }
         });
         
          
         //------- 유효성 검사
         $( "form" ).submit(function( event ) {
              
             var provision = $('#provision');
             var memberInfo = $('#memberInfo');
             var divId = $('#divId');
             var divPassword = $('#divPassword');
             var divPasswordCheck = $('#divPasswordCheck');
             var divName = $('#divName');
             var divNickname = $('#divNickname');
             var divEmail = $('#divEmail');
             var divPhoneNumber = $('#divPhoneNumber');
             var divEnterprise = $('#divEnterprise');
              
             //아이디 검사
             if($('#id').val()==""){
                 modalContents.text("아이디를 입력하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 divId.removeClass("has-success");
                 divId.addClass("has-error");
                 $('#id').focus();
                 return false;
             }else{
                 divId.removeClass("has-error");
                 divId.addClass("has-success");
             }
              
             // 비밀번호 정규식 검사
             // 숫자, 대/소문자, 특수문자 중 2가지 이상을 조합한 8~15자리
            var password= $("#password").val();  // pw 입력
         	var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,15}$/.test(password);   //영문,숫자
         	var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{8,15}$/.test(password);  //영문,특수문자
         	var check3 = /^(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,15}$/.test(password);  //특수문자, 숫자
         	if(!(check1||check2||check3)){
         		modalContents.text("비밀번호는 숫자, 대/소문자, 특수문자 중 2가지 이상을 조합한 8~15 자리가 가능합니다");
                modal.modal('show');
                divPassword.removeClass("has-success");
                divPassword.addClass("has-error");
                $('#password').focus();
                return false;
         	}
         	else{
               divPassword.removeClass("has-error");
               divPassword.addClass("has-success");
         	}
             
             //비밀번호 검사
             if($('#password').val()==""){
                 modalContents.text("비밀번호를 입력하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 divPassword.removeClass("has-success");
                 divPassword.addClass("has-error");
                 $('#password').focus();
                 return false;
             }else{
                 divPassword.removeClass("has-error");
                 divPassword.addClass("has-success");
             }
              
             //비밀번호 확인
             if($('#passwordCheck').val()==""){
                 modalContents.text("비밀번호 확인을 입력하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 divPasswordCheck.removeClass("has-success");
                 divPasswordCheck.addClass("has-error");
                 $('#passwordCheck').focus();
                 return false;
             }else{
                 divPasswordCheck.removeClass("has-error");
                 divPasswordCheck.addClass("has-success");
             }
              
             //비밀번호 비교
             if($('#password').val()!=$('#passwordCheck').val() || $('#passwordCheck').val()==""){
                 modalContents.text("비밀번호가 일치하지 않습니다.");
                 modal.modal('show');
                  
                 divPasswordCheck.removeClass("has-success");
                 divPasswordCheck.addClass("has-error");
                 $('#passwordCheck').focus();
                 return false;
             }else{
                 divPasswordCheck.removeClass("has-error");
                 divPasswordCheck.addClass("has-success");
             }
              
             //이름
             if($('#name').val()==""){
                 modalContents.text("이름을 입력하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 divName.removeClass("has-success");
                 divName.addClass("has-error");
                 $('#name').focus();
                 return false;
             }else{
                 divName.removeClass("has-error");
                 divName.addClass("has-success");
             }
              
             //별명
             if($('#nickname').val()==""){
                 modalContents.text("닉네임을 입력하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 divNickname.removeClass("has-success");
                 divNickname.addClass("has-error");
                 $('#nickname').focus();
                 return false;
             }else{
                 divNickname.removeClass("has-error");
                 divNickname.addClass("has-success");
             }
              
             //이메일
             if($('#email').val()==""){
                 modalContents.text("이메일을 입력하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 divEmail.removeClass("has-success");
                 divEmail.addClass("has-error");
                 $('#email').focus();
                 return false;
             }
             
             //이메일에 @이가 포함 안되있을 경우
             else if($('#email').val().includes('@') == false){
            	 modalContents.text("올바른 형식의 이메일을 입력해 주시기 바립니다.");
                 modal.modal('show');
                  
                 divEmail.removeClass("has-success");
                 divEmail.addClass("has-error");
                 $('#email').focus();
                 return false;
             }
             else{
                 divEmail.removeClass("has-error");
                 divEmail.addClass("has-success");
             }
              
             //휴대폰 번호
             if($('#phoneNumber').val()==""){
                 modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 divPhoneNumber.removeClass("has-success");
                 divPhoneNumber.addClass("has-error");
                 $('#phoneNumber').focus();
                 return false;
             }else{
                 divPhoneNumber.removeClass("has-error");
                 divPhoneNumber.addClass("has-success");
             }
             
             //회사명
             if($('#enterprise').val()==""){
                 modalContents.text("회사명을 입력하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 divEnterprise.removeClass("has-success");
                 divEnterprise.addClass("has-error");
                 $('#enterprise').focus();
                 return false;
             }else{
            	 divEnterprise.removeClass("has-error");
            	 divEnterprise.addClass("has-success");
             }
             
             //개인정보취급방침
             if($('#privacyInfoAgree:checked').val()==null){
                 modalContents.text("개인정보취급방침에 동의하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 memberInfo.removeClass("has-success");
                 memberInfo.addClass("has-error");
                 $('#privacyInfoAgree').focus();
                 return false;
             }else{
                 memberInfo.removeClass("has-error");
                 memberInfo.addClass("has-success");
             }
         });
          
     });
});


</script>

<h4 id = joinlogo>회원가입</h4>

<!-- 모달창 -->
            <div class="modal fade" id="defaultModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">알림</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                        	<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!--// 모달창 -->
            <hr/>
                <!-- 본문 들어가는 부분 -->

<form class="form-horizontal" role="form" method="post"
	action="/join/join">
	<div class="form-group" id="divId">
		<label for="id" class="col-sm-3 col-sm-offset-1 control-label">아이디</label>
		<button type="button" id="idCheck" class="btn btn-primary">중복 확인</button>
		<div class="col-sm-5">
			<input type="text" class="form-control onlyAlphabetAndNumber" id="id" name = "id"
				data-rule-required="true"
				placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능" maxlength="30">
				<div class="check_font" id="id_check"></div>
		</div>
	</div>
	<div class="form-group" id="divPassword">
		<label for="password" class="col-sm-3 col-sm-offset-1 control-label">비밀번호</label>
		<div class="col-sm-5">
			<input type="password" class="form-control" id="password"
				name="password" data-rule-required="true" placeholder="비밀번호"
				maxlength="30">
		</div>
	</div>
	<div class="form-group" id="divPasswordCheck">
		<label for="passwordCheck" class="col-sm-3 col-sm-offset-1 control-label">비밀번호
			확인</label>
		<div class="col-sm-5">
			<input type="password" class="form-control" id="passwordCheck" name = "passwordCheck"
				data-rule-required="true" placeholder="비밀번호 확인" maxlength="30">
				<small id = redText>숫자, 대/소문자, 특수문자 중 2가지 이상을 조합한 8~15자리</small>
		</div>
	</div>
	<div class="form-group" id="divName">
		<label for="name" class="col-sm-3 col-sm-offset-1 control-label">이름</label>
		<div class="col-sm-5">
			<input type="text" class="form-control onlyHangul" id="name" name = "name"
				data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
		</div>
	</div>

	<div class="form-group" id="divNickname">
		<label for="nickname" class="col-sm-3 col-sm-offset-1 control-label">닉네임</label>
		<button type="button" id="nicknameCheck" class="btn btn-primary">중복 확인</button>
		<div class="col-sm-5">
			<input type="text" class="form-control" id="nickname" name = "nickname"
				data-rule-required="true" placeholder="닉네임" maxlength="15">
				<div class="check_font" id="nickname_check"></div>
		</div>
	</div>

	<div class="form-group" id="divEmail">
		<label for="email" class="col-sm-3 col-sm-offset-1 control-label">이메일 </label>
		<div class="col-sm-5">
			<input type="email" class="form-control" id="email" name = "email"
				data-rule-required="true" placeholder="이메일" maxlength="40">
				<small id = redText> (가입 인증 메일이 발송 됩니다)</small>
		</div>
	</div>
	<div class="form-group" id="divPhoneNumber">
		<label for="phoneNumber" class="col-sm-3 col-sm-offset-1 control-label">휴대폰
			번호</label>
		<div class="col-sm-5">
			<input type="tel" class="form-control onlyNumber" id="phoneNumber" name = "phoneNumber"
				data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요."
				maxlength="11">
		</div>
	</div>
	<div class="form-group" id = divEnterprise>
		<label for="enterprise" class="col-sm-3 col-sm-offset-1 control-label">회사명</label>
		<div class="col-sm-5">
			<input type="text" class="form-control" id="enterprise" name = "enterprise"
				data-rule-required="true" placeholder="회사명" maxlength="15">
		</div>
	</div>
	
	<div class="form-group">
		<label for="allAgree" class="col-sm-3 col-sm-offset-1 control-label">모두 동의</label>
		<div class="col-sm-5" id="allAgree">
			<div class="checkbox">
				<label> 
					<input type="checkbox"  id="checkall" autofocus="autofocus">
				</label>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label for="privacyInfoAgree" class="col-sm-3 col-sm-offset-1 control-label">개인 정보 이용 동의 약관 <small id = redText> (필수)</small></label>
		<div class="col-sm-5" id="privacyInfoAgree">
			<div class="checkbox">
				<label> 
					<input type="checkbox" name="privacyInfoAgree"  id="privacyInfoAgree"  value="Y" autofocus="autofocus">
				</label>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="marketingAgree" class="col-sm-3 col-sm-offset-1 control-label">마케팅 수신 동의 <small id = marketing>(선택)</small></label>
		<div class="col-sm-5" id="marketingAgree">
			<div class="checkbox">
				<label> 
					<input type="checkbox" name="marketingAgree"  id="marketingAgree" value="Y" autofocus="autofocus">
				</label>
			</div>
		</div>
	</div>
	<div class="form-group" style="text-align:center;">
		<div class="col-sm-offset-4">
		<button type="button" id="btnJoin" class="btn btn-primary">가입</button>
		<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
		</div>
	</div>
</form>

<c:import url="/WEB-INF/views/layout/footer.jsp" />