<#-----author:lvliang------->
<#-----date:2018-03-30------->
<@main.header>
	<#escape x as x?html> 
	</#escape>
</@main.header>

<#escape x as x?html>
	<!-- start navigation -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="row">
				<div class="navbar-header">
					<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="icon icon-bar"></span>
						<span class="icon icon-bar"></span>
						<span class="icon icon-bar"></span>
					</button>
					<a href="${base}" class="navbar-brand"><h3>MAYI</h3></a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#home" class="smoothScroll">首页</a></li>
						<li><a href="#work" class="smoothScroll">设计案例</a></li>
						<li><a href="#team" class="smoothScroll">优秀团队</a></li>
						<li><a href="#about" class="smoothScroll">关于我们</a></li>
						<li><a href="#work" class="smoothScroll hide">WORK</a></li>
						<li><a href="#pricing" class="smoothScroll hide">PRICING</a></li>
						<li><a href="#contact" class="smoothScroll">联系我们</a></li>
					</ul>
				</div>
			</div>				
		</div>
	</nav>
	<!-- end navigation -->

	<!-- start home -->
	<section id="home" class="text-center">
	  <div class="templatemo_headerimage">
	    <div class="flexslider">
	      <ul class="slides" id="topImages" >
	      	<#if (categroyList)?exists && ((categroyList)?size != 0)>
				<#list coverList as cover>
			        <li>
			        	<img src="${base}${cover.path!}" style="max-height:1200px;height:auto;" />
			        	<!-- <div class="slider-caption">
						    <div class="templatemo_homewrapper">
						      <h1 class="wow fadeInDown" data-wow-delay="2000">hello, this is web &AMP; mobile studio</h1>
						      <h2 class="wow fadeInDown" data-wow-delay="2000">
								<span class="rotate">fully responsive business one page, clean design and easy to customize</span>
							</h2>
							<p>it is built on html5, css3, bootstrap, and much more!</p>
							<a href="#work" class="smoothScroll btn btn-default wow fadeInDown" data-wow-delay="2000">Our Work</a>	
						    </div>
					  	</div> -->
			        </li>
				</#list>
			</#if>
	      </ul>
	    </div>
	  </div>				
	</section>
	<!-- end home -->
	
	<!-- start work -->
	<section id="work" class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-12 wow fadeInDown" data-wow-delay="2000">
					<h3>${configMap['design_case'].val!}</h3>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<p>${configMap['design_case'].desc!}</p>
				</div>
				<div class="col-md-2"></div>
				
				<#if (activityList)?exists && ((activityList)?size != 0)>
					<#list activityList as activity>
						<div class="col-sm-6 col-md-4 wow fadeInLeft" data-wow-delay="2000">
							<div class="work_thumb">
								<img src="${base}${activity.files[0].path!}" class="img-responsive" alt="case" style="width:100%;height:250px;" />
								<!-- <div class="work_overlay">
									<a href="#"><i class="fa fa-thumbs-o-up"></i></a>
								</div> -->
							</div>
						</div>
					</#list>
				</#if>
			</div>
		</div>
	</section>
	<!-- end work -->
	
	<!-- start team -->
	<section id="team" class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-12 wow fadeInDown" data-wow-delay="900">
					<h3>${configMap['our_team'].val!}</h3>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<p>${configMap['our_team'].desc!}</p>
				</div>
				<div class="col-md-2"></div>
				
				<#if (memberList)?exists && ((memberList)?size != 0)>
					<#list memberList as member>
						<div class="col-sm-6 col-md-3 wow fadeInLet" data-wow-delay="2000">
							<div class="team_thumb">
								<img src="${base}${member.face!}" class="img-responsive" alt="person" style="width:100%;height:200px;" />
								<!-- <div class="team_overlay">
									<ul class="social_icon">
										<li><a href="#" class="fa fa-facebook"></a></li>
										<li><a href="#" class="fa fa-twitter"></a></li>
										<li><a href="#" class="fa fa-pinterest"></a></li>
									</ul>								
								</div> -->
							</div>
							<div class="team_description">
								<h4>${member.username!}</h4>
								<h5>${configMap[member.positionId].val!}</h5>
							</div>
						</div>
					</#list>
				</#if>
			</div>
		</div>
	</section>
	<!-- end team -->
	
	<!-- start about -->
	<section id="about">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-7 wow fadeInLeft" data-wow-delay="2000">
					<h2>${company.name!}</h2>
					<h4>${company.address!}</h4>
					<p>${company.desc!}</p>
				</div>
				<div class="col-sm-6 col-md-5 wow fadeInRight" data-wow-delay="2000">
					<h3>周边信息</h3>
					<#if (peripheryFiles)?exists && ((peripheryFiles)?size != 0)>
						<#list peripheryFiles as periphery>
							<div class="col-md-6 col-sm-6 col-xs-6">
								<img src="${base}${periphery.path!}" class="img-responsive">
							</div>
						</#list>
					</#if>
					<#-- <div class="col-md-6 col-sm-6 col-xs-6">
						<img src="${base}/static/images/company-img-1.jpg" class="img-responsive" alt="company 1">
					</div>
					<div class="col-md-6 col-sm-6 col-xs-6">
						<img src="${base}/static/images/company-img-2.jpg" class="img-responsive" alt="company 2">
					</div>
					<div class="col-md-6 col-sm-6 col-xs-6">
						<img src="${base}/static/images/company-img-3.jpg" class="img-responsive" alt="company 3">
					</div>
					<div class="col-md-6 col-sm-6 col-xs-6">
						<img src="${base}/static/images/company-img-4.jpg" class="img-responsive" alt="company 4">
					</div> -->
				</div>
			</div>
		</div>
	</section>
	<!-- end about -->
	
	<!-- start service -->
	<section id="service">
		<div class="container">
			<div class="row">
				<div class="text-center col-md-12 wow fadeInDown" data-wow-delay="2000">
					<h3>${configMap['service_Items'].val!}</h3>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-8 text-center">
					<p>${configMap['service_Items'].desc!}</p>
				</div>
				<div class="col-md-2"></div>
				
				<#if (categroyList)?exists && ((categroyList)?size != 0)>
					<#list categroyList as categroy>
						<div class="col-sm-6 col-md-4 wow fadeInLeft" data-wow-delay="2000">
							<div class="media">
								<i class="pull-left media-object">
									<img src="${base}${categroy.icon!}" style="width:60px;height:60px;border-radius:60px;" />
								</i>
								<div class="media-body">
									<h4 class="media-heading">${categroy.serviceName!}</h4>
									<p>${categroy.serviceDesc!}</p>
								</div>
							</div>
						</div>
					</#list>
				</#if>
			</div>
		</div>
	</section>
	<!-- end service -->
	
	<!-- start newsletter -->
	<section id="newsletter" class="text-center hide">
		<div class="container">
			<div class="row">
				<div class="text-center col-md-12 wow fadeInDown" data-wow-delay="2000">
					<h3>CRYSTAL NEWSLETTER</h3>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<p>Mauris mattis vitae libero eget iaculis. Donec et augue quis quam porttitor consectetur ut nec sem. Integer sagittis viverra quam quis ultricies. Aenean risus nisl, consequat at nunc id, tincidunt tristique mauris.</p>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-12 wow fadeInDown" data-wow-delay="2000">
					<form role="form">
						<div class="col-md-1"></div>
						<div class="col-md-6">
							<input type="email" placeholder="Enter your Email" class="form-control" required>
						</div>
						<div class="col-md-4">
							<input type="submit" value="SUBSCRIBE NOW" class="form-control">
						</div>
						<div class="col-md-1"></div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- end newsletter -->
	
	<!-- start pricing -->
	<section id="pricing" class="text-center hide">
		<div class="container">
			<div class="row">
				<div class="col-md-12 wow fadeInDown" data-wow-delay="2000">
					<h3>CRYSTAL PRICING</h3>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<p> Please tell your friends about  website. Thank you for supporting us. Donec et augue quis quam porttitor consectetur ut nec sem. Integer sagittis viverra quam quis ultricies. Aenean risus nisl, consequat at nunc id, tincidunt tristique mauris.</p>
				</div>
				<div class="col-md-2"></div>
				<div class="col-sm-6 col-md-3 wow fadeInLeft" data-wow-delay="2000">
					<div class="plan plan_one">
						<h4 class="plan_title">STARTER</h4>
						<ul>
							<li>$20 per month</li>
							<li>100 GB SPACE</li>
							<li>500 GB BANDWIDTH</li>
							<li>50 Premium Designs</li>
							<li>1-Year Support</li>
						</ul>
						<button class="btn btn-warning">SIGN UP</button>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 wow fadeInDown" data-wow-delay="2000">
					<div class="plan plan_two">
						<h4 class="plan_title">BUSINESS</h4>
						<ul>
							<li>$50 per month</li>
							<li>200 GB SPACE</li>
							<li>2,000 GB BANDWIDTH</li>
							<li>200 Premium Designs</li>
							<li>2-Year Support</li>
						</ul>
						<button class="btn btn-warning">SIGN UP</button>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 wow fadeInDown" data-wow-delay="2000">
					<div class="plan plan_three">
						<h4 class="plan_title">PROFESSIONAL</h4>
						<ul>
							<li>$75 per month</li>
							<li>600 GB SPACE</li>
							<li>3,000 GB BANDWIDTH</li>
							<li>300 Premium Designs</li>
							<li>3-Year Support</li>
						</ul>
						<button class="btn btn-warning">SIGN UP</button>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 wow fadeInRight" data-wow-delay="2000">
					<div class="plan plan_four">
						<h4 class="plan_title">ADVANCED</h4>
						<ul>
							<li>$120 per month</li>
							<li>1,500 GB SPACE</li>
							<li>10,000 GB BANDWIDTH</li>
							<li>500 Premium Designs</li>
							<li>Lifetime Support</li>
						</ul>
						<button class="btn btn-warning">SIGN UP</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end pricing -->
	
	<!-- start contact -->
	<section id="contact" class="text-center" style="background: #404040 url('${base}${company.logo!}') no-repeat;background-size: cover;background-attachment: fixed;color: #FFFFFF;min-height: 300px;padding: 80px 0 60px 0;">
		<div class="container">
			<div class="row">
				<div class="col-md-12 wow fadeInDown" data-wow-delay="2000">
					<h3>${configMap['contact_us'].val!}</h3>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<p>${configMap['contact_us'].desc!}</p>
				</div>
				<div class="col-md-2"></div>
				<form id="contactForm" method="post">
					<div class="col-md-4 wow fadeInLeft" data-wow-delay="2000">
						<input type="text" placeholder="请填写您的姓名" name="username" id="username" class="form-control">
					</div>
					<div class="col-md-4 wow fadeInDown" data-wow-delay="2000">
						<input type="email" placeholder="请填写您的联系方式" name="contactInfo" id="contactInfo" class="form-control" required>
					</div>
					<div class="col-md-4 wow fadeInRight" data-wow-delay="2000">
						<input type="text" placeholder="请填写咨询标题" name="title" id="title" class="form-control">
					</div>
					<div class="col-md-12 wow fadeInDown" data-wow-delay="2000">
						<textarea placeholder="请将您的意见与建议留言给我们" name="content" id="content" class="form-control"></textarea>
					</div>
					<div class="col-md-3"></div>
					<div class="col-md-6 wow fadeInUp" data-wow-delay="2000">
						<input type="button" value="留言" class="form-control" style="background-color:#66AF33;" id="leavingMessage" />
					</div>
					<div class="col-md-3"></div>
				</form>
			</div>
		</div>
		<div class="google_map">
			<div id="map-canvas"></div>
		</div>
		<footer class="container">
			<div class="col-md-12 wow fadeInUp" data-wow-duration="0.4s" data-wow-delay="0.4s">
				<span>
                	Copyright &copy; 2019 上海义吉文化传播有限公司
                </span>
				<ul class="social_icon hide">
			    	<li><a href="#" class="fa fa-facebook"></a></li>
					<li><a href="#" class="fa fa-twitter"></a></li>
					<li><a href="#" class="fa fa-instagram"></a></li>
					<li><a href="#" class="fa fa-apple"></a></li>
					<li><a href="#" class="fa fa-pinterest"></a></li>
					<li><a href="#" class="fa fa-google"></a></li>
					<li><a href="#" class="fa fa-wordpress"></a></li>
				</ul>
			</div>
		</footer>
	</section>
