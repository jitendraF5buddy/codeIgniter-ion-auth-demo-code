<!DOCTYPE HTML>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0 minimal-ui"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<title>F5 Buddy Hrtool</title>

<link href="<?php echo base_url(); ?>/assets/styles/style.css"           rel="stylesheet" type="text/css">
<link href="<?php echo base_url(); ?>/assets/styles/framework.css"       rel="stylesheet" type="text/css">
<link href="<?php echo base_url(); ?>/assets/styles/font-awesome.css"    rel="stylesheet" type="text/css">
<link href="<?php echo base_url(); ?>/assets/styles/animate.css"         rel="stylesheet" type="text/css">

<!-- <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script> -->

<script type="text/javascript" src="<?php echo base_url(); ?>/assets/scripts/login.js"></script>

<script type="text/javascript" src="<?php echo base_url(); ?>/assets/scripts/jquery.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>/assets/scripts/jqueryui.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>/assets/scripts/framework-plugins.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>/assets/scripts/custom.js"></script>
</head>
<body ng-app="f5buddy-Hrtool" ng-controller="loginController" class="sidebar"> 
<div id="preloader">
  <div id="status">
        <div class="preloader-logo"></div>
        <h3 class="center-text">Welcome</h3>
        <p class="center-text smaller-text">
            We're loading the content, give us a second. This won't take long!
        </p>
    </div>
</div>
    
<div class="gallery-fix"></div> <!-- Important for all pages that have galleries or portfolios -->
    
<div id="header-fixed">
    <a class="header-logo" href="#"><img src="<?php echo base_url(); ?>/assets/images/f5-logo.png" alt="img"></a>
</div>    
            
<div class="all-elements">
    <div class="snap-drawers">
        <div class="snap-drawer snap-drawer-left"> 
            <div class="sidebar-logo">
                
            </div>
        </div>
        <div id="content" class="snap-content">
            <div class="content container-fullscreen no-bottom">
            <!--Page content goes here, fixed elements go above the all elements class-->
                
                <div class="pageapp-login bg-5 cover-screen">    
                    <div class="pageapp-login-content cover-center">
                        <div class="unboxed-layout">
                            <a class="pageapp-login-logo" href="#"></a>


                      <?php if($this->session->flashdata('message')){ ?>
                        <div class="static-notification bg-green-dark" id="Success">
                          <a class="static-notification-close"><i class="fa fa-times"></i></a>
                            <?php echo $this->session->flashdata('message'); ?>
                        </div>

                      <?php }else if($this->session->flashdata('error')){  ?>
                        <div class="static-notification bg-red-dark">
                           <a class="static-notification-close" onclick="$(this).parent().addClass('ng-hide')"><i class="fa fa-times"></i></a>
                            <?php echo $this->session->flashdata('error'); ?>
                        </div>
                      <?php }?> 

                      <?php echo form_open("auth/login");?>
                            <div class="pageapp-login-field">
                                <i class="fa fa-user"></i>
                                <input type="text" name="identity" onfocus="if (this.value=='Username') this.value = ''" onblur="if (this.value=='') this.value = 'Username'" ng-model="identity">
                            </div>
                            <div class="pageapp-login-field">
                                <i class="fa fa-lock"></i>
                                <input type="password" name="password" value="password" onfocus="if (this.value=='password') this.value = ''" onblur="if (this.value=='') this.value = 'password'" ng-model="password">
                            </div>
                            <button type="submit" class="button button-green button-round button-fullscreen">Login</button>
                        </form> 
                        <a href="<?php echo base_url('auth/forgot_password');?>" id="login-forget-link" class="col-xs-6"> Forgot password? </a>
                        </div>
                    </div>
                    <div class="overlay bg-black"></div>
                    
                </div>        
                
            <!-- End of entire page content-->
            </div> 
        </div>
    </div>  
    <a href="#" class="back-to-top-badge"><i class="fa fa-caret-up"></i>Back to top</a>
</div>
</body>