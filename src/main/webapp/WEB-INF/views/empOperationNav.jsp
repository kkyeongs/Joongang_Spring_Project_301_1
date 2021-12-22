<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

    <div class="row" style=" margin: 3% auto; width: 65%; text-align: center; font-size: 18px; font-family: NanumBarunGothic;">

            <div id="clinicOperation" class="col" style="border: 1px solid; padding: 15px; border-color: #DCD3D5;"><a id="clinicOperationA" href="clinicOperation">진료 관리</a></div>
            <div id = "reservationOperation" class="col" style="border: 1px solid; padding: 15px; border-color: #DCD3D5; "><a id="reservationOperationA" href="reservationOperationCalendar">예약 관리</a></div>
            <div id = "noticeList" class="col" style="border: 1px solid; padding: 15px; border-color: #DCD3D5; "><a id="noticeListA" href="noticeList">공지사항 관리</a></div>
            <div id = "pConsultCount" class="col" style="border: 1px solid; padding: 15px; border-color: #DCD3D5; color: black"><a id="pConsultCountA" href="pConsultCount">1:1상담 관리</a>
             <c:if test="${resultTotal > 0 }">
             <img src="https://img.icons8.com/fluency/48/000000/brand-new.png" style="width: 30px; height: 30px;"/>
             </c:if>
            </div>
			<div id = "oconsultList" class="col" style="border: 1px solid; padding: 15px; border-color: #DCD3D5; color: black"><a id="oconsultListA" href="oconsultList">공개 상담 관리</a></div>

    </div>
     <div class="row" style=" margin: 3% auto; width: 65%; text-align: center; font-size: 18px; font-family: NanumBarunGothic;">

            <div id="punchOperation" class="col" style="border: 1px solid; padding: 15px; border-color: #DCD3D5; "><a id="punchOperationA" href="punch" >근무 기록</a></div>
			<c:if test="${varSessionState==4 }">
			<div id="MemberManagementMain" class="col" style="border: 1px solid; padding: 15px; border-color: #DCD3D5; "><a id="MemberManagementMainA" href="MemberManagementMain">회원 관리</a></div>
            <div id="EmpManagementMain"class="col" style="border: 1px solid; padding: 15px; border-color: #DCD3D5; "><a id="EmpManagementMainA" href="EmpManagementMain">직원 관리</a></div>
			</c:if>
			
			
			<div id="" class="col" style="border: 1px solid; padding: 15px; border-color: #DCD3D5; "><a id="" href="logout">로그아웃</a></div>
    </div>
