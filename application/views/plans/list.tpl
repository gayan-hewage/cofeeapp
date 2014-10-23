<?php $this->load->view("partial/header.tpl"); ?>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">                
                <!-- sidebar: style can be found in sidebar.less -->
                <?php $this->load->view("partial/sidebar.tpl"); ?>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">                
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                       Store Plans
                        <small>Cofee shops, Resturants, Salons</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Tables</a></li>
                        <li class="active">Data tables</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    
                      <div class="delete_alert_bar alert alert-success bs-alert-old-docs " style="display: none;">
                            <strong>Delete</strong>  has been success. 
                        </div>
                    
                    <div class="row">
                        <div class="col-xs-12">
                           
                            <div class="box">
                                <div class="box-header">
                                   <!--  <h3 class="box-title">Data Table With Full Features</h3>       -->                              
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Description</th>
                                                <th>Quantity</th>
                                                <th> price</th>
                                                <th>frequency</th>
                                                <th> start_date</th>
                                                <th>end_date </th>
                                                <th> location</th>
                                                <th> category</th>
                                                <th> status</th>
                                                <th>Action </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <?php foreach ($plans as $key => $value) {?>
                                            <tr>
                                                <td><?=$value['name']?></td>
                                                <td><?=$value['description']?></td>
                                                <td><?=$value['quantity']?> </td>
                                                <td><?=$value['price']?></td>                                                
                                                <td><?=$value['frequency']?></td>
                                                <td> <?=$value['start_date']?></td>
                                                <td> <?=$value['end_date']?></td>
                                                <td> <?=$value['location']?></td>
                                                <td> <?=$value['category']?></td>
                                                <td> <?=$value['status']?></td>
                                                <td>
                                                    <a href="<?= site_url('plans/edit/' . $value['plan_id']); ?>">Edit</a>
                                                    <a  href="#" class="detele_plan" value="<?= $value['plan_id'] ?>">Delete</a>
                                                </td> 
                                            </tr>
                                        <?php }?>
                                            
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Name</th>
                                                <th>Description</th>
                                                <th>Quantity</th>
                                                <th> price</th>
                                                <th>frequency</th>
                                                <th> start_date</th>
                                                <th>end_date </th>
                                                <th> location</th>
                                                <th> category</th>
                                                <th> status</th>
                                                <th>Action </th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                    </div>

                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->


        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="<?=base_url('assests/js/bootstrap.min.js')?>" type="text/javascript"></script>
        <!-- DATA TABES SCRIPT -->
        <script src="<?=base_url('assests/js/plugins/datatables/jquery.dataTables.js')?>" type="text/javascript"></script>
        <script src="<?=base_url('assests/js/plugins/datatables/dataTables.bootstrap.js')?>" type="text/javascript"></script>
        <!-- AdminLTE App -->
        <script src="<?=base_url('assests/js/CofeeApp/app.js')?>" type="text/javascript"></script>
        <!-- AdminLTE for demo purposes 
        <script src="js/AdminLTE/demo.js" type="text/javascript"></script>-->
        <!-- page script -->
        <script type="text/javascript">
            $(function() {
                var selected = [];
                $('#example1 tbody').on('click', 'tr', function () {
                    var id = this.id;
                    var index = $.inArray(id, selected);

                    if ( index === -1 ) {
                        selected.push( id );
                    } else {
                        selected.splice( index, 1 );
                    }

                    $(this).toggleClass('selected');
                } );

                $("#example1").dataTable({
                    // "processing": true,
                    // "serverSide": true,
                    // "ajax": "scripts/ids-arrays.php",
                    "rowCallback": function( row, data, displayIndex ) {
                        if ( $.inArray(data.DT_RowId, selected) !== -1 ) {
                            $(row).addClass('selected');
                        }
                    }
                });
            });
        </script>

        
                <script type="text/javascript">
            $(document).ready(function() { 
              
                 $('.detele_plan').click(function() {
                        var plan_id  = $(this).attr('value'); 
                         
                         $.ajax({
                            method: "post",
                            url: "<?php echo base_url('index.php/plans/delete_item'); ?>",
                            dataType: 'json',
                            data: {
                                plan_id: plan_id
                    },
                    success: function(data) {
                        //alert(data);
                        $('.delete_alert_bar').css("display","block");
                         setInterval("location.reload();", 1500);
                        //console.log(data);
                    }
                });

               
               
                  });
            });
            </script>
            
            
    </body>
</html>