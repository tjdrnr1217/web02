var slides =document.querySelectorAll("#slides > img");
// 이미지는 querySelectorAll()메서드를 이용해서 가져온다
var prev = document.getElementById("prev");
// 버튼의 id값을 사용했으므로 getElementById()로 가져온다
var next = document.getElementById("next");

var current=0;

showslides(current) // 현재 이미지 표시
prev.onclick = prevSlide; //이전 이미지 표시
next.onclick = nextSlide;

function showslides(n) {
    for(var i=0; i<slides.length; i++){
        slides[i].style.display = "none" //모든 이미지를 화면에서 감춤
    }
    slides[n].style.display="block"; //n번째 이미지만 화면에 표시
}

function prevSlide(){
    if(current > 0) current -= 1; //0보다 크면 이전 위치로
    else current = slides.length - 1; // 그렇지 않으면 마지막위치로
    showslides(current); //이동한 위치의 이미지 표시
}

function nextSlide(){
    if(current < slides.length - 1) current += 1;
    else current = 0;
    showslides(current);
}



// $('#tab1').click(function(){
//     console.log('버튼1');
// });