<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Button Calendar</title>
<style>
    .calendar {
        display: inline-block;
    }
    .calendar button {
        display: block;
        margin: 5px;
        padding: 5px 10px;
        border: 1px solid #ccc;
        cursor: pointer;
    }
    .calendar .months {
        display: none;
    }
    .calendar .month-table {
        border-collapse: collapse;
    }
    .calendar .month-table th,
    .calendar .month-table td {
        border: 1px solid #ccc;
        padding: 5px;
    }
</style>
</head>
<body>

<div class="calendar">
    <button id="prevMonthBtn">이전 달</button>
    <button id="nextMonthBtn">다음 달</button>
    <div class="months">
        <!-- 달력 요소는 이곳에 추가됩니다 -->
        <table class="month-table" id="calendarTable">
            <thead>
                <tr>
                    <th>일</th>
                    <th>월</th>
                    <th>화</th>
                    <th>수</th>
                    <th>목</th>
                    <th>금</th>
                    <th>토</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</div>

<script>
    const calendarTable = document.getElementById('calendarTable');

    // 이전 달 버튼 클릭 시 이벤트 처리
    document.getElementById('prevMonthBtn').addEventListener('click', () => {
        // 이전 달로 이동하는 로직 추가
        console.log('이전 달');
    });

    // 다음 달 버튼 클릭 시 이벤트 처리
    document.getElementById('nextMonthBtn').addEventListener('click', () => {
        // 다음 달로 이동하는 로직 추가
        console.log('다음 달');
    });

    // 달력 표시 함수
    function showCalendar(year, month) {
        // 해당 월의 첫 번째 날이 시작하는 요일과 총 일수 계산
        const firstDay = new Date(year, month - 1, 1).getDay(); // 해당 월의 첫째 날의 요일 (0: 일요일, 1: 월요일, ..., 6: 토요일)
        const lastDate = new Date(year, month, 0).getDate(); // 해당 월의 마지막 날짜

        // 표시할 달력 내용 생성
        let calendarHTML = '';
        let day = 1;

        for (let i = 0; i < 6; i++) {
            calendarHTML += '<tr>';
            for (let j = 0; j < 7; j++) {
                if ((i === 0 && j < firstDay) || day > lastDate) {
                    calendarHTML += '<td></td>'; // 첫 번째 주에서 시작 요일 이전 또는 마지막 날 이후의 칸은 비움
                } else {
                    calendarHTML += `<td>${day}</td>`; // 해당 날짜 표시
                    day++;
                }
            }
            calendarHTML += '</tr>';
            if (day > lastDate) break; // 마지막 날짜 이후에는 루프 중단
        }

        // 달력 내용을 테이블에 삽입
        calendarTable.querySelector('tbody').innerHTML = calendarHTML;
    }

    // 초기화면 업데이트
    const currentYear = new Date().getFullYear();
    const currentMonth = new Date().getMonth() + 1;
    showCalendar(currentYear, currentMonth);
</script>

</body>
</html>
