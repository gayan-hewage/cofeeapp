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
                        Employee
                        <small>List of emaployee</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Tables</a></li>
                        <li class="active">Data tables</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
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
												<td>First Name</td>
												<td>Last Name</td>
												<th>Employee ID</th> 
                                                <th>Employee Name</th> 
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <?php foreach ($locations as $key => $value) {?>
                                            <tr id="<?=$value['shop_code']?>">
                                                <td><?=$value['name']?></td>
                                                <td><?=$value['address']?></td>
                                                <td><?=$value['open_hours']?> AM - <?=$value['closed_hours']?> PM</td>
                                                <td><?=$value['contact_no']?></td>                                                
                                                <td>$ <?=$value['saving_upto']?></td>
                                            </tr>
                                        <?php }?>
                                            
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th></th>
                                                <th>Shop Name</th>
                                                <th>Open Hours</th>
                                                <th>Closed Hours</th>
                                                <th>Saving Up</th>
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
                
                $("#example1").dataTable({
                    dom: 'T<"clear">lfrtip',
                    tableTools: {
                        "sRowSelect": "single"
                    },
                    "rowCallback": function( row, data, displayIndex ) {
                        if ( $.inArray(data.DT_RowId, selected) !== -1 ) {
                            $(row).addClass('selected');
                        }
                    }
                });

               

                 $('#example1 tbody').on('click', 'tr', function () {
                    var id = this.id;

                    console.log(id);
                    var index = $.inArray(id, selected);
             
                    if ( index === -1 ) {
                        selected.push( id );
                    } else {
                        selected.splice( index, 1 );
                    }
             
                    $(this).toggleClass('selected');
                } );


            });
        </script>

    </body>
</html>