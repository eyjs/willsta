<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>즐거움의 시작 윌스타그램</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link rel="stylesheet" type="text/css" href="css/animate.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/line-awesome.css">
	<link rel="stylesheet" type="text/css" href="css/line-awesome-font-awesome.min.css">
	<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" type="text/css" href="lib/slick/slick.css">
	<link rel="stylesheet" type="text/css" href="lib/slick/slick-theme.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/responsive.css">
	

<body>	

	<div class="wrapper">	

<!-- common_top_menu start -->
		<header>
			<!-- Menubar Starts -->
			<jsp:include page="../common_top_menu.jsp"/>
			<!-- Menubar End -->
		</header>
<!-- common_top_menu end -->


		<main>
			<div class="main-section">
				<div class="container">
					<div class="main-section-data">
						<div class="row">
							<div class="col-lg-3 col-md-4 pd-left-none no-pd">
								<div class="main-left-sidebar" style="margin-top:130px;">
									<div class="user_profile">
										<div class="user-pro-img">
											<img src="contents/member_image/${member.mImage}" width="200px" alt="">
												
															<h3>${member.mName}</h3>
															
											<div class="add-dp" id="OpenImgUpload">
												<input type="file" id="file">
												<label for="file"><i class="fas fa-camera"></i></label>												
											</div>
										</div><!--user-pro-img end-->
										<div class="user_pro_status">
											<ul class="flw-status">
												<li>
													<h4>Following</h4>
													<span></span>
													<b><a href="#" title="">${member.followingCount}</a></b>
												</li>
												<li>
													<h4>Followers</h4>
													<span></span>
													<b><a href="#" title="">${member.followerCount}</a></b>
												</li>
											</ul>
										</div><!--user_pro_status end-->
									</div><!-- user_profile end -->
									
									<div class="suggestions full-width">
										<div class="sd-title">
											<h3>친구추천</h3>
											<i class="la la-ellipsis-v"></i>
										</div><!--sd-title end-->
										<div class="suggestions-list">
											<c:forEach var="mList" items="${memberList}">
												<div class="suggestion-usd">
													<img src="contents/member_image/${mList.mImage}" alt="" width="40px">
													<div class="sgt-text">
														<h4>${mList.mName}</h4>
														<span>${mList.mEmail}</span>
													</div>
													<span><i class="la la-plus"></i></span>
												</div>
											</c:forEach>
											<div class="view-more">
												<a href="#" title="">View More</a>
											</div>
										</div><!--suggestions-list end-->
									</div><!--suggestions end-->
									<div class="tags-sec full-width">
										<ul>
											<li><a href="#" title="">Help Center</a></li>
											<li><a href="#" title="">About</a></li>
											<li><a href="#" title="">Privacy Policy</a></li>
											<li><a href="#" title="">Community Guidelines</a></li>
											<li><a href="#" title="">Cookies Policy</a></li>
											<li><a href="#" title="">Career</a></li>
											<li><a href="#" title="">Language</a></li>
											<li><a href="#" title="">Copyright Policy</a></li>
										</ul>
										<div class="cp-sec">
											<img src="images/logo.png" alt="">
											<p><img src="images/cp.png" alt="">Copyright 2020</p>
										</div>
									</div><!--tags-sec end-->
								</div><!--main-left-sidebar end-->
							</div>
							<div class="col-lg-6 col-md-8 no-pd">
								<div class="main-ws-sec">
									<!-- 최상단에 버튼이 필요한 경우 살려서 쓸것 -->
									<!-- <div class="post-topbar">
										<div class="user-picy">
											<img src="images/resources/user-pic.png" alt="">
										</div>
										<div class="post-st">
											<ul>
												<li><a class="post-jb active" href="#" title="">글쓰기</a></li>
											</ul>
										</div>post-st end
									</div>post-topbar end
									<div class="posts-section"> -->
									
									<!-- post-bar가 반복되면 됨 -->
								<c:forEach var="post" items="${postList}">
								
										<div class="post-bar" post_no="${post.pNo}">
											<div class="post_topbar">
												<div class="usy-dt">
													<img src="contents/member_image/${post.mImage}" width=40px height=40px>
													<div class="usy-name">
														<h3>${post.mName}</h3>
														<span><img src="images/clock.png" alt="">${post.aGo}</span>
													</div>
												</div>
												<div class="ed-opts">
													<a href="#" title="" class="ed-opts-open"><i class="la la-ellipsis-v"></i></a>
													<!-- 이 포스트가 내꺼인 경우에만 보여주는 메뉴 -->
													<c:if test="${post.mId!=sessionScope.loginId}">
														<ul class="ed-options">
															<li><a class="updatePost" href="#" title="">Edit Post</a></li>
															<li><a class="deletePost" href="#" title="">Delete Post</a></li>
															<li><a class="hiddenPost" href="#" title="">
															<c:if test="${post.status=='A'}">Hide</c:if>
															<c:if test="${post.status=='H'}">Show</c:if>
															</a></li>
														</ul>
													</c:if>
												</div>
											</div>
											<!-- 여기에 사진(컨텐츠)들어옴 -->
											<div class="contents">
												<c:if test="${fn:startsWith(post.fileName, 'img')}">
													<div class="image">
														<img class="center-block" style="margin:10px 0px;"
															src="contents/post_image/${post.fileName}" alt="여기에이미지들어옴"
															width="500" height="300" >
													</div>
												</c:if>
												<c:if test="${fn:startsWith(post.fileName, 'mov')}">
													<div class="embed-responsive embed-responsive-4by3" style="margin-bottom:10px;" >
													  		<iframe class="embed-responsive-item" style="padding-top:10px;"
													  			src="contents/post_image/${post.fileName}"></iframe>
													</div>
												</c:if>
											</div>
											<div class="job_descp">
												<h3>${post.pTitle}</h3>
												<p>${post.pContents}<br><a href="#" title="">view more</a></p>
												<ul class="skill-tags">
													<c:forEach var='tag' items="${post.tagArray}">
														<li><a href="#" title="">${tag}</a></li>
													</c:forEach>
											
												</ul>
											</div>
											<div class="job-status-bar">
													<ul class="like-com">
														<li><a href="#" class="like"><i class="fas fa-heart"></i> Like</a>
															<img src="images/liked-img.png" alt=""> <span class='likeCount'>${post.likeCount}</span>
														</li>
														<!-- a: 누를 시 comment-section toggle-->
														<li><a href="#" class="com"> <i class="fas fa-comment-alt"></i> Comment 15</a></li>
													</ul>
													<a href="#"><i class="fas fa-eye"></i>Views
														${post.pViewCount}</a>
													<!-- comment-section-->
													<div class="comment-section"></div>
													<!--comment-section end-->
												</div>
												<!-- post-comment -->
												<div class="post-comment">
													<div class="cm_img">
														<img src="images/resources/bg-img4.png" alt="">
													</div>
													<div class="comment_box">
														<form id="comment-insert-form">
															<!-- 댓글 내용 쓰는 곳 -->
															<input type="text" placeholder="Post a comment"
																id="comment-cContent" name="comment-cContent">
															<button type="button" id="comment-insert-button">Send</button>
														</form>
													</div>
												</div>
												<!--post-comment end-->
										</div><!--post-bar end-->
								</c:forEach>	
								    </div><!--posty end-->
										<div class="process-comm">
											<div class="spinner"">
												<div class="bounce1"></div>
												<div class="bounce2"></div>
												<div class="bounce3"></div>
											</div>
										</div><!--process-comm end-->
								</div><!--main-ws-sec end-->
							</div>
							 <div class="col-lg-3 pd-right-none no-pd"> 
								<div class="right-sidebar">
									<div class="widget widget-about">
										<img src="images/wd-logo.png" alt="">
										<h3>WillStarGram</h3>
										<span>Itwill Class5 Team2 Project</span>
										<div class="sign_link">
											<h3><a href="sign-in.html" title="">Sign up</a></h3>
											<a href="#" title="">Learn More</a>
										</div>
									</div><!--widget-about end-->
									<div class="widget widget-jobs">
										<div class="sd-title">
											<h3>Top Views</h3>
											<i class="la la-ellipsis-v"></i>
										</div>
										<div class="jobs-list">
											<c:forEach var="postRank" items="${postRankList}">
												<div class="job-info" post_no="${postRank.PNO}">
													<div class="job-details">
														<h3>${postRank.MNAME}</h3>
														<p><a href="#" title="" class="top-views">${postRank.PTITLE}</a></p>
													</div>
													<div class="hr-rate">
														<span>${postRank.PVIEWCOUNT}</span>
													</div>
												</div><!--job-info end-->
											</c:forEach>
										</div><!--jobs-list end-->
									</div><!--widget-jobs end-->
									<div class="widget widget-ad">
										<div class="sign_link" style="padding:10px">
											<h3><a href="http://ec2-54-180-83-67.ap-northeast-2.compute.amazonaws.com:8080/myshop/product/list" title="">
												<img src="images/dapara.png" alt="">
												</a>
											</h3>
										</div>
									</div>
								</div><!--right-sidebar end-->
							</div>
						</div>
					</div><!-- main-section-data end-->
				</div> 
			</div>
		</main>
		<!-- 글쓰기 팝업 -->
		<div class="post-popup job_post">
			<div class="post-project">
				<h3>글쓰기</h3>
				<div class="post-project-fields">
					<form id="postWrite"  method="get">
						<div class="row">
							<div class="col-lg-12">
								<input type="hidden" id="pNo" name="pNo" >
								<input type="text" id="pTitle" name="pTitle" placeholder="Title">
							</div>
							<div class="col-lg-12">
								<input type="text" id="hasTag" name="hasTag" placeholder="tag">
							</div>
							<div class="col-lg-12">
								<textarea id="pContents" name="pContents" placeholder="Description"></textarea>
							</div>
							<div class="col-lg-12 img-list" style="margin-bottom:10px;">
								<!-- 여기 이미지 들어옴 -->
						    </div>
							<div class="col-lg-12">
								<input type=file name=file1 size=400 class="TXTFLD" multiple>
						    </div>
							<div class="col-lg-12">
								<ul>
									<li><button class="active" type="submit" value="post">완료</button></li>
									<li><a href="#" title="">취소</a></li>
								</ul>
							</div>
						</div>
					</form>
				</div><!--post-project-fields end-->
				<a href="#" title=""><i class="la la-times-circle-o"></i></a>
			</div><!--post-project end-->
		</div><!--post-project-popup end-->

