$(document).ready(function(){

  $(".mn_box").mouseenter(function(){
    $(this).find(".img_cover").stop().animate({"left":"0"},400);
    $(this).parent(".diary_mn").find(".go_record").stop().animate({"width":"300px"}, 600);
    $(this).parent(".store_mn").find(".go_store").stop().animate({"width":"300px"}, 600);
  });
  $(".mn_box").mouseleave(function(){
    $(this).find(".img_cover").stop().animate({"left":"300"},400);
    $(this).parent(".diary_mn").find(".go_record").stop().animate({"width":"0"}, 600);
    $(this).parent(".store_mn").find(".go_store").stop().animate({"width":"0"}, 600);
  });


  function random_text()
{};
var random_text = new random_text();
// Set the number of text strings to zero to start
var number = 0;
// Incremental list of all possible Text
random_text[number++] = "사람을 대할 때도 나무를 대하듯이 하면 돼요.<br />무화과 나무한테 버찌가 안열린다고 화내는 건 어리석다는 거죠.<br />사람은 다 다르고, 각자 있는 그대로 받아들여야 해요. <br />상대의 부족한 부분을 우리의 욕망으로 채워 넣고, <br />제멋대로 실망하고 다툴 필요가 없어요.<br /><br />- 그리스인 조르바 -"
random_text[number++] = "구름 한 점 없는 활주로가 저 멀리 보인다. <br />어디선가 금곡조 우는 소리가 들려오는 것 같은데, <br />곧 심장을 흔드는 엔진의 소음과 한데 뒤섞인다. <br />어서 더 멀리 날아가. 네가 원하는 만큼, 어디까지든. <br />지금, 내가 가.<br /><br />- 버드 스트라이크 -"
random_text[number++] = "수십 번 읽어서 반들반들 닳아버린 책을<br />제자리로 돌려놓으며 이상하게 마음이 아팠다.<br />부러움이나 질투였는지도 몰랐다.<br />그녀에겐 이렇게 닳을만큼 지키고 싶은 것이 있을까.<br /><br />- 날씨가 좋으면 찾아가겠어요 -"
random_text[number++] = "눈을 뜨자 여전한 정적과 어둠이 기다리고 있다.<br />보이지 않는 눈송이들이 우리 사이에 떠 있는 것 같다.<br />결속한 가지들 사이로 우리가 삼킨 말들이 밀봉되고 있는 것 같다.<br /><br />- 작별하지 않는다 -"
random_text[number++] = "반드시 떼로 몰려다니며 유명한 휴양지를<br />미션 수행하듯이 들러서 사냥하듯 사진을 찍고<br />그 시간과 공간을 프레임 안에 박제하는 것만이<br />여행인 건 아니니까요.<br /><br />- 아가미 -"
random_text[number++] = "실수로 꼬리칸을 자르고 앞으로 달려가는 기차처럼,<br />예전의 내가 나라고 알던 사람을 나는 잃어버렸다.<br />스물의 나는 스물넷의 나로부터 완벽하게 분리되어<br />내가 다시는 돌아갈 수 없는 <br />어두운 레일 위에 우두커니 남겨졌다.<br /><br />- 쇼코의 미소- "
random_text[number++] = "나는 단단히 마음먹고선, 어찌 살아남았나 싶을 정도로<br /> 공격성이 없는 사람들로 주변을 채웠다.<br /> 첫번째 남편도 두번째 남편도 친구들도<br /> 함께 일했던 사람들도 야생에서라면 도태되었을 <br />무른 사람들이었기에 그들을 사랑했다.<br /> 그 무름을, 순정함을, 슬픔을, 유약함을.<br /><br />- 시선으로부터 -"
random_text[number++] = "당신의 노력은 절대로 쓸모없는 일이 되지는 않습니다.<br /> 마지막까지 꼭 믿어주세요. <br />마지막의 마지막 순간까지 믿어야 합니다.<br /><br />-나미야 잡화점의 기적-"
random_text[number++] = "결국 자신이 누군가에게 사랑받고 싶어하는 <br />사람이라는 것을 알게 됐으니까. <br />그것도 아주 간절하고 절실하게, <br />사랑받고 싶어하는 사람이라는 것을 인정하게 됐으니까.<br /><br />- 밝은 밤 -"
random_text[number++] = "그녀가 삶을 받아들이는 단계에 이르러서 <br />이제 나쁜 경험이 있으면 좋은 경험도 있다는 <br />사실을 깨달았기 때문인 듯했다. <br />노라는 자신이 삶을 끝내려고 했던 이유가<br /> 불행해서가 아니었음을 깨달았다.<br /> 불행에서 벗어날 수 없다고 믿었기 때문이었다.<br /><br />- 미드나잇 라이브러리 -"
// Create a random number with limits based on the number
// of possible random text strings
var random_number = Math.floor(Math.random() * number);
// Write out the random text to the browser
$(".book_random").html(random_text[random_number]);


});
