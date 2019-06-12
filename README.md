

## Problem

문제점 1

KoNLP가 띄어쓰기를 기준으로 단어를 나눈다. 커뮤니티 글 대부분은 맞춤법을 지키지않고 쓰여진 글 / 정확한 형태소 분별 X 


문제점 2

![제목 없음](https://user-images.githubusercontent.com/49007889/58566725-17ddc700-826c-11e9-8806-bc794e38bf5b.png)


한석원 , 빡샘 ,빡T  모두 한사람을 의미하는 단어
 
문제점 3

반응이 실제인지 아닌지 어떤 기준으로 구분???

## Goal 

궁극적인 목표는 입시 커뮤니티에서 핫한 키워드가 무엇인지 알아보고, 그에대한 반응이 공작인지 진짜 반응인지 구분
 
키워드는 강사의 이름일수도 교재의 이름일수도 있다.

## how?

우선적으로 언급되는 빈도가 높은 단어를 추출 -> 워드 클라우드<br>
그것이 어떤 단어와 결합하는지 알아 본다. -> 바이그램
 
이후 이러한 반응이 실제인지 마케팅의 효과인지 구분하는것은 다음문제

## cheat

반응이 실제인지 마케팅인지 어떻게 구분할까?<br>
1. 특정 닉네임이 특정 키워드 를 자주 언급
2. 타 키워드에 대한 비판
3. 현재 마케팅 실시 여부
 
<br><br> 


## View

![워드 클라우드](https://user-images.githubusercontent.com/49007889/58539895-3ffd0400-8233-11e9-81df-2d065e601178.png)

![바이 그램](https://user-images.githubusercontent.com/49007889/58539894-3f646d80-8233-11e9-88fa-3baad69a9620.png)


----------------------------------
## 첫번째 난관 : 띄어쓰기
<p>KoNLP 사용시 제기되는 가장 큰 문제는 문장이 띄어쓰기로 분류된다는 점이다. 그렇다면 띄어쓰기를 검수해주는 패키지는 없을까? 
 찾아보니 KoSpacing 이라는 패키지가 있었다. <br> 올바른 맞춤법으로 작성된 문서를 학습시켜서 띄어쓰기를 가능하게 만든다. <br>
 여기서 학습시킬 데이터를 말뭉치(=corpus)라고 한다. 주로 자연어를 형태소로 분석하는데 쓰인다. 찾아낸 방법은 크게 2가지로 'KoSpacing : 한글 자동 띄어쓰기 패키지'를 사용하는 것과 hmm 패키지를 이용한 방법도 존재하였으나 후자는 직접 딥러닝 모델을 돌려야 하므로 패스<br>
 패키지를 불러와서 spacing 함수를 사용하자 다음 오류가 발생하였다.
 <br>
  'Error in get("model", envir = .KoSpacingEnv) : object 'model' not found ' 
 <br>
 해결방법을 찾아서 아나콘다를 새로 설치해보고 파이썬으로도 실행해 봤지만 오류는 계속되었다.
 <br>

koSpacing에 관련해서는 <a href="https://mrchypark.github.io/post/kospacing-%ED%95%9C%EA%B8%80-%EB%9D%84%EC%96%B4%EC%93%B0%EA%B8%B0-%ED%8C%A8%ED%82%A4%EC%A7%80%EB%A5%BC-%EC%82%AC%EC%9A%A9%ED%95%B4%EB%B3%B4%EC%9E%90/">여기</a> 와 <a href="http://freesearch.pe.kr/archives/4759">여기</a>를 참고하였다.</p>

## 두번째 난관 
<p>데이터의 다양성을 확보하기위해서 수만휘 게시글 크롤링을 시도하였다. 시드넘버, 닉네임, 제목을 크롤링하는것은 성공했으나 댓글을 읽어오는과정에서 발생한 에러를 아직까지 해결하지 못했다. 목표가 댓글공작여부를 확인하는건데 댓글 데이터가 없다. <br>
현재 가능한 방법은 모든 텍스트를 가져와서 분류하는 방법인데 댓글 내용의 길이가 일정하지 않고, 몇개의 댓글이 추가될지 모르기 때문에 보류한 상태이다.
</p>

## 다시 돌아 제자리로
<p>
지금은 자연어 처리를 할 수 없으니 데이터의 다양성을 추구해야한다.
수만휘 말고도 유명한 입시커뮤니티는 어디인가?
</p>
