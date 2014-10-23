  <!DOCTYPE html>
<html class="bg-black">
    <head>
        <meta charset="UTF-8">
        <title>Cofee Cafe :: Coffee Shop & Premium Coffee Roaster {A gentle hum gets the day started}</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

        <link rel="shortcut icon" type="image/x-icon" href="<?php echo base_url()?>assests/img/favicon.ico">
        <!-- bootstrap 3.0.2 -->
        <link href="<?php echo base_url()?>assests/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="<?php echo base_url()?>assests/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="<?php echo base_url()?>assests/css/cofeeAPP.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- jQuery UI 1.10.3 -->
        <script src="<?=base_url('assests/js/jquery-ui-1.10.3.min.js')?>" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="<?=base_url('assests/js/bootstrap.min.js')?>" type="text/javascript"></script>
        <script type="text/javascript">
		$(document).ready(function()
		{
			$("#login_form input:first").focus();
		});
		</script>
    </head>
<body class="bg-black">
        <div class="form-box" id="login-box">
            <div class="header"><img src="<?php echo base_url()?>assests/img/morning_cofee.png" height="50x" width="50px" style="margin-right:10px;"/>Sign In</div>
            <form action="<?php echo base_url()?>index.php/login" method="post">

                <div class="body bg-gray">
                <div id="infoMessage"><?php echo validation_errors(); ?></div>
                    <div class="form-group">
                        <input type="text" name="username" class="form-control" placeholder="<?php echo $this->lang->line('login_username'); ?>" value="" id="identity"  />
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" placeholder="<?php echo $this->lang->line('login_password'); ?>" value="" id="password"  /> 
                    </div>          
                    <div class="form-group">
                       <input type="checkbox" name="remember" value="1" id="remember" />  Remeber Me
                    </div>
                </div>
                <div class="footer">                                                               
                   <!--  <button type="submit" class="btn bg-olive btn-block">Sign me in</button>   -->
                    <input type="submit" class="btn bg-olive btn-block" name="submit" value="Login"  />
                    
                    <p><a href="forgot_password">Forgot your password?</a></p>
                    
                    <a href="<?=base_url('register')?>" class="text-center">Register Shop Member</a>
                </div>
            </form>

            <!-- <div class="margin text-center">
                <span>Sign in using social networks</span>
                <br/>
                <button class="btn bg-light-blue btn-circle"><i class="fa fa-facebook"></i></button>
                <button class="btn bg-aqua btn-circle"><i class="fa fa-twitter"></i></button>
                <button class="btn bg-red btn-circle"><i class="fa fa-google-plus"></i></button>

            </div> -->
        </div>



</body>
</html>
