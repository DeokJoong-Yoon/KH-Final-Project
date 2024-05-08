# 💡 프로젝트 개요testtest

### 1. 기획 의도

- 매년 사교육비는 증가하는 추세다. 사교육비에 대한 부담이 증가함에 따라 학부모 입장에서는 오프라인 교육장소를 선택함에 있어서 신중한 선택이 요구될 것이다.
- 하지만, 선택을 하기에 앞서 참고할 기준들은 대부분 주관적이고, 관련 집단에 소속하지 못한다면 정보에 차별성이 생기는 일이 비일비재하다.
- 이런 배경에서 **오프라인 학원에 대한 정보를 쉽고 명확하기 파악할 수 있는 서비스**가 요구될 것으로 생각하여 기획하였다. **학원과 학부모(학생)의 중개** 서비스로 학원은 보다 많은 수강생들을 확보할 수 있고, 학부모(학생)은 객관화된 많은 정보를 통해 학원을 선택할 수 있게 된다.

<br/>  

### 2. 벤치마킹
![20240409_172942](https://github.com/kimzionoff/KH-Final-Project/assets/159001836/30ded0cb-7748-4775-b9ab-e05f2dc21685)

👍 <b>장점</b>

- 수강 연령, 수강 인원, 수준, 과목 등 다양한 조건을 통해 상세 검색이 가능
- 학원에 대한 평점도 기재되어 있어서 사용자가 쉽게 정보 수집 가능

👎 <b>단점</b>

- 학원과 개인이 사이트 내에서 소통할 수 있는 기능은 없음
- 비회원은 대부분의 기능 이용 불가

<br/>
  
![20240409_173739](https://github.com/kimzionoff/KH-Final-Project/assets/159001836/c2279fc5-d73f-4b24-9cd0-1b31e3ade639)

👍 <b>장점</b>

- 메인화면에서 바로 정보 검색 기능 이용 가능 ⇒ 사용자가 정보에 쉽게 접근 가능
- 로그인 하지 않아도 검색 기능 이용 가능
- 간결하고 한눈에 들어오는 직관적인 UI

👎 <b>단점</b>

- 접근 권한 제한에 대한 알림 메시지가 자세하지 않아서, 사용자 입장에서 혼란 야기 가능

<br/>
<hr/>
<br/>

# 💻 프로젝트 소개

### 1. 팀 소개
![팀원소개](https://github.com/kimzionoff/KH-Final-Project/assets/159001836/e235c515-df68-406f-be8d-2b90da8bcdd7)

<br/>

### 2. 기술 스택
- **운영체제** : Windows OS
- 사용 언어
    - **FrontEnd** : HTML5, CSS3, JavaScript, jQuery, Ajax
    - **BackEnd** : JAVA, JSP&Servlet, MyBatis
- **FrameWork / Library** : SpringBoot, JSTL
- **DB** : Oracle
- **Tool** : SQL developer, Eclipse
- **WAS** : Apache Tomcat 9.0
- **협업 도구** : Git, GitHub, Notion, Slack
- **API** : I’mport, 다음우편번호서비스, ‘서울시학원교습정보’ 공공데이터

<br/>

### 3. ERD
![Copy of MyEduMySelect (7)](https://github.com/kimzionoff/KH-Final-Project/assets/159001836/789c1f35-e6da-447c-a90d-9f39743b3afe)


<br/>

### 4. 시연영상
- <b>개인회원 접속 시연 영상</b> ▶️ https://www.youtube.com/watch?v=k4wLD-cFij8 
- <b>학원회원 접속 시연 영상</b> ▶️ https://www.youtube.com/watch?v=SmIECTzCU60
- <b>관리자 페이지 시연 영상</b> ▶️ https://youtu.be/34E1UUkdV8s?si=A306NB8oH01nOaqm

<br/>
<hr/>
<br/>  

# ⭐ 프로젝트 주요 기능

<br/>

### 📄 전체 학원 조회

![메인](https://github.com/kimzionoff/KH-Final-Project/assets/159001836/89968eaa-3a77-425d-ab45-ba6a181995d5)
![메인2](https://github.com/kimzionoff/KH-Final-Project/assets/159001836/44031546-44bb-4ec1-b773-84a7607ff15d)


- 메인페이지에서 서울시 내 지역 구/동을 선택하고 과목을 입력하여 검색하면 조건에 맞는 서울시 내 전체 학원 목록을 보여준다.
    - 비회원도 이용 가능한 기능
    - 서울 열린데이터 광장 공공데이터를 통해 데이터를 불러온다.

<br/>  

### 🔐 로그인/회원가입

- 로그인 5회 실패 시, 해당 아이디로 로그인이 10분 정지된다.
- 회원가입은 개인회원/학원회원으로 구분하여 진행한다.
    - 👱 **개인회원 가입**
        
        ![개인회원가입0](https://github.com/kimzionoff/KH-Final-Project/assets/159001836/02986cbd-bd69-4f32-942a-9d5fe262d85e)

        
        - 아이디, 이름, 비밀번호, 이메일, 생년월일, 주소, 전화번호를 입력한다.
        - 아이디, 이메일은 중복확인을 진행한다.
        - 주소입력은 다음 도로명 주소 API를 이용하여 진행한다.
    - 👨‍🏫 **학원회원 가입**
        
        ![마이페이지00](https://github.com/kimzionoff/KH-Final-Project/assets/159001836/48ca51aa-d219-4113-968c-704fe0cd43c6)

        
        - 아이디, 비밀번호, 사업자 번호, 담당자 이름, 담당자 이메일, 담당자 전화번호, 학원명, 학원주소, 학원 전화번호, 교습과목, 수강료, 대상학년, 키워드를 입력한다.
        - 아이디, 담당자 이메일은 중복확인을 진행한다.
        - 사업자 번호를 입력하면, 해당 정보를 전체 학원 소스 테이블에서 검색하여, 학원명과 학원 주소를 자동입력해준다.
        - 교습과목, 수강료, 대상학년은 주어진 범위 내에서 1개를 선택하고, 키워드는 주어진 키워드 내에서 최대 5개까지 선택할 수 있다.

<br/>  

### 👦 마이페이지

![마이페이지0](https://github.com/kimzionoff/KH-Final-Project/assets/159001836/97cc0551-d08a-43bd-9e34-6c471db42bfa)


- 회원 정보 수정 기능
- 자신이 작성한 글 / 댓글 단 게시물 / 좋아요 누른 게시물 조회 기능
- 회원 탈퇴 기능

<br/>  

### 🔍 맞춤형 검색 / 매칭

![매칭](https://github.com/kimzionoff/KH-Final-Project/assets/159001836/a36da019-9daa-454a-bcd9-24a58d2aeb58)
![매칭1](https://github.com/kimzionoff/KH-Final-Project/assets/159001836/c8ff52be-bcee-4806-a89a-fc3471b9c21b)


- 지역, 과목, 학년, 수강료, 키워드 등 세부 조건을 선택하여 해당하는 학원을 검색한다.
    - 개인회원만 사용 가능한 기능
    - 이때 검색되는 학원은 우리 사이트에 가입하여 1개월 내에 유료 결제를 진행한 학원만 대상으로 한다.
- 검색된 학원들을 대상으로 매칭 서비스를 이용할 수 있다.
    - 공개 매칭
        - 개인회원은 매칭게시판에 선택한 조건을 기반으로 한 공개 게시글을 자동 등록한다.
        - 모든 학원회원은 공개 매칭 게시글을 열람하고 댓글을 달 수 있다.
    - 비공개 매칭
        - 개인회원은 매칭게시판에 선택한 조건을 기반으로 한 비공개 게시글을 자동 등록한다.
        - 검색된 학원 목록 중 원하는 학원을 선택하여 해당 학원에게만 메일이 발송됨 + 해당 학원만 비공개 매칭 게시글에 접근 & 댓글 작성 가능하다.

    <br/>  

### 🗣️ 자유게시판

![자유](https://github.com/kimzionoff/KH-Final-Project/assets/159001836/98a71d31-19da-495c-9a0b-ec44ac90e205)


- 개인회원만 게시글과 댓글 작성이 가능한 게시판 / 학원 회원은 열람만 가능
- 학원 후기, 질문 글, 자유로운 사담글 등 다양한 글을 게시하여 회원 간 소통을 위한 게시판

<br/>  

### 🖼️ 홍보게시판

![홍보](https://github.com/kimzionoff/KH-Final-Project/assets/159001836/c50f5cde-ac65-4dcf-b20e-5ccbf2ebab82)


- 학원회원만 게시글 작성이 가능한 게시판 / 개인회원은 열람과 ‘찜’ 기능을 이용할 수 있음 (’찜’은 여러 번에 거쳐 자유롭게 등록/취소가 가능)
- 학원회원은 자신 학원을 소개/홍보하고, 개인회원은 학원에 대한 구체적인 정보를 얻을 수 있는 게시판

<br/>  

### 💰 결제

![결제](https://github.com/kimzionoff/KH-Final-Project/assets/159001836/9d9f3504-4843-4ca5-80fa-0dc58c467693)


- 학원회원은 매월 1회의 결제를 진행해야만 서비스를 이용 가능하다.
- 결제되지 않은 회원의 글은 홍보게시판에 노출되지 않음 + 맞춤형 검색 시 검색되지 않음
- 결제 서비스는 I’mport API를 이용하여 구현

<br/>  

### 🛃 관리자 페이지

![관리자](https://github.com/kimzionoff/KH-Final-Project/assets/159001836/4d8e1dff-5aca-4490-a7b5-66a27afa21c0)


- 메인 페이지에서 각 게시판의 최신 등록 게시물 5개, 최근 가입 회원 5명 목록 조회
- 좌측 메뉴를 통해 해당하는 메뉴로 이동하면, 각각의 게시판 관리 / 회원 관리 / 결제 관리 / 전체 학원 데이터 API 로딩 가능
- 전체 학원 데이터는 ‘서울 열린데이터 광장’에서 제공 받은 ‘서울시 내 전체 학원교습소 정보’ 공공데이터를 DB에 적재하여 사용한다. 관리자 페이지를 통해 해당 데이터를 수시로 새롭게 적재할 수 있다.
    
    ![관리자2](https://github.com/kimzionoff/KH-Final-Project/assets/159001836/84224867-0d2a-4c74-813f-4303d94ad955)


