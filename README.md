# 후보조회

![image](https://user-images.githubusercontent.com/104752202/210293020-dbaf12ba-5220-4e9c-8017-52902f9c4e8f.png)

```javascript
String sql = "select m.m_no, m.m_name, p.p_name, "
            +"decode(m.p_school,'1','고졸','2','학사','3','석사','4','박사'), "
            +"substr(m.m_jumin,1,6)||'-'||substr(m.m_jumin,7,7), m.m_city, "
            +"substr(p.p_tel1,1,2)||'-'||substr(p.p_tel2,1,4)||'-'||substr(p.p_tel3,1,4) "
            +"from tbl_member_202005 m, tbl_party_202005 p "
            +"where m.p_code = p.p_code";
```

decode를 사용하여 최종학력 번호에 맞는 학력을 부여합니다.     
substr와 '<b> - </b>' 을 사용하여 주민번호 앞뒤를 구분해줍니다.     
party 테이블에 있는 3가지에 전화번호를 ||로 이어줍니다.

# 투표하기

![image](https://user-images.githubusercontent.com/104752202/210293810-fe972afc-cd1a-4581-816a-3e3182d777e1.png)

```javascript
<script type="text/javascript">
	function checkValue() {
		if(!document.data.v_jumin.value) {
			alert("주민번호가 입력되지 않았습니다!");
			data.v_jumin.foucs;
			return false
		} else if(!document.data.v_name.value) {
			alert("성명이 입력되지 않았습니다!");
			data.v_name.foucs;
			return false
		} else if(document.data.m_no.value=="none") {
			alert("후보번호가 선택되지 않았습니다!");
			data.m_no.foucs;
			return false
		}
		 else if(!document.data.v_time.value) {
			alert("투표시간이 입력되지 않았습니다!");
			data.v_time.foucs;
			return false
		}
		 else if(!document.data.v_area.value) {
			alert("투표장소가 입력되지 않았습니다!");
			data.v_area.foucs;
			return false
		}
		 else if(!document.data.v_confirm.value) {
			alert("유권자확인이 선택되지 않았습니다!");
			data.v_confirm.foucs;
			return false
		}
	alert("투표하기 정보가 정상적으로 등록 되었습니다!")
	}
</script>
```

![image](https://user-images.githubusercontent.com/104752202/210300038-1083bc4f-da83-48c6-9124-af8d13cc1bbc.png)

유효성 검사 코드로 만약에 값을 넣지않으면 경고 메시지가 뜨며 다음으로 넘어가지 않습니다.

```javascript
<th>투표번호</th>
<td>
  <select name="m_no">
    <option value="none"></option>
    <option value="1">[1] 김후보</option>
    <option value="2">[2] 이후보</option>
    <option value="3">[3] 최후보</option>
    <option value="4">[4] 장후보</option>
    <option value="5">[5] 민후보</option>
  </select>
</td>
```

![image](https://user-images.githubusercontent.com/104752202/210293974-1bf8d243-e4fc-48de-b7e4-e73ff4d0f304.png)

select문을 사용하여 후보를 고를 수 있게 해줬습니다.     

<tr>
  <th>유권자확인</th>
  <td>
    <input type="radio" name="v_confirm" value="Y"> 확인
    <input type="radio" name="v_confirm" value="N"> 미확인
  </td>
</tr>

radio 버튼으로 확인, 미확인을 결정한다 이때 확인 value값으로는 Y를 주고 미확인 value로는 N를 줍니다.     

<tr>
  <td colspan="2" align="center">
    <input type="submit" value="투표하기">
    <input type="button" value="다시하기" onclick="re()">
  </td>
</tr>

투표하면 form문 발동 ! 다시하기 resex

# 투표검수조회

![image](https://user-images.githubusercontent.com/104752202/210300639-bfd10af7-9d51-4cbd-95f3-22a539e96be4.png)

```javascript
    StringBuffer sb = new StringBuffer();
    sb.append("select v_name ")
	    .append(" ,'19'||substr(v_jumin,1,2)||'년'||substr(v_jumin,3,2)||'월'||substr(v_jumin,5,2)||'일생' as v_birth                         ")
	    .append(" , '만 '||trunc(months_between(sysdate, to_date(substr('19'||v_jumin,1,8), 'yyyymmdd'))/12)||'세' as v_age                             ")
	    .append(" , case substr(v_jumin,7,1) when '1' then '남' when '2' then '여' when '3' then '남' when '4' then '여' end as v_gender ")
	    .append(" , m_no                                                                                                                    ")
	    .append(" , substr(v_time,1,2) || ':' || substr(v_time,3,2) as v_time                                                               ")
	    .append(" , case v_confirm when 'Y' then '확인' when 'N' then '미확인' end as v_confirm                                                ")
	    .append("from tbl_vote_202005 where V_AREA = '제1투표장'                                                                               ");

    String sql = sb.toString();
```

생년월일 궇했브니다.ㅇ
나이 만으로 구했습니다.
투표 중간에 : 이거 넣었습니다.

# 후보자 등수

![image](https://user-images.githubusercontent.com/104752202/210301142-0111beb8-878f-43a2-aaf3-bd87e4d4d4a3.png)

지금까지 투표했던 값들을 count로 출력해준다.

