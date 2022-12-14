<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <c:set var="path" value="${pageContext.request.contextPath}" />
    <!doctype html>

    <html lang="ko">

    <head>
        <!-- ======= HTML <head : CSS / Google Font / Favicons ======= -->
        <jsp:include page="../htmlHead.jsp" flush="true" />
        <link href="${path}/resources/css/admin_header_footer.css" rel="stylesheet">
        <link href="${path}/resources/css/8_admin_page.css" rel="stylesheet">
        <!-- ========================================================= -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
        <title>Admin - Student</title>
        <script>
            const ADMIN = '${_ADMIN_.ad_name}';
            const loginResult = '${_ADMIN_RESULT_}';
            if (loginResult != null && loginResult.length > 0) {
                alert(ADMIN + loginResult);
            }
        </script>

    </head>

    <body>
        <!-- ======= Admin Header ======= -->
        <header id="header" class="header fixed-top">
            <div class="container-fluid container-xl d-flex align-items-center">
                <a href="/admin" class="logo d-flex align-items-center img-fluid animated ">
                    <img src="${path}/resources/img/admin_logo.png" alt=""></a>

                <div class="administrator">
                    <ul>
                        <li><a href="#" onclick="logout()">${_ADMIN_.ad_name}</a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- ======= Admin Header ======= -->

        <!-- ======= Section ======= -->
        <div class="container">

            <!-- ======= main Section ======= -->
            <section id="main" class="container">
                <div class="row">

                <!-- ========== admin side ========== -->
                <div id="nav" class="col-lg-3">

                    <div class="list-group">
                        <a href="/admin/student" class="list-group-item list-group-item-action px-lg-4 fw-bold ">?????? ??????</a>
                        <a href="/admin/stator" class="list-group-item list-group-item-action px-lg-4">?????????</a>
                        <a href="/admin/answerBoard_OK" class="list-group-item list-group-item-action px-lg-4">?????? ?????????</a>
                        <a href="/admin/adminFAQ" class="list-group-item list-group-item-action px-lg-4 ">?????? ?????? ??????</a>
                        <a href="/admin/sale/sell" class="list-group-item list-group-item-action px-lg-4">?????? ??????</a>
                        <a href="/admin/signUp_comfim" class="list-group-item list-group-item-action px-lg-4">?????? ?????? ??????</a>
                    </div>
                </div>


            <div id="contents" class="col-lg-9">

                <h3 class="fw-bold">?????? ??????</h3>

                <!-- FROM -->
                <div class="ad-search">

                    <ul>
                        <!-- Tap -->
                        <li>
                            <div class="manage-tap">
                                <a href="/admin/student" class="btn btn-dark">??????</a>
                                <a href="/admin/tutor" class="btn btn-dark">??????</a>
                                <a href="/admin/humenMember" class="btn bg-blue">?????? ??????</a>
                            </div>
                        </li>

                        <!-- Select/Search -->
                        <li>
                            <div class="select-search">
                                <ul>
                                    <li>
                                        <form action=""></form>
                                        <select class="select-box" name="ad-search">
                                            <option>?????????</option>
                                            <option>??????</option>
                                        </select>
                                        </form>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <button class="btn-search">??????</button>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- ================================ -->
                <!-- Content List -->
                <div class="container card p-4 bg-card">
                    <table class="table table-hover table-padding">
                        <thead>
                            <tr>
                                <th>?????????</th>
                                <th>?????????</th>
                                <th>?????????</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${_USERLIST_}">
                                <tr>
                                    <td class="dropdown">
                                        <a href="#" class="dropbtn">${user.user_email}</a>
                                        <div class="dropdown-content" id="myDropdown1">
                                            <a href="#" onclick="openUserPop()">?????? ?????? ??????</a>
                                            <!--<a href="/mypage/studentPage">???????????????</a>  -->
                                        </div>
                                    </td>
                                    <td>${user.user_nick}</td>
                                    <td><fmt:formatDate pattern="yyyy/MM/dd" value="${user.user_join}" /></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
                <!--End main contents card(??????)-->

                <nav aria-label="Page navigation example">
                    <form action="#" id="adPaginationFrom">
                        <input type="hidden" name="currPage">
                        <input type="hidden" name="amount">

                        <ul class="pagination justify-content-center p-5">

                            <c:if test="${_ADMINPAGINATION_.prev}">
                                <li class="page-item"><a class="page-link rounded-circle" href="${_ADMINPAGINATION_.startPage-1}">&laquo;</a></li>
                            </c:if>

                            <c:forEach var="page" begin="${_ADMINPAGINATION_.startPage}" end="${_ADMINPAGINATION_.endPage}">
                                <li class="page-item"><a class="page-link rounded-circle bg-blue" href="/admin/student?currPage=${page}">${page}</a></li>
                            </c:forEach>
                            <!-- <li class="page-item"><a class="page-link rounded-circle" href="#">&lt;</a></li> -->
                            <!-- <li class="page-item"><a class="page-link rounded-circle bg-blue" href="#">1</a> </li> -->
                            <!-- <li class="page-item"><a class="page-link rounded-circle" href="#">&gt;</a></li> -->

                            <c:if test="${_ADMINPAGINATION_.next}">
                                <li class="page-item"><a class="page-link rounded-circle" href="${_ADMINPAGINATION_.endPage+1}">&raquo;</a></li>
                            </c:if>

                        </ul>
                    </form>
                </nav>

                <!-- TO -->

            </div><!-- End main contents -->

        </div><!-- End Section -->

        </section><!-- End main Section -->
        </div>
        <!-- End Section -->

        <!-- ============= ?????? footer + js =============== -->
        <jsp:include page="../footer.jsp" flush="true" />
        <script src="${path}/resources/js/8_admin.js"></script>
        <!-- ============================================== -->
    </body>

    </html>