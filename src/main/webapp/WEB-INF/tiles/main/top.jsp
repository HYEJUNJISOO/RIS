<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="all__header">
    <div class="header__flex">
        <img src="/images/logo2.png" class="logo-img" />
        <ul>
            <li class="main__menu-items">
                업무메뉴
                <div class="sub__menu-item">
                    <a href="#">메뉴재생성</a>
                    <a href="#">로그아웃</a>
                </div>
            </li>
            <li class="main__menu-items">
                기준정보관리
                <div class="sub__menu-item">
                    <a href="#">공통코드관리</a>
                    <a href="#">기준정보 입력관리</a>
                    <a href="#">촬영실 관리</a>
                    <a href="#">촬영실 장비관리</a>
                    <a href="#">촬영코드 관리</a>
                </div>
            </li>
            <li class="main__menu-items">
                메뉴관리
                <div class="sub__menu-item">
                    <a href="/RISMENUE00.do">메뉴정보 관리</a>
                    <a href="/RISUSERQ00.do">사용자 관리</a>
                    <a href="/RISPRGMQ00.do">프로그램정보 관리</a>
                    <a href="/RISUSERMENU.do">사용자별 메뉴관리</a>
                    <a href="/RISBTNE00.do">프로그램 기능 권한 관리</a>
                </div>
            </li>
            <li class="main__menu-items">
                예약스케줄관리
                <div class="sub__menu-item">
                    <a href="/appn/risappn.do">예약기준관리</a>
                    <a href="/appn/ris0213List.do">예외 기준 관리</a>
                    <a href="/appn/ris0212List.do">휴일 기준관리</a>
                    <a href="/appn/ris1211e00.do">예약 관리</a>
                </div>
            </li>
            <li class="main__menu-items">
                환자관리
                <div class="sub__menu-item">
                    <a href="/pat/PatientSearch.do">환자정보 관리</a>
                </div>
            </li>
            <li class="main__menu-items">
                접수관리
                <div class="sub__menu-item">
                    <a href="/jubsu/RIS1201E00.do">영상 접수관리</a>
                    <a href="#">CD 접수관리</a>
                    <a href="/jubsu/RIS1201E02.do">이동촬영 접수</a>
                    <a href="/jubsu/RIS1201E03.do">처방 정보 관리</a>
                    <a href="/jubsu/RIS1201E04.do">영상 실시 관리</a>
                    <a href="#">워크리스트</a>
                </div>
            </li>
            <li class="main__menu-items">
                판독관리
                <div class="sub__menu-item">
                    <a href="#">영상 판독문구 관리</a>
                    <a href="#">영상 판독관리</a>
                </div>
            </li>
            <li class="main__menu-items">
                각종 통계현황
                <div class="sub__menu-item">
                    <a href="#">촬영실별 통계</a>
                    <a href="#">장비별 통계</a>
                    <a href="#">판독의별 통계</a>
                </div>
            </li>
        </ul>
    </div>
    <!-- 언어, 유저 정보 -->
    <div class="header__user">
        <select class="sel">
            <option value="">KOR</option>
            <option value="">ENG</option>
        </select>
        <p class="user">사용자:
            <span>관리자</span>
        </p>
        <img src="/images/icons/icon-key2.png" class="key-img" />
    </div>

</div>