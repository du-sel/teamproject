/*
// 상단 수정이미지 보이게 하기
const topimgContainer = document.querySelector('.topimg');

topimgContainer.addEventListener('mouseenter', function() {
  const topimgModify = topimgContainer.querySelector('#img-topimgmodify');
  topimgModify.style.display = 'block';
});

topimgContainer.addEventListener('mouseleave', function() {
  const topimgModify = topimgContainer.querySelector('#img-topimgmodify');
  topimgModify.style.display = 'none';
});
*/

/*
// 프로필 수정이미지 보이게 하
const profileimgContainer = document.querySelector('.profilediv');

profileimgContainer.addEventListener('mouseenter', function() {
  const profileimgModify = profileimgContainer.querySelector('.profileimgmodify');
  profileimgModify.style.display = 'block';
});

profileimgContainer.addEventListener('mouseleave', function() {
  const profileimgModify = profileimgContainer.querySelector('.profileimgmodify');
  profileimgModify.style.display = 'none';
});
*/

//모달창 띄우기
const topimgModify = document.querySelector("#my-topimgdiv");
const profileimgModify = document.querySelector("#my-profileimg");
const modalClose = document.querySelector(".modalclose");

  // 배경 이미지
  topimgModify.addEventListener('click', function() {
    $(".modal").css("display", "block");
    $("#folder").val("background");
    
    let src = $("#my-topimgdiv img").attr("src");
    modalClose.addEventListener('click', () => modal_close('my-topimgdiv img', src));
    $('#chooseFile').on('change', () => loadFile('my-topimgdiv img', event))
  });

  // 프로필 이미지
  profileimgModify.addEventListener('click', function() {
    $(".modal").css("display", "block");
    $("#folder").val("profile");
    
    let src = $("#my-profileimg").attr("src");
    modalClose.addEventListener('click', () => modal_close('my-profileimg', src));
    $('#chooseFile').on('change', () => loadFile('my-profileimg', event))
  });

/*
  modalClose.addEventListener('click', function() {
    $(".modal").css("display", "none");
  });*/
  
  // 모달 닫는 함수(+ 이미지 초기화)
  function modal_close(id, src){
  	$(".modal").css("display", "none");
	$("#fileName").text("");
  	
	$("#"+id).attr("src", src);
	$("#chooseFile").off("change");				// 이벤트 제거
  }
  

//상단이미지 업로드 코드 추가
/*
var submit = document.getElementById('submitButton');	// 미리보기 버튼
submit.onclick = showImage;     //Submit 버튼 클릭시 이미지 보여주기

function showImage() {
    var newImage = document.getElementById('image-show').lastElementChild;
    newImage.style.visibility = "visible";
    
    document.getElementById('image-upload').style.visibility = 'hidden';

    document.getElementById('fileName').textContent = null;     //기존 파일 이름 지우기
}
*/


function loadFile(id, event) {
    var file = event.target.files[0];
	console.log(event.target.files.length);
    var name = document.getElementById('fileName');
    name.textContent = file.name;
    
 	var reader = new FileReader(); 
    reader.onload = function(e) {
        $("#"+id).attr("src", e.target.result);
    }
    console.log(id);
    reader.readAsDataURL(file);

	/*
    var newImage = document.createElement("img");
    newImage.setAttribute("class", 'Img');

    newImage.src = URL.createObjectURL(file);   

    newImage.style.width = "70%";
    newImage.style.height = "70%";
    newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지 숨기기
    newImage.style.objectFit = "contain";
    newImage.style.position = "relative";
    newImage.style.zIndex = 800; 
	
    var container = document.getElementById('image-show');
    container.appendChild(newImage);
    */
};