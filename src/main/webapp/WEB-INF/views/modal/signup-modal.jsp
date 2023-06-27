<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- https://www.tutorialrepublic.com/snippets/preview.php?topic=bootstrap&file=flat-modal-login-form-with-icons -->
<!-- https://www.codehim.com/bootstrap/bootstrap-4-modal-popup-login-form/ -->

<div class="modal-header border-bottom-0">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="chk_reset('close');">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
<div class="modal-body">
	<div class="form-title text-center">
		<h4 class="font-weight-bold">Sign Up</h4>
	</div>
	<div class="d-flex flex-column text-center">
		<form action="#" method="post" onsubmit="return sign_chk();">
			<div class="form-group">		<!-- 아이디(이메일) -->
				<div class="input-group">
					<input type="email" class="form-control" name="email" placeholder="UserEmail" onkeyup="chk_reset('email')" oninput="remove(2, this)" required>
					<button type="button" class="btn btn-chk" onclick="email_chk(true)">Check</button>
				</div>
				<p></p>
			</div>
			<div class="form-group">		<!-- 비밀번호 -->
				<div class="input-group">
					<input type="password" class="form-control" name="password" placeholder="Password" required onkeyup="pwd_chk();" oninput="pwd_validation('modal', this);">
				</div>
				<p></p>
			</div>
			<div class="form-group">		<!-- 비밀번호 확인 -->
				<div class="input-group">
					<input type="password" class="form-control" name="password_chk" placeholder="PasswordCheck" required onkeyup="pwd_chk();" oninput="remove(1, this)">
				</div>
				<p></p>
			</div>
			<div class="form-group">		<!-- 핸드폰번호 -->
				<div class="input-group">
					<input type="text" class="form-control" name="tel" placeholder="PhoneNumber" maxlength="13" oninput="tel_hyphen(this);" required>
				</div>
			</div>
			<div class="form-group">		<!-- url주소 -->
				<div class="input-group">
					<input type="text" class="base-url" value="/shop/" disabled>
					<input type="text" class="form-control" name="url" placeholder="ProfileURL" onkeyup="chk_reset('url')" oninput="remove(3, this)">
					<button type="button" class="btn btn-chk" onclick="url_chk('', true, 4)">Check</button>
				</div>
				<p></p>
			</div>
			<div class="form-group">		<!-- sns 링크 -->
				<div class="input-group">
              		<span class="input-group-addon"><i class="fa fa-instagram"></i></span>
					<input type="text" class="form-control" name="sns" placeholder="Instagram URL" oninput="remove(1, this)">
				</div>
				<div class="input-group">
              		<span class="input-group-addon"><i class="fa fa-youtube-play"></i></span>
					<input type="text" class="form-control" name="sns" placeholder="YouTube URL" oninput="remove(1, this)">
				</div>
				<div class="input-group">
              		<span class="input-group-addon"><i class="fa fa-twitter"></i></span>
					<input type="text" class="form-control" name="sns" placeholder="Twitter URL" oninput="remove(1, this)">
				</div>
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-block btn-lg" value="Sign Up">
			</div>            
		</form>
	</div>
</div>