<!-- 상세보기Modal  id="myModal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"-->
		<div class="post-popup post_deatil" >
		  
		</div>


		<div class="chatbox-list">
			<div class="chatbox">
				<div class="chat-mg">
					<a href="#" title=""><img src="images/resources/usr-img1.png" alt=""></a>
					<span>2</span>
				</div>
				<div class="conversation-box">
					<div class="con-title mg-3">
						<div class="chat-user-info">
							<img src="images/resources/us-img1.png" alt="">
							<h3>John Doe <span class="status-info"></span></h3>
						</div>
						<div class="st-icons">
							<a href="#" title=""><i class="la la-cog"></i></a>
							<a href="#" title="" class="close-chat"><i class="la la-minus-square"></i></a>
							<a href="#" title="" class="close-chat"><i class="la la-close"></i></a>
						</div>
					</div>
					<div class="chat-hist mCustomScrollbar" data-mcs-theme="dark">
						<div class="chat-msg">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor.</p>
							<span>Sat, Aug 23, 1:10 PM</span>
						</div>
						<div class="date-nd">
							<span>Sunday, August 24</span>
						</div>
						<div class="chat-msg st2">
							<p>Cras ultricies ligula.</p>
							<span>5 minutes ago</span>
						</div>
						<div class="chat-msg">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor.</p>
							<span>Sat, Aug 23, 1:10 PM</span>
						</div>
					</div><!--chat-list end-->
					<div class="typing-msg">
						<form>
							<textarea placeholder="Type a message here"></textarea>
							<button type="submit"><i class="fa fa-send"></i></button>
						</form>
						<ul class="ft-options">
							<li><a href="#" title=""><i class="la la-smile-o"></i></a></li>
							<li><a href="#" title=""><i class="la la-camera"></i></a></li>
							<li><a href="#" title=""><i class="fa fa-paperclip"></i></a></li>
						</ul>
					</div><!--typing-msg end-->
				</div><!--chat-history end-->
			</div>
			<div class="chatbox">
				<div class="chat-mg">
					<a href="#" title=""><img src="images/resources/usr-img2.png" alt=""></a>
				</div>
				<div class="conversation-box">
					<div class="con-title mg-3">
						<div class="chat-user-info">
							<img src="images/resources/us-img1.png" alt="">
							<h3>John Doe <span class="status-info"></span></h3>
						</div>
						<div class="st-icons">
							<a href="#" title=""><i class="la la-cog"></i></a>
							<a href="#" title="" class="close-chat"><i class="la la-minus-square"></i></a>
							<a href="#" title="" class="close-chat"><i class="la la-close"></i></a>
						</div>
					</div>
					<div class="chat-hist mCustomScrollbar" data-mcs-theme="dark">
						<div class="chat-msg">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor.</p>
							<span>Sat, Aug 23, 1:10 PM</span>
						</div>
						<div class="date-nd">
							<span>Sunday, August 24</span>
						</div>
						<div class="chat-msg st2">
							<p>Cras ultricies ligula.</p>
							<span>5 minutes ago</span>
						</div>
						<div class="chat-msg">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor.</p>
							<span>Sat, Aug 23, 1:10 PM</span>
						</div>
					</div><!--chat-list end-->
					<div class="typing-msg">
						<form>
							<textarea placeholder="Type a message here"></textarea>
							<button type="submit"><i class="fa fa-send"></i></button>
						</form>
						<ul class="ft-options">
							<li><a href="#" title=""><i class="la la-smile-o"></i></a></li>
							<li><a href="#" title=""><i class="la la-camera"></i></a></li>
							<li><a href="#" title=""><i class="fa fa-paperclip"></i></a></li>
						</ul>
					</div><!--typing-msg end-->
				</div><!--chat-history end-->
			</div>
			<div class="chatbox">
				<div class="chat-mg bx">
					<a href="#" title=""><img src="images/chat.png" alt=""></a>
					<span>2</span>
				</div>
				<div class="conversation-box">
					<div class="con-title">
						<h3>Messages</h3>
						<a href="#" title="" class="close-chat"><i class="la la-minus-square"></i></a>
					</div>
					<div class="chat-list">
						<div class="conv-list active">
							<div class="usrr-pic">
								<img src="images/resources/usy1.png" alt="">
								<span class="active-status activee"></span>
							</div>
							<div class="usy-info">
								<h3>John Doe</h3>
								<span>Lorem ipsum dolor <img src="images/smley.png" alt=""></span>
							</div>
							<div class="ct-time">
								<span>1:55 PM</span>
							</div>
							<span class="msg-numbers">2</span>
						</div>
						<div class="conv-list">
							<div class="usrr-pic">
								<img src="images/resources/usy2.png" alt="">
							</div>
							<div class="usy-info">
								<h3>John Doe</h3>
								<span>Lorem ipsum dolor <img src="images/smley.png" alt=""></span>
							</div>
							<div class="ct-time">
								<span>11:39 PM</span>
							</div>
						</div>
						<div class="conv-list">
							<div class="usrr-pic">
								<img src="images/resources/usy3.png" alt="">
							</div>
							<div class="usy-info">
								<h3>John Doe</h3>
								<span>Lorem ipsum dolor <img src="images/smley.png" alt=""></span>
							</div>
							<div class="ct-time">
								<span>0.28 AM</span>
							</div>
						</div>
					</div><!--chat-list end-->
				</div><!--conversation-box end-->
			</div>
		</div><!--chatbox-list end-->

	</div><!--theme-layout end-->

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/popper.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.mCustomScrollbar.js"></script>
<script type="text/javascript" src="lib/slick/slick.min.js"></script>
<script type="text/javascript" src="js/scrollbar.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/messages_ko.js"></script>
<script type="text/javascript" src="js/wPost.js"></script>
<script type="text/javascript" src="js/wComments.js"></script>
<script type="text/javascript" src="js/wFollow.js"></script>
</head>
</body>
</html>