</#escape>

<@main.footer>
	<script>
		var topPicHeight = 0;
		function showPrompt(content){
			var popup = new Popup({
				'type': 'info',
				'title': '提示',
				'bgcolor': '#66AF33',
				'text': content
			});
			setTimeout(function(){
			   $('.popup-close').click();
			}, 3000);
		}
		
		jQuery(function($) {
			topPicHeight = $("#topImages li").eq(0).height();
			$("#leavingMessage").click(function(){
				var username = $("#username").val();
				var contactInfo = $("#contactInfo").val();
				var title = $("#title").val();
				var content = $("#content").val();
					
				if(username == ""){
					showPrompt('请输入您的姓名');
					return false;
				}else{
					if(username.length>20){
						showPrompt('姓名长度不超过20个字符');
						return false;
					}
				}
				if(contactInfo == ""){
					showPrompt('请输入您的联系方式');
					return false;
				}else{
					var phoneReg = /^1\d{10}$/;
					var emailReg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
					if(!phoneReg.test(contactInfo) && !emailReg.test(contactInfo)){
						showPrompt('请输入正确格式的手机号或邮箱');
						return false;
					}
				}
				if(title == ""){
					showPrompt('请输入标题内容');
					return false;
				}else{
					if(title.length>50){
						showPrompt('标题内容不超过50个字符');
						return false;
					}
				}
				if(content == ""){
					showPrompt('请输入留言内容');
					return false;
				}else{
					if(title.length>500){
						showPrompt('留言内容不超过500个字符');
						return false;
					}
				}
				
				$.ajax({  
			        type:'post',  
			        traditional :true,  
			        url:'${base}/admin/contact/save.json',
			        data:$("#contactForm").serialize(),  
			        success:function(data){
		        		if (data.success){
							showPrompt('留言成功');
							$("#username").val("");
							$("#contactInfo").val("");
							$("#title").val("");
							$("#content").val("");
			        	}else{
							showPrompt('留言失败，请稍后重试');
			        	}
			        },
			        error:function(data){
						showPrompt('留言失败，请稍后重试');
			        }
			    });
			});
		});
		
		/*window.onresize = function(){
			var height = $("#topImages li").eq(0).height();
			//alert(height);
			$("#topImages li img").css("height",height);
		}*/
	</script>
</@main.footer>