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


//모달창 띄우기
const topimgModify = document.querySelector("#img-topimgmodify");
const profileimgModify = document.querySelector(".profileimgmodify");
const modalClose = document.querySelector(".modalclose");

  topimgModify.addEventListener('click', function() {
    $(".modal").css("display", "block");
  });

  profileimgModify.addEventListener('click', function() {
    $(".modal").css("display", "block");
  });

  modalClose.addEventListener('click', function() {
    $(".modal").css("display", "none");
  });



/* 이미지 미리보기 인데...하
const fileDOM2 = document.querySelector('#file2');
const previews = document.querySelectorAll('.image-box');

fileDOM2.addEventListener('change', () => {
  const imageSrc = URL.createObjectURL(fileDOM2.files[0]);
  previews.src = imageSrc;

});
*/

//상단이미지 업로드 코드 추가
var submit = document.getElementById('submitButton');
submit.onclick = showImage;     //Submit 버튼 클릭시 이미지 보여주기

function showImage() {
    var newImage = document.getElementById('image-show').lastElementChild;
    newImage.style.visibility = "visible";
    
    document.getElementById('image-upload').style.visibility = 'hidden';

    document.getElementById('fileName').textContent = null;     //기존 파일 이름 지우기
}


function loadFile(input) {
    var file = input.files[0];
s
    var name = document.getElementById('fileName');
    name.textContent = file.name;

    var newImage = document.createElement("img");
    newImage.setAttribute("class", 'img');

    newImage.src = URL.createObjectURL(file);   

    newImage.style.width = "70%";
    newImage.style.height = "70%";
    newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지 숨기기
    newImage.style.objectFit = "contain";

    var container = document.getElementById('image-show');
    container.appendChild(newImage);
};

// 탭 피드 부분 시작하자마자 보이게


