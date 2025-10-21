<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
   margin: 50px;
}
.row {
   width: 960px;
   margin: 0px auto;
}
</style>
<script type="text/javascript">
window.onload=()=>{
	// window.onload=function(){}
	const movies = [{"startYearDate":"2025.10.20",
		"endYearDate":"2025.10.20",
		"startDate":"2025년 10월 20일(월)",
		"endDate":"2025년 10월 20일(월)",
		"movieCd":"20256757","showDt":"20251020",
		"thumbUrl":"/common/mast/movie/2025/09/thumb/thn_f1c06c91c0a74b23b911a7512ad36ba8.jpg",
		"movieNm":"극장판 체인소 맨: 레제편",
		"movieNmEn":"Chainsaw Man The Movie: Reze Arc",
		"synop":"인기 애니메이션 '체인소 맨' 첫 공식 극장판 국내 상륙!\r\n압도적 배틀 액션이 스크린에서 폭발한다!\r\n\r\n데블 헌터로 일하는 소년 ‘덴지’는 조직의 배신으로 죽음에 내몰린 순간\r\n전기톱 악마견 ‘포치타’와의 계약으로 하나로 합쳐져\r\n누구도 막을 수 없는 존재 ‘체인소 맨’으로 다시 태어난다.\r\n\r\n악마와 사냥꾼, 그리고 정체불명의 적들이 얽힌 잔혹한 전쟁 속에서\r\n‘레제’라는 이름의 미스터리한 소녀가 ‘덴지’ 앞에 나타나는데…\r\n‘덴지’는 사랑이라는 감정에 이끌려 지금껏 가장 위험한 배틀에 몸을 던진다!",
		"prdtYear":"2025","indieYn":null,"artmovieYn":null,"multmovieYn":null,
		"showTm":"99","showTs":"52",
		"director":null,"prNm":null,"dtNm":"소니픽쳐스엔터테인먼트코리아주식회사극장배급지점",
		"repNationCd":"일본",
		"movieType":"장편",
		"moviePrdtStat":"개봉",
		"genre":"애니메이션,액션,어드벤처",
		"watchGradeNm":"15세이상관람가",
		"openDt":"20250924",
		"salesAmt":257348600,
		"audiCnt":25169,
		"totalSalesAmt":23902700780,"totalAudiCnt":2240732,"scrCnt":787,"showCnt":2780,"rank":1,"rankInten":0,"rankOldAndNew":"OLD","rownum":1},{"startYearDate":"2025.10.20","endYearDate":"2025.10.20","startDate":"2025년 10월 20일(월)","endDate":"2025년 10월 20일(월)","movieCd":"20228988","showDt":"20251020","thumbUrl":"/common/mast/movie/2025/10/thumb/thn_cdec79f1abf74ada9a3fabf4c1101923.jpg","movieNm":"보스","movieNmEn":"BOSS","synop":"갑작스러운 보스의 죽음! 차기 보스는 누구?!\r\n\r\n보스 후보1. 차기 보스 0순위지만, 조직이 아닌 중식당 미미루로 전국구 평정을 꿈꾸는 ‘순태’(조우진)\r\n보스 후보2. 조직 내 입지는 충분하나 운명처럼 만난 탱고에 인생을 건, 차기 보스 유력자 ‘강표’(정경호)\r\n보스 후보3. 유일하게 보스를 갈망하지만, 그 누구도 보스감이라 생각하지 않는, 보스 부적격자 ‘판호’(박지환)\r\n\r\n그리고\r\n미미루 배달원으로 잠입한 언더커버 경찰 ‘태규’(이규형)까지 가세하며\r\n치열한 보스 ‘양보’ 전은 예측불허 대혼란으로 치닫는데..\r\n\r\n세력 전쟁보다 살벌한 보스 대결 양보 전쟁!\r\n올 추석, 웃기는 놈이 보스다!","prdtYear":"2025","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"97","showTs":"50","director":"라희찬","prNm":"(주)하이브미디어코프","dtNm":"(주)하이브미디어코프,(주)마인드마크","repNationCd":"한국","movieType":"장편","moviePrdtStat":"개봉","genre":"코미디,액션","watchGradeNm":"15세이상관람가","openDt":"20251003","salesAmt":137742100,"audiCnt":14948,"totalSalesAmt":21909803400,"totalAudiCnt":2273132,"scrCnt":763,"showCnt":2332,"rank":2,"rankInten":0,"rankOldAndNew":"OLD","rownum":2},{"startYearDate":"2025.10.20","endYearDate":"2025.10.20","startDate":"2025년 10월 20일(월)","endDate":"2025년 10월 20일(월)","movieCd":"20243561","showDt":"20251020","thumbUrl":"/common/mast/movie/2025/09/thumb/thn_03ec0dc1090648b1b1e06987ebffc863.jpg","movieNm":"어쩔수가없다","movieNmEn":"NO OTHER CHOICE","synop":"‘다 이루었다’는 생각이 들 만큼 삶에 만족하던 25년 경력의 제지 전문가 ‘만수’(이병헌).\r\n아내 ‘미리’(손예진), 두 아이, 반려견들과 함께 행복한 일상을 보내던 만수는\r\n회사로부터 돌연 해고 통보를 받는다. \r\n\r\n“미안합니다. 어쩔 수가 없습니다.”\r\n\r\n목이 잘려 나가는 듯한 충격에 괴로워하던 만수는,\r\n가족을 위해 석 달 안에 반드시 재취업하겠다고 다짐한다.\r\n그 다짐이 무색하게도, 그는 1년 넘게 마트에서 일하며 면접장을 전전하고,\r\n급기야 어렵게 장만한 집마저 빼앗길 위기에 처한다. \r\n \r\n무작정 [문 제지]를 찾아가 필사적으로 이력서를 내밀지만,\r\n‘선출’(박희순) 반장 앞에서 굴욕만 당한다.\r\n[문 제지]의 자리는 누구보다 자신이 제격이라고 확신한 만수는 모종의 결심을 한다.\r\n\r\n“나를 위한 자리가 없다면, 내가 만들어서라도 취업에 성공하겠다.”","prdtYear":"2025","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"138","showTs":"44","director":"박찬욱","prNm":"모호필름,씨제이이엔엠 스튜디오스 주식회사","dtNm":"(주)씨제이이엔엠","repNationCd":"한국","movieType":"장편","moviePrdtStat":"개봉","genre":"스릴러,코미디","watchGradeNm":"15세이상관람가","openDt":"20250924","salesAmt":98896490,"audiCnt":10389,"totalSalesAmt":27318437130,"totalAudiCnt":2788315,"scrCnt":718,"showCnt":1697,"rank":3,"rankInten":1,"rankOldAndNew":"OLD","rownum":3},{"startYearDate":"2025.10.20","endYearDate":"2025.10.20","startDate":"2025년 10월 20일(월)","endDate":"2025년 10월 20일(월)","movieCd":"20258183","showDt":"20251020","thumbUrl":"/common/mast/movie/2025/09/thumb/thn_30d10bece4d24226ac6bd72d19b72b19.jpg","movieNm":"원 인 어 밀리언","movieNmEn":"ONE IN A MILL10N","synop":"2015년, “One in a million, TWICE!”라는 인사와 함께\r\n세상에 첫발을 내디딘 트와이스.\r\n\r\n‘CHEER UP’, ‘TT’, ‘What is Love?’, ‘FANCY’, ‘Feel Special’ 등\r\n시대를 대표하는 히트곡으로 K-POP을 넘어 전 세계를 사로잡았다.\r\n\r\n최고의 자리에 오르기까지 쏟아부은 땀과 노력, 글로벌 투어의 화려한 스포트라이트,\r\n멤버들이 직접 들려주는 성장과 우정, 그리고 미래에 대한 고민.\r\n\r\n무대 위 반짝이는 조명보다 더 눈부셨던 10년, 그 중심에는 언제나 팬클럽 ‘ONCE’가 있었다.\r\n한 번도 공개된 적 없는 진솔한 인터뷰와\r\n트와이스 멤버들과 ‘ONCE’ 모두에게 선물 같은 10주년을 준비하는 과정을 통해,\r\n트와이스가 서로에게, 그리고 팬들에게 어떤 존재였는지를 생생하게 전한다.\r\n\r\n데뷔 10주년을 맞아,\r\n하나뿐인 특별한 그룹 트와이스의 존재 이유를 담은 영화\r\n<원 인 어 밀리언(ONE IN A MILL10N)>이 스크린에서 펼쳐진다.","prdtYear":"2025","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"120","showTs":"49","director":null,"prNm":"(주)미스틱스토리","dtNm":"씨제이 씨지브이(CJ CGV)(주),씨제이포디플렉스 주식회사","repNationCd":"한국","movieType":"장편","moviePrdtStat":"개봉","genre":"다큐멘터리,공연","watchGradeNm":"전체관람가","openDt":"20251020","salesAmt":154175000,"audiCnt":6167,"totalSalesAmt":154175000,"totalAudiCnt":6167,"scrCnt":35,"showCnt":74,"rank":4,"rankInten":-4,"rankOldAndNew":"NEW","rownum":4},{"startYearDate":"2025.10.20","endYearDate":"2025.10.20","startDate":"2025년 10월 20일(월)","endDate":"2025년 10월 20일(월)","movieCd":"20257658","showDt":"20251020","thumbUrl":"/common/mast/movie/2025/09/thumb/thn_04c476c93dcf4d92b5f5f18b2cc6d96e.jpg","movieNm":"극장판 주술회전: 회옥·옥절","movieNmEn":"JUJUTSU KAISEN: Hidden Inventory ／ Premature Death – The Movie","synop":"최강의 두 사람, 다시는 돌아갈 수 없는 푸른 봄\r\n2006년 봄, 주술고등전문학교 시절의 고죠 사토루와 게토 스구루.\r\n불사의 술식을 가진 주술계 핵심, 텐겐으로부터 의뢰가 도착한다.\r\n의뢰는 두 가지, 텐겐과 적합자인 성장체 아마나이 리코라는 소녀의 ‘호위’와 ‘말소’.\r\n두 사람은 주술계 존속을 위한 호위 임무에 나서지만\r\n후시구로라 불리는 ‘주술사 킬러’가 암살을 노리고 나타난다.\r\n\r\n최강의 주술사와 최악의 주저사가 된 고죠와 게토,\r\n두 사람의 엇갈린 운명의 과거가 밝혀진다.\r\n","prdtYear":"2025","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"110","showTs":"6","director":"고쇼조노 쇼타","prNm":null,"dtNm":"메가박스중앙(주)","repNationCd":"일본","movieType":"장편","moviePrdtStat":"개봉","genre":"애니메이션","watchGradeNm":"15세이상관람가","openDt":"20251016","salesAmt":57040970,"audiCnt":5742,"totalSalesAmt":1423664040,"totalAudiCnt":139485,"scrCnt":589,"showCnt":1361,"rank":5,"rankInten":-2,"rankOldAndNew":"OLD","rownum":5},{"startYearDate":"2025.10.20","endYearDate":"2025.10.20","startDate":"2025년 10월 20일(월)","endDate":"2025년 10월 20일(월)","movieCd":"20256397","showDt":"20251020","thumbUrl":"/common/mast/movie/2025/08/thumb/thn_27dcbf5d9b5d4aeab05d820bda5712a6.jpg","movieNm":"원 배틀 애프터 어나더","movieNmEn":"One Battle After Another","synop":"자유를 외치는 혁명가 ‘밥 퍼거슨’(레오나르도 디카프리오).\r\n16년이 흐른 뒤, 후유증으로 모든 걸 내려놓고 무너진 삶을 살고 있다.\r\n\r\n그에게 남은 유일한 희망은 \r\n세상 누구보다 소중한 딸 ‘윌라 퍼거슨’(체이스 인피니티)뿐.\r\n\r\n자신의 몸도, 딸과의 관계도 엉망진창인 삶을 살아가던 중\r\n과거의 숙적이었던 ‘스티븐 J. 록조’(숀 펜)가 딸을 납치한다.\r\n\r\n딸을 찾기 위해서 옛 동료들의 도움이 절실하지만,\r\n오래된 동료들은 만나기조차 쉽지 않은데…\r\n\r\n지나온 시간만큼 더 지독해진 숙적을 상대로\r\n끝나지 않는 싸움을 끝내기 위한 뜨거운 추격이 시작된다!","prdtYear":"2025","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"161","showTs":"31","director":"폴 토마스 앤더슨","prNm":null,"dtNm":"워너브러더스 코리아(주)","repNationCd":"미국","movieType":"장편","moviePrdtStat":"개봉","genre":"범죄,액션","watchGradeNm":"15세이상관람가","openDt":"20251001","salesAmt":51607750,"audiCnt":5006,"totalSalesAmt":4849335930,"totalAudiCnt":452832,"scrCnt":503,"showCnt":892,"rank":6,"rankInten":0,"rankOldAndNew":"OLD","rownum":6},{"startYearDate":"2025.10.20","endYearDate":"2025.10.20","startDate":"2025년 10월 20일(월)","endDate":"2025년 10월 20일(월)","movieCd":"20253852","showDt":"20251020","thumbUrl":"/common/mast/movie/2025/09/thumb/thn_ea1cea1f3a9c4c2b8923b8e102c8b1c3.jpg","movieNm":"퍼스트 라이드","movieNmEn":"The First Ride","synop":"“끝을 보는 놈, 해맑은 놈, 잘생긴 놈, 눈 뜨고 자는 놈, 사랑스러운 놈”\r\n10월, 뭉치면 더 웃기는 놈들의 대환장 코미디가 온다!\r\n\r\n어린 시절부터 한 몸처럼 붙어 다닌 24년 지기 사총사,\r\n태정(강하늘), 도진(김영광), 연민(차은우), 금복(강영석)의 꿈은 바로 함께 하는 여행! \r\n\r\n학창 시절에 이루지 못했던 꿈을 위해 생애 첫 해외여행을 떠나는 날, \r\n계획에 없던 옥심(한선화)까지 합류하며 이들의 여행은 점점 환장의 세계로 흘러가는데…! ","prdtYear":"2025","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"116","showTs":"4","director":"남대중","prNm":"주식회사 브레인샤워,주식회사 티에이치스토리(TH STORY)","dtNm":"(주)쇼박스","repNationCd":"한국","movieType":"장편","moviePrdtStat":"개봉예정","genre":"코미디,드라마","watchGradeNm":"12세이상관람가","openDt":"20251029","salesAmt":42102000,"audiCnt":4678,"totalSalesAmt":68932000,"totalAudiCnt":7218,"scrCnt":30,"showCnt":30,"rank":7,"rankInten":20,"rankOldAndNew":"OLD","rownum":7},{"startYearDate":"2025.10.20","endYearDate":"2025.10.20","startDate":"2025년 10월 20일(월)","endDate":"2025년 10월 20일(월)","movieCd":"20256684","showDt":"20251020","thumbUrl":"/common/mast/movie/2025/08/thumb/thn_9fbe0b4a3bfe48cc976550294b197dbc.jpg","movieNm":"웨폰","movieNmEn":"Weapons","synop":"평범한 수요일,\r\n어느 마을 학교의 같은 반 학생 17명이 등교하지 않는다.\r\n그날 새벽 2시 17분, 잠에서 깬 아이들이 어둠 속으로 달려가 돌아오지 않았기 때문이다.\r\n유일하게 남은 아이는 입을 다물고, \r\n사라진 아이들을 찾으려는 이들은 악몽 같은 현실을 마주하게 되는데…\r\n","prdtYear":"2025","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"128","showTs":"23","director":"잭 크레거","prNm":null,"dtNm":"워너브러더스 코리아(주)","repNationCd":"미국","movieType":"장편","moviePrdtStat":"개봉","genre":"공포(호러),미스터리","watchGradeNm":"청소년관람불가","openDt":"20251015","salesAmt":40383400,"audiCnt":4071,"totalSalesAmt":587113590,"totalAudiCnt":58499,"scrCnt":482,"showCnt":757,"rank":8,"rankInten":-1,"rankOldAndNew":"OLD","rownum":8},{"startYearDate":"2025.10.20","endYearDate":"2025.10.20","startDate":"2025년 10월 20일(월)","endDate":"2025년 10월 20일(월)","movieCd":"20253289","showDt":"20251020","thumbUrl":"/common/mast/movie/2025/08/thumb/thn_9491bbb3b8da4c7aa11fe50e0c1ed2b4.jpg","movieNm":"극장판 귀멸의 칼날: 무한성편","movieNmEn":"Demon Slayer: Kimetsu No Yaiba Infinity Castle Arc","synop":"혈귀로 변해버린 여동생 네즈코를 인간으로 되돌리기 위해 혈귀를 사냥하는 조직인 《귀살대》에 입대한 카마도 탄지로.\r\n입대 후 동료인 아가츠마 젠이츠, 하시비라 이노스케와 함께 많은 혈귀와 싸우고, 성장하면서 세 사람의 우정과 유대는 깊어진다.\r\n\r\n탄지로는 《귀살대》 최고위 검사인 《주》와도 함께 싸웠다.\r\n「무한열차」에서는 염주・렌고쿠 쿄쥬로, 「유곽」에서는 음주・우즈이 텐겐, \r\n「도공 마을」에서는 하주・토키토 무이치로, 연주・칸로지 미츠리와 함께 혈귀를 상대로 격렬한 전투를 벌였다.\r\n\r\n그 후 다가올 혈귀와의 결전에 대비해 귀살대원들과 함께 《주》가 주도하는 합동 강화 훈련에 참가해 훈련을 받던 도중\r\n《귀살대》의 본부인 우부야시키 저택에 나타난 키부츠지 무잔.\r\n어르신의 위기에 달려온 《주》들과 탄지로였지만, 무잔의 술수로 의문의 공간으로 떨어지고 말았는데.\r\n\r\n탄지로 일행이 떨어진 곳, 그곳은 혈귀의 본거지 《무한성》─ \r\n“귀살대”와 “혈귀”의 최종 결전의 포문이 열린다.\r\n","prdtYear":"2025","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"155","showTs":"0","director":"소토자키 하루오","prNm":null,"dtNm":"(주)씨제이이엔엠","repNationCd":"일본","movieType":"장편","moviePrdtStat":"개봉","genre":"애니메이션","watchGradeNm":"15세이상관람가","openDt":"20250822","salesAmt":39237500,"audiCnt":3921,"totalSalesAmt":59115195190,"totalAudiCnt":5472536,"scrCnt":443,"showCnt":649,"rank":9,"rankInten":-4,"rankOldAndNew":"OLD","rownum":9},{"startYearDate":"2025.10.20","endYearDate":"2025.10.20","startDate":"2025년 10월 20일(월)","endDate":"2025년 10월 20일(월)","movieCd":"20243864","showDt":"20251020","thumbUrl":"/common/mast/movie/2025/08/thumb/thn_557777e4a4794ff5a5dde3a88ec8fbf2.jpg","movieNm":"연의 편지","movieNmEn":"Your Letter","synop":"여름 방학이 지나고 새로운 학교로 전학 오게 된 ‘소리’는\r\n자신의 책상 서랍에서 학교에 대한 소개와\r\n다음 편지를 찾을 수 있는 힌트가 담긴 익명의 편지 한 통을 발견한다.\r\n \r\n“내 편지를 더 읽고 싶다면 두 번째 편지를 찾아줘!”\r\n \r\n이어지는 편지를 따라서 보물찾기하듯 학교 곳곳을 누비던 ‘소리’는\r\n어쩐지 동급생 ‘동순’과 자꾸 마주치고,\r\n‘소리’와 ‘동순’은 함께 편지를 찾는 친구가 된다.\r\n \r\n하나, 둘… 편지를 모을수록 특별한 인연이 이어지자,\r\n‘소리’는 편지를 보낸 사람에 대한 궁금증이 점차 커져가게 되는데… \r\n \r\n“마지막 편지까지 찾아서, 너에게 고맙다고 말하고 싶어”","prdtYear":"2025","indieYn":null,"artmovieYn":null,"multmovieYn":"Y","showTm":"96","showTs":"23","director":"김용환","prNm":"스튜디오리코 주식회사,스튜디오엔(주)","dtNm":"롯데컬처웍스(주)롯데엔터테인먼트","repNationCd":"한국","movieType":"장편","moviePrdtStat":"개봉","genre":"애니메이션","watchGradeNm":"12세이상관람가","openDt":"20251001","salesAmt":15369440,"audiCnt":1722,"totalSalesAmt":1968335230,"totalAudiCnt":208811,"scrCnt":260,"showCnt":312,"rank":10,"rankInten":0,"rankOldAndNew":"OLD","rownum":10}]
	let html = '';
	movies.map((movie)=>{
		// map(function(movie){})
		html += '<tr>'
		     +'<td>' +movie.rank+ '</td>'
		     + '<td><img src=https://www.kobis.or.kr' +movie.thumbUrl+' width=35 height=35</td>' 
		     +'<td>' +movie.movieNm+ '</td>'
		     +'<td>' +movie.genre+ '</td>'
		     +'<td>' +movie.director+ '</td>'
		     +'</tr>'
	})
	document.querySelector('tbody').innerHTML = html
}
</script>
</head>
<body>
   <div class="container">
      <div class="row">
         <table class="table">
            <thead>
               <tr>
                  <th class="text-center">순위</th>
                  <th class="text-center"></th>
                  <th class="text-center">영화명</th>
                  <th class="text-center">장르</th>
                  <th class="text-center">감독</th>
               </tr>
            </thead>
            <tbody>
               
            </tbody>
         </table>
      </div>
   </div>
</body>
</html>