<!DOCTYPE html>
<html>
<head>

	<title>Create New Password</title>
	<style type="text/css">
	#login-logo {
    background: none repeat scroll 0 0 #34495e;
    color: #fff;
    display: block;
    font-size: 2em;
    font-weight: 400;
    padding: 35px 0;
    text-align: center;
    text-transform: uppercase;
}
.container{
	width: 1170px;
	margin:0 auto; 

}
#login-box {
    max-width: 350px;
    min-width: 280px;
    margin: 60px auto 20px;
    overflow: hidden;
    border-radius: 3px 3px 0 0;
    background-clip: padding-box;
}
#login-logo>img {
    display: block;
    height: 40px;
    margin: 0 auto;
}
#login-box-inner {
    background: #fff;
    border-radius: 0 0 3px 3px;
    background-clip: padding-box;
    border: 1px solid #e1e1e1;
    border-bottom-width: 5px;
    padding: 40px 25px;
}
.form-control {
    background-clip: none;
    border-width: 2px;
    font-size: 13px;
    padding: 5px 20px;
    margin-left: 40px;
   
}
input[type="submit"] {
    padding: 10px 126px;
    background-color: #1abc9c;
    border: none;
}
label {
    margin-left: 25px;
}
	</style>
</head>
<body>
<div class="container">
<div class="row">
<div id="login-box">
<h1><?php echo lang('reset_password_heading');?></h1>
<div id="login-logo">
<img src="<?php //echo base_url();?>assets/img/f5.png" alt=""/>
</div>
<div id="login-box-inner">

<div id="infoMessage"><?php echo $message;?></div>

<?php echo form_open('auth/reset_password/' . $code);?>

    <p>
        <label for="new_password"><?php echo sprintf(lang('reset_password_new_password_label'), $min_password_length);?></label> <br />
        <?php echo form_input($new_password);?>
    </p>

    <p>
        <?php echo lang('reset_password_new_password_confirm_label', 'new_password_confirm');?> <br />
        <?php echo form_input($new_password_confirm);?>
    </p>

    <?php echo form_input($user_id);?>
    <?php echo form_hidden($csrf); ?>

    <p><?php echo form_submit('submit', lang('reset_password_submit_btn'));?></p>

<?php echo form_close();?>
</div>
</div>
</div>
</div>
</body>
</html>