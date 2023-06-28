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




const fileDOM2 = document.querySelector('#file2');
const previews = document.querySelectorAll('.image-box');

fileDOM2.addEventListener('change', () => {
  const imageSrc = URL.createObjectURL(fileDOM2.files[0]);
  previews.src = imageSrc;

});




