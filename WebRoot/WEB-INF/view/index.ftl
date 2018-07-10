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
					<a href="#" class="navbar-brand"><h3>CRYSTAL</h3></a>
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
	      <ul class="slides">
	      	<#if (categroyList)?exists && ((categroyList)?size != 0)>
				<#list coverList as cover>
			        <li>
			        	<img src="${base}${cover.path!}" alt="Slide 1">
			        	<div class="slider-caption">
						    <div class="templatemo_homewrapper">
						      <h1 class="wow fadeInDown" data-wow-delay="2000">hello, this is web &AMP; mobile studio</h1>
						      <h2 class="wow fadeInDown" data-wow-delay="2000">
								<span class="rotate">fully responsive business one page, clean design and easy to customize</span>
							</h2>
							<p>it is built on html5, css3, bootstrap, and much more!</p>
							<a href="#work" class="smoothScroll btn btn-default wow fadeInDown" data-wow-delay="2000">Our Work</a>	
						    </div>
					  	</div>
			        </li>
				</#list>
			</#if>
	        <#-- <li>
	        	<img src="${base}/static/images/slider/1.jpg" alt="Slide 1">
	        	<div class="slider-caption">
				    <div class="templatemo_homewrapper">
				      <h1 class="wow fadeInDown" data-wow-delay="2000">hello, this is web &AMP; mobile studio</h1>
				      <h2 class="wow fadeInDown" data-wow-delay="2000">
						<span class="rotate">fully responsive business one page, clean design and easy to customize</span>
					</h2>
					<p>it is built on html5, css3, bootstrap, and much more!</p>
					<a href="#work" class="smoothScroll btn btn-default wow fadeInDown" data-wow-delay="2000">Our Work</a>	
				    </div>
			  	</div>
	        </li>
	        <li>
	        	<img src="${base}/static/images/slider/2.jpg" alt="Slide 2">
	        	<div class="slider-caption">
				    <div class="templatemo_homewrapper">
				      <h1 class="wow fadeInDown" data-wow-delay="2000">Flex Slider, CSS Flexbox</h1>
				      <h2 class="wow fadeInDown" data-wow-delay="2000">
						<span class="rotate">work on all modern browsers, Works on IE 10+</span>
					</h2>
					<p>see caniuse.com for browser compatibility information</p>
					<a href="#about" class="smoothScroll btn btn-default wow fadeInDown" data-wow-delay="2000">See about us</a>	
				    </div>
			  	</div>
	        </li>
	        <li>
	        	<img src="${base}/static/images/slider/3.jpg" alt="Slide 3">
	        	<div class="slider-caption">
				    <div class="templatemo_homewrapper">
				      <h1 class="wow fadeInDown" data-wow-delay="2000">Special Thanks</h1>
				      <h2 class="wow fadeInDown" data-wow-delay="2000">
						<span class="rotate">unsplash.com, flexslider, bootstrap, jquery</span>
					</h2>
					<p>Feel free to look around and customize to suit your needs.</p>
					<a href="#service" class="smoothScroll btn btn-default wow fadeInDown" data-wow-delay="2000">Our Services</a>	
				    </div>
			  	</div>
	        </li> -->
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
					<h3>CRYSTAL WORK</h3>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<p>Mauris mattis vitae libero eget iaculis. Donec et augue quis quam porttitor consectetur ut nec sem. Integer sagittis viverra quam quis ultricies. Aenean risus nisl, consequat at nunc id, tincidunt tristique mauris.</p>
				</div>
				<div class="col-md-2"></div>
				<div class="col-sm-6 col-md-4 wow fadeInLeft" data-wow-delay="2000">
					<div class="work_thumb">
						<img src="${base}/static/images/work-img-1.jpg" class="img-responsive" alt="work">
							<div class="work_overlay">
								<a href="#"><i class="fa fa-thumbs-o-up"></i></a>
							</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4 wow fadeInDown" data-wow-delay="2000">
					<div class="work_thumb">
						<img src="${base}/static/images/work-img-2.jpg" class="img-responsive" alt="work">
							<div class="work_overlay">
								<a href="#"><i class="fa fa-thumbs-o-up"></i></a>
							</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4 wow fadeInRight" data-wow-delay="2000">
					<div class="work_thumb">
						<img src="${base}/static/images/work-img-3.jpg" class="img-responsive" alt="work">
							<div class="work_overlay">
								<a href="#"><i class="fa fa-thumbs-o-up"></i></a>
							</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4 wow fadeInLeft" data-wow-delay="2000">
					<div class="work_thumb">
						<img src="${base}/static/images/work-img-4.jpg" class="img-responsive" alt="work">
							<div class="work_overlay">
								<a href="#"><i class="fa fa-thumbs-o-up"></i></a>
							</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4 wow fadeInUp" data-wow-delay="2000">
					<div class="work_thumb">
						<img src="${base}/static/images/work-img-5.jpg" class="img-responsive" alt="work">
							<div class="work_overlay">
								<a href="#"><i class="fa fa-thumbs-o-up"></i></a>
							</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4 wow fadeInRight" data-wow-delay="2000">
					<div class="work_thumb">
						<img src="${base}/static/images/work-img-1.jpg" class="img-responsive" alt="work">
							<div class="work_overlay">
								<a href="#"><i class="fa fa-thumbs-o-up"></i></a>
							</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end work -->
	
	<!-- start team -->
	<section id="team" class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-12 wow fadeInDown" data-wow-delay="900">
					<h3>MEET CRYSTAL TEAM</h3>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<p>Mauris mattis vitae libero eget iaculis. Donec et augue quis quam porttitor consectetur ut nec sem. Integer sagittis viverra quam quis ultricies. Aenean risus nisl, consequat at nunc id, tincidunt tristique mauris.</p>
				</div>
				<div class="col-md-2"></div>
				<div class="col-sm-6 col-md-3 wow fadeInLet" data-wow-delay="2000">
					<div class="team_thumb">
						<img src="${base}/static/images/team-img-1.jpg" class="img-responsive" alt="team">
							<div class="team_overlay">
								<ul class="social_icon">
									<li><a href="#" class="fa fa-facebook"></a></li>
									<li><a href="#" class="fa fa-twitter"></a></li>
									<li><a href="#" class="fa fa-pinterest"></a></li>
								</ul>								
							</div>
					</div>
					<div class="team_description">
						<h4>TRACY</h4>
						<h5>DESIGNER</h5>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 wow fadeInUp" data-wow-delay="2000">
					<div class="team_thumb">
						<img src="${base}/static/images/team-img-2.jpg" class="img-responsive" alt="team">
							<div class="team_overlay">
								<ul class="social_icon">
									<li><a href="#" class="fa fa-facebook"></a></li>
									<li><a href="#" class="fa fa-twitter"></a></li>
									<li><a href="#" class="fa fa-pinterest"></a></li>
								</ul>
							</div>
					</div>
					<div class="team_description">
						<h4>MARY</h4>
						<h5>DEVELOPER</h5>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 wow fadeInUp" data-wow-delay="2000">
					<div class="team_thumb">
						<img src="${base}/static/images/team-img-3.jpg" class="img-responsive" alt="team">
							<div class="team_overlay">
								<ul class="social_icon">
									<li><a href="#" class="fa fa-facebook"></a></li>
									<li><a href="#" class="fa fa-twitter"></a></li>
									<li><a href="#" class="fa fa-pinterest"></a></li>
								</ul>
							</div>
					</div>
					<div class="team_description">
						<h4>JULIA</h4>
						<h5>DIRECTOR</h5>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 wow fadeInRight" data-wow-delay="2000">
					<div class="team_thumb">
						<img src="${base}/static/images/team-img-4.jpg" class="img-responsive" alt="team">
							<div class="team_overlay">
								<ul class="social_icon">
									<li><a href="#" class="fa fa-facebook"></a></li>
									<li><a href="#" class="fa fa-twitter"></a></li>
									<li><a href="#" class="fa fa-pinterest"></a></li>
								</ul>
							</div>
					</div>
					<div class="team_description">
						<h4>LINDA</h4>
						<h5>MANAGER</h5>
					</div>
				</div>
						
			</div>
		</div>
	</section>
	<!-- end team -->
	
	<!-- start about -->
	<section id="about">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-7 wow fadeInLeft" data-wow-delay="2000">
					<h3>Welcome to CRYSTAL Design</h3>
					<h2>Digital Studio in Bangkok</h2>
					<p>Crystal is free web template for everyone. Feel free to use it for your website. Please spread a word about <span class="blue">template</span><span class="green">mo</span> to your friends. Integer lorem magna, gravida vitae metus a, euismod faucibus nisi. In sed nulla magna. Nulla in mauris ullamcorper, cursus lorem lobortis, pellentesque enim. Ut vel pellentesque est. Maecenas sed malesuada tellus.</p>
				</div>
				<div class="col-sm-6 col-md-5 wow fadeInRight" data-wow-delay="2000">
					<h3>Our Location</h3>
					<div class="col-md-6 col-sm-6 col-xs-6">
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
					</div>
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
					<h3>CRYSTAL SERVICES</h3>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-8 text-center">
					<p>Mauris mattis vitae libero eget iaculis. Donec et augue quis quam porttitor consectetur ut nec sem. Integer sagittis viverra quam quis ultricies. Aenean risus nisl, consequat at nunc id, tincidunt tristique mauris.</p>
				</div>
				<div class="col-md-2"></div>
				
				<#if (categroyList)?exists && ((categroyList)?size != 0)>
					<#list categroyList as categroy>
						<div class="col-sm-6 col-md-4 wow fadeInLeft" data-wow-delay="2000">
							<div class="media">
								<i class="fa fa-cog pull-left media-object"></i>
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
	<section id="contact" class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-12 wow fadeInDown" data-wow-delay="2000">
					<h3>CONTACT CRYSTAL</h3>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<p>Mauris mattis vitae libero eget iaculis. Donec et augue quis quam porttitor consectetur ut nec sem. Integer sagittis viverra quam quis ultricies. Aenean risus nisl, consequat at nunc id, tincidunt tristique mauris.</p>
				</div>
				<div class="col-md-2"></div>
				<form id="contactForm" method="post">
					<div class="col-md-4 wow fadeInLeft" data-wow-delay="2000">
						<input type="text" placeholder="Name" class="form-control">
					</div>
					<div class="col-md-4 wow fadeInDown" data-wow-delay="2000">
						<input type="email" placeholder="Email" class="form-control" required>
					</div>
					<div class="col-md-4 wow fadeInRight" data-wow-delay="2000">
						<input type="text" placeholder="Subject" class="form-control">
					</div>
					<div class="col-md-12 wow fadeInDown" data-wow-delay="2000">
						<textarea placeholder="Message" class="form-control"></textarea>
					</div>
					<div class="col-md-3"></div>
					<div class="col-md-6 wow fadeInUp" data-wow-delay="2000">
						<input type="button" value="SHOOT MESSAGE" class="form-control" style="background-color:#66AF33;" />
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
                	Copyright &copy; 2015 Your Company Name
                </span>
				<ul class="social_icon">
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
		jQuery(function($) {
			$(".btn-save").click(function(){
				$.ajax({  
			        type:'post',  
			        traditional :true,  
			        url:'${base}/admin/config/update.json',  
			        data:$("#myFormId").serialize(),  
			        success:function(data){
			        	switch(data.code){
			        	case 401:
			        		location.href = data.message;
		        			break;
		        		default:
			        		if (data.success){
				        		var n = noty({
						            text        : data.message,
						            type        : 'success',
						            dismissQueue: true,
						            layout      : 'topCenter',
						            theme       : 'relax',
						            timeout		: 1500,
						            callback: {     // 设置回调函数
								        afterClose: function() {
		                                	location.reload();
								        }
								    }
						        });
				        	}else{
				        		for(var msg in data.message){
					        		var n = noty({
							            text        : msg,
							            type        : 'error',
							            dismissQueue: true,
							            layout      : 'topCenter',
							            theme       : 'relax',
							            timeout		: 1500
							        });
					        	}
				        	}
			        	}
			        },
			        error:function(data){
			        	alert('ajax错误');
			        }
			    });
			});
		});
	</script>
</@main.footer>