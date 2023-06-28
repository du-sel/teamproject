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
		<h4 class="font-weight-bold">Shop Create</h4>
	</div>
	<div class="d-flex flex-column text-center">
		<form action="#" method="post" onsubmit="return shop_chk();">
			<div class="form-group">		<!-- 브랜드명 -->
				<div class="input-group">
					<input type="text" class="form-control" name="brand_name" placeholder="BrandName" onkeyup="chk_reset('brand')" required oninput="remove(1, this);">
					<button type="button" class="btn btn-chk" onclick="brand_chk('test')">Check</button>
				</div>
				<p></p>
			</div>
			<div class="form-group">		<!-- url주소 재확인 OR 변경 -->
				<div class="input-group">
					<input type="text" class="base-url" value="/shop/" disabled>
					<input type="text" class="form-control" name="url" placeholder="URL" value="admin" onkeyup="chk_reset('url')" oninput="remove(3, this);">
					<button type="button" class="btn btn-chk" onclick="url_chk('admin', false, 1)">Check</button>
				</div>
				<p></p>
			</div>
			<div class="form-group">		<!-- 이메일 재확인 -->
				<div class="input-group">
					<input type="email" class="form-control" name="email_chk" placeholder="UserEmail" required oninput="remove(2, this);">
				</div>
				<p></p>
			</div>
			<div class="form-group">		<!-- 폰번호 재확인 -->
				<div class="input-group">
					<input type="text" class="form-control" name="tel_chk" placeholder="PhoneNumber" maxlength="13" oninput="tel_hyphen(this);" required>
				</div>
				<p></p>
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-block btn-lg" value="Create">
			</div>            
		</form>
	</div>
</div>

<script>
	

</script>