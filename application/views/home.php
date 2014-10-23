
<?php $this->load->view("partial/header.tpl"); ?>

        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                    <!-- /.search form -->
                    <?php $this->load->view("partial/sidebar.tpl"); ?>
            
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <?php if($this->session->userdata('shop_id')){?>
                <section class="content-header">
                
                    <h1>
                        <?php echo $shop->shop_code .'-'. $shop->name; ?>
                        <small><?php echo $shop->address; ?></small>
                    </h1>
                
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Dashboard</li>
                    </ol>
                </section>
                <?php }?>
                <!-- Main content -->
                <!-- /.content -->
            </aside><!-- /.right-side -->


            <!-- RIGHT SIDE -->
                        <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                <?php 
                if($set_location == 'false'){?>
                    <h1>
                       Please Select Location to proceed
                        <small>Control panel</small>
                    </h1>
                <?php }?>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Dashboard</li>
                    </ol>
                </section>

                <!-- Main content -->

                <!-- /.content -->
            </aside><!-- /.right-side -->

        </div><!-- ./wrapper -->


                    <section class="content">
                    <!-- Small boxes (Stat box) -->
                    
                    </section>

        <!-- add new calendar event modal -->

<?php $this->load->view("partial/footer.tpl"); ?>

