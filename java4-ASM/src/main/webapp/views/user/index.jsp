<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ACOUSTIC MUSIC</title>
<%@ include file="/common/head.jsp" %>

</head>
<body>
    <!-- Page Loader -->
    <%@ include file="/common/header.jsp" %>

    <div class="container-fluid tm-container-content tm-mt-60">
        <div class="row mb-4">
            <h2 class="col-6 tm-text-primary">
                LIST VIDEOS
            </h2>
            <div class="col-6 d-flex justify-content-end align-items-center">
                <form action="" class="tm-text-primary">
                    Page <input type="text" value="1" size="1" class="tm-input-paging tm-text-primary"> of 200
                </form>
            </div>
        </div>
        <div class="row tm-mb-90 tm-gallery">
        	<c:forEach items = "${videos}" var="video">
        		<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
        			<h5 class="tm-text-secondary" style="white-space: nowrap; overflow: hidden;">
        			${video.title}
        			</h5>
                <figure class="effect-ming tm-video-item">
                    <img src="<c:url value='/templates/user/img/${video.getPoster()}'/>" alt="Image" class="img-fluid">
                    <figcaption class="d-flex align-items-center justify-content-center">
                        <h2>View more</h2>
                        <a href="<c:url value='/video?action=watch&id=${video.href}'/>">View more</a>
                    </figcaption>                    
                </figure>
                <div class="d-flex justify-content-between tm-text-gray">
                    <span class="tm-text-gray-light">${video.shares} Shares</span>
                    <span>${video.views} Views</span>
                </div>
            </div>
        	</c:forEach>
        	
        </div> <!-- row -->	
    </div> <!-- container-fluid, tm-container-content -->

    <%@ include file="/common/footer.jsp" %>
</body>
</html